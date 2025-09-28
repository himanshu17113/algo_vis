// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SortModel {

 int get value; GlobalKey get key; SortState get state;
/// Create a copy of SortModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortModelCopyWith<SortModel> get copyWith => _$SortModelCopyWithImpl<SortModel>(this as SortModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortModel&&(identical(other.value, value) || other.value == value)&&(identical(other.key, key) || other.key == key)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,value,key,state);

@override
String toString() {
  return 'SortModel(value: $value, key: $key, state: $state)';
}


}

/// @nodoc
abstract mixin class $SortModelCopyWith<$Res>  {
  factory $SortModelCopyWith(SortModel value, $Res Function(SortModel) _then) = _$SortModelCopyWithImpl;
@useResult
$Res call({
 int value, GlobalKey key, SortState state
});




}
/// @nodoc
class _$SortModelCopyWithImpl<$Res>
    implements $SortModelCopyWith<$Res> {
  _$SortModelCopyWithImpl(this._self, this._then);

  final SortModel _self;
  final $Res Function(SortModel) _then;

/// Create a copy of SortModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? key = null,Object? state = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as GlobalKey,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SortState,
  ));
}

}


/// Adds pattern-matching-related methods to [SortModel].
extension SortModelPatterns on SortModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SortModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SortModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SortModel value)  $default,){
final _that = this;
switch (_that) {
case _SortModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SortModel value)?  $default,){
final _that = this;
switch (_that) {
case _SortModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int value,  GlobalKey key,  SortState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SortModel() when $default != null:
return $default(_that.value,_that.key,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int value,  GlobalKey key,  SortState state)  $default,) {final _that = this;
switch (_that) {
case _SortModel():
return $default(_that.value,_that.key,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int value,  GlobalKey key,  SortState state)?  $default,) {final _that = this;
switch (_that) {
case _SortModel() when $default != null:
return $default(_that.value,_that.key,_that.state);case _:
  return null;

}
}

}

/// @nodoc


class _SortModel implements SortModel {
  const _SortModel({required this.value, required this.key, this.state = SortState.open});
  

@override final  int value;
@override final  GlobalKey key;
@override@JsonKey() final  SortState state;

/// Create a copy of SortModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortModelCopyWith<_SortModel> get copyWith => __$SortModelCopyWithImpl<_SortModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortModel&&(identical(other.value, value) || other.value == value)&&(identical(other.key, key) || other.key == key)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,value,key,state);

@override
String toString() {
  return 'SortModel(value: $value, key: $key, state: $state)';
}


}

/// @nodoc
abstract mixin class _$SortModelCopyWith<$Res> implements $SortModelCopyWith<$Res> {
  factory _$SortModelCopyWith(_SortModel value, $Res Function(_SortModel) _then) = __$SortModelCopyWithImpl;
@override @useResult
$Res call({
 int value, GlobalKey key, SortState state
});




}
/// @nodoc
class __$SortModelCopyWithImpl<$Res>
    implements _$SortModelCopyWith<$Res> {
  __$SortModelCopyWithImpl(this._self, this._then);

  final _SortModel _self;
  final $Res Function(_SortModel) _then;

/// Create a copy of SortModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? key = null,Object? state = null,}) {
  return _then(_SortModel(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as GlobalKey,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as SortState,
  ));
}


}

// dart format on
