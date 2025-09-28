// base_provider.dart
import 'dart:async';
import 'package:flutter/material.dart';

// The enum definition from above
enum ExecutionState { initial, running, paused, completed }

abstract class BaseAlgorithmProvider extends ChangeNotifier {
  // --- STATE MANAGEMENT ---
  final ValueNotifier<ExecutionState> _state = ValueNotifier(ExecutionState.initial);
  ValueNotifier<ExecutionState> get state => _state;
  ExecutionState get getState => _state.value;

  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;

  // --- PRIVATE STATE ---
  Completer? _pauseCompleter;
  bool isCancelled = false;

  // --- PUBLIC CONTROL METHODS ---

  Future<void> start() async {
    // Stop any previous run before starting a new one
    if (getState == ExecutionState.running || getState == ExecutionState.paused) {
      await stop();
      await Future.delayed(const Duration(milliseconds: 50));
    }

    // Reset data before starting a sort from a completed state
    if (getState == ExecutionState.completed) {
      generateData();
    }

    isCancelled = false;
    _state.value = ExecutionState.running;
    notifyListeners();

    try {
      await runAlgorithm();
    } catch (e) {
      debugPrint("Algorithm execution error: $e");
    } finally {
      // Only change state if it wasn't cancelled.
      if (!isCancelled) {
        _state.value = ExecutionState.completed;
        onAlgorithmCompleted(); // Call completion hook
      } else {
        // If cancelled, go back to initial state
        _state.value = ExecutionState.initial;
      }
      notifyListeners();
    }
  }

  void pause() {
    if (getState != ExecutionState.running) return;
    _state.value = ExecutionState.paused;
    notifyListeners();
  }

  void resume() {
    if (getState != ExecutionState.paused) return;
    _state.value = ExecutionState.running;
    if (_pauseCompleter != null && !_pauseCompleter!.isCompleted) {
      _pauseCompleter!.complete();
    }
    notifyListeners();
  }

  set executionSpeed(double speed) {
    _executionSpeed = speed.clamp(0.0, 1.0);
    notifyListeners();
  }

  // --- PROTECTED / INTERNAL METHODS ---

  @protected
  Future<void> stop() async {
    if (getState != ExecutionState.running && getState != ExecutionState.paused) return;
    isCancelled = true;
    if (getState == ExecutionState.paused) {
      resume(); // Unpause to allow the algorithm loop to terminate
    }
  }

  @protected
  Future<void> wait() async {
    
    final maxDelay = Durations.extralong2.inMilliseconds;
    final delay = (maxDelay * (1.0 - executionSpeed)).round();
    await Future.delayed(Duration(milliseconds: delay));

    if (getState == ExecutionState.paused) {
      _pauseCompleter = Completer();
      await _pauseCompleter!.future;
    }
  }

  // --- ABSTRACT METHODS (for subclasses to implement) ---
  @protected
  void generateData();

  @protected
  Future<void> runAlgorithm();

  @protected
  void onAlgorithmCompleted();

  @protected
  void reset();
}
