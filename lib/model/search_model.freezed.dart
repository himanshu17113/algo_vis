// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchModel {

 int get value; SearchState get state; Color get color; GlobalKey get key;
/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchModelCopyWith<SearchModel> get copyWith => _$SearchModelCopyWithImpl<SearchModel>(this as SearchModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchModel&&(identical(other.value, value) || other.value == value)&&(identical(other.state, state) || other.state == state)&&(identical(other.color, color) || other.color == color)&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,value,state,color,key);

@override
String toString() {
  return 'SearchModel(value: $value, state: $state, color: $color, key: $key)';
}


}

/// @nodoc
abstract mixin class $SearchModelCopyWith<$Res>  {
  factory $SearchModelCopyWith(SearchModel value, $Res Function(SearchModel) _then) = _$SearchModelCopyWithImpl;
@useResult
$Res call({
 int value, SearchState state, Color color, GlobalKey key
});




}
/// @nodoc
class _$SearchModelCopyWithImpl<$Res>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._self, this._then);

  final SearchModel _self;
  final $Res Function(SearchModel) _then;

/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? state = null,Object? color = null,Object? key = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SearchState,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as GlobalKey,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchModel].
extension SearchModelPatterns on SearchModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int value,  SearchState state,  Color color,  GlobalKey key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that.value,_that.state,_that.color,_that.key);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int value,  SearchState state,  Color color,  GlobalKey key)  $default,) {final _that = this;
switch (_that) {
case _SearchModel():
return $default(_that.value,_that.state,_that.color,_that.key);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int value,  SearchState state,  Color color,  GlobalKey key)?  $default,) {final _that = this;
switch (_that) {
case _SearchModel() when $default != null:
return $default(_that.value,_that.state,_that.color,_that.key);case _:
  return null;

}
}

}

/// @nodoc


class _SearchModel implements SearchModel {
  const _SearchModel({required this.value, this.state = SearchState.open, this.color = Colors.black54, required this.key});
  

@override final  int value;
@override@JsonKey() final  SearchState state;
@override@JsonKey() final  Color color;
@override final  GlobalKey key;

/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchModelCopyWith<_SearchModel> get copyWith => __$SearchModelCopyWithImpl<_SearchModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchModel&&(identical(other.value, value) || other.value == value)&&(identical(other.state, state) || other.state == state)&&(identical(other.color, color) || other.color == color)&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,value,state,color,key);

@override
String toString() {
  return 'SearchModel(value: $value, state: $state, color: $color, key: $key)';
}


}

/// @nodoc
abstract mixin class _$SearchModelCopyWith<$Res> implements $SearchModelCopyWith<$Res> {
  factory _$SearchModelCopyWith(_SearchModel value, $Res Function(_SearchModel) _then) = __$SearchModelCopyWithImpl;
@override @useResult
$Res call({
 int value, SearchState state, Color color, GlobalKey key
});




}
/// @nodoc
class __$SearchModelCopyWithImpl<$Res>
    implements _$SearchModelCopyWith<$Res> {
  __$SearchModelCopyWithImpl(this._self, this._then);

  final _SearchModel _self;
  final $Res Function(_SearchModel) _then;

/// Create a copy of SearchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? state = null,Object? color = null,Object? key = null,}) {
  return _then(_SearchModel(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SearchState,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as GlobalKey,
  ));
}


}

// dart format on
