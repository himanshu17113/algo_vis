import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';

enum SearchState { open, discard, search, searched, found }

@freezed
abstract class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int value,
    @Default(SearchState.open) SearchState state,
    @Default(Colors.black54)   Color color,
    required GlobalKey key,
  }) = _SearchModel;

  factory SearchModel.initial(int value) => SearchModel(value: value, state: SearchState.open, color: Colors.black54, key: GlobalKey());
}

// Extension methods to replicate the original functionality
extension SearchModelMethods on SearchModel {
  SearchModel reset() => copyWith(state: SearchState.open);

  SearchModel potential()  => copyWith(state: SearchState.search);
 

  SearchModel discard() => copyWith(state: SearchState.discard, );
 

  SearchModel found() => copyWith(state: SearchState.found );
 

  SearchModel searched() => copyWith(state: SearchState.searched);
  
}
