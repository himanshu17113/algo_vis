import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Required for code generation
part 'sort_model.freezed.dart';

enum SortState { open, sort, sorted, pivot }

@freezed
abstract class SortModel with _$SortModel {
  const factory SortModel({required int value, required GlobalKey key, @Default(SortState.open) SortState state}) = _SortModel;

  // Factory constructor for initial creation
  factory SortModel.create(int value) {
    return SortModel(value: value, key: GlobalKey());
  }
}

// Extension methods for state transitions
extension SortModelExtension on SortModel {
  SortModel reset() {
    return copyWith(state: SortState.open);
  }

  SortModel sort() {
    return copyWith(state: SortState.sort);
  }

  SortModel sorted() {
    return copyWith(state: SortState.sorted);
  }

  SortModel pivot() {
    return copyWith(state: SortState.pivot);
  }
}
