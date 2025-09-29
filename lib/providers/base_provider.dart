import 'dart:async';
import 'package:flutter/material.dart';

// The generic state enum you suggested.
enum ExecutionState { initial, running, paused, completed }

abstract class ExecutionProvider extends ChangeNotifier {
  // --- STATE MANAGEMENT ---
  final ValueNotifier<ExecutionState> executionState = ValueNotifier(ExecutionState.initial);

  ValueNotifier<ExecutionState> get state => executionState;

  bool isCancelled = false;
  Completer? _pauseCompleter;
  double _executionSpeed = 0.5;

  // --- PUBLIC CONTROLS ---

  /// Starts the execution. This is the main entry point for the UI.
  Future<void> start([int? value]) async {
    // Prevent starting if already running
    if (executionState.value == ExecutionState.running || executionState.value == ExecutionState.paused) {
      return;
    }

    isCancelled = false;
    executionState.value = ExecutionState.running;
    // Await the specific work defined by the subclass
    await onExecute(value);
    // Set final state only if the process wasn't cancelled
    if (!isCancelled) {
      executionState.value = ExecutionState.completed;
    }
  }

  /// Pauses the current execution.
  void pause() {
    if (executionState.value != ExecutionState.running) return;
    executionState.value = ExecutionState.paused;
  }

  /// Resumes a paused execution.
  void resume() {
    if (executionState.value != ExecutionState.paused) return;
    executionState.value = ExecutionState.running;
    if (_pauseCompleter != null && !_pauseCompleter!.isCompleted) {
      _pauseCompleter!.complete();
    }
  }

  /// Stops and resets the execution.
  void stop() {
    isCancelled = true;
    if (executionState.value == ExecutionState.paused) {
      resume(); // Unblock the _waitStep() method to allow termination
    }
    onReset(); // Let the subclass reset
    executionState.value = ExecutionState.initial;
  }

  // --- PROTECTED METHODS FOR SUBCLASSES ---

  /// The pausable delay method for subclasses to use in their algorithms.

  @protected
  Future<void> wait() async {
    final maxDelay = Durations.extralong2.inMilliseconds;
    final delay = (maxDelay * (1.0 - executionSpeed)).round();
    await Future.delayed(Duration(milliseconds: delay));

    if (state.value == ExecutionState.paused) {
      _pauseCompleter = Completer();
      await _pauseCompleter!.future;
    }
  }

  // --- ABSTRACT METHODS (Subclasses MUST implement these) ---

  /// Subclasses implement this method to perform their specific algorithm.
  @protected
  Future<void> onExecute([int? value]);

  /// Subclasses implement this to handle resetting their specific data (e.g., bar colors).
  @protected
  void onReset();

  // --- GETTERS/SETTERS & DISPOSE ---

  double get executionSpeed => _executionSpeed;
  set executionSpeed(double speed) {
    _executionSpeed = speed.clamp(0.0, 1.0);
    notifyListeners();
  }

  @override
  void dispose() {
    executionState.dispose();
    super.dispose();
  }
}
