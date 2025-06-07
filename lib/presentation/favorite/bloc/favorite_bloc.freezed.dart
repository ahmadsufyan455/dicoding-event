// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EventEntity data) addToFavorite,
    required TResult Function(int id) removeFromFavorite,
    required TResult Function(int id) loadFavoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EventEntity data)? addToFavorite,
    TResult? Function(int id)? removeFromFavorite,
    TResult? Function(int id)? loadFavoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EventEntity data)? addToFavorite,
    TResult Function(int id)? removeFromFavorite,
    TResult Function(int id)? loadFavoriteStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToFavorite value) addToFavorite,
    required TResult Function(_RemoveFromFavorite value) removeFromFavorite,
    required TResult Function(_LoadFavoriteStatus value) loadFavoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToFavorite value)? addToFavorite,
    TResult? Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult? Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToFavorite value)? addToFavorite,
    TResult Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
    FavoriteEvent value,
    $Res Function(FavoriteEvent) then,
  ) = _$FavoriteEventCopyWithImpl<$Res, FavoriteEvent>;
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res, $Val extends FavoriteEvent>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddToFavoriteImplCopyWith<$Res> {
  factory _$$AddToFavoriteImplCopyWith(
    _$AddToFavoriteImpl value,
    $Res Function(_$AddToFavoriteImpl) then,
  ) = __$$AddToFavoriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EventEntity data});
}

/// @nodoc
class __$$AddToFavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$AddToFavoriteImpl>
    implements _$$AddToFavoriteImplCopyWith<$Res> {
  __$$AddToFavoriteImplCopyWithImpl(
    _$AddToFavoriteImpl _value,
    $Res Function(_$AddToFavoriteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$AddToFavoriteImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as EventEntity,
      ),
    );
  }
}

/// @nodoc

class _$AddToFavoriteImpl implements _AddToFavorite {
  const _$AddToFavoriteImpl(this.data);

  @override
  final EventEntity data;

  @override
  String toString() {
    return 'FavoriteEvent.addToFavorite(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToFavoriteImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToFavoriteImplCopyWith<_$AddToFavoriteImpl> get copyWith =>
      __$$AddToFavoriteImplCopyWithImpl<_$AddToFavoriteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EventEntity data) addToFavorite,
    required TResult Function(int id) removeFromFavorite,
    required TResult Function(int id) loadFavoriteStatus,
  }) {
    return addToFavorite(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EventEntity data)? addToFavorite,
    TResult? Function(int id)? removeFromFavorite,
    TResult? Function(int id)? loadFavoriteStatus,
  }) {
    return addToFavorite?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EventEntity data)? addToFavorite,
    TResult Function(int id)? removeFromFavorite,
    TResult Function(int id)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (addToFavorite != null) {
      return addToFavorite(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToFavorite value) addToFavorite,
    required TResult Function(_RemoveFromFavorite value) removeFromFavorite,
    required TResult Function(_LoadFavoriteStatus value) loadFavoriteStatus,
  }) {
    return addToFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToFavorite value)? addToFavorite,
    TResult? Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult? Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
  }) {
    return addToFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToFavorite value)? addToFavorite,
    TResult Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (addToFavorite != null) {
      return addToFavorite(this);
    }
    return orElse();
  }
}

abstract class _AddToFavorite implements FavoriteEvent {
  const factory _AddToFavorite(final EventEntity data) = _$AddToFavoriteImpl;

  EventEntity get data;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToFavoriteImplCopyWith<_$AddToFavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromFavoriteImplCopyWith<$Res> {
  factory _$$RemoveFromFavoriteImplCopyWith(
    _$RemoveFromFavoriteImpl value,
    $Res Function(_$RemoveFromFavoriteImpl) then,
  ) = __$$RemoveFromFavoriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveFromFavoriteImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$RemoveFromFavoriteImpl>
    implements _$$RemoveFromFavoriteImplCopyWith<$Res> {
  __$$RemoveFromFavoriteImplCopyWithImpl(
    _$RemoveFromFavoriteImpl _value,
    $Res Function(_$RemoveFromFavoriteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$RemoveFromFavoriteImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoveFromFavoriteImpl implements _RemoveFromFavorite {
  const _$RemoveFromFavoriteImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteEvent.removeFromFavorite(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromFavoriteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromFavoriteImplCopyWith<_$RemoveFromFavoriteImpl> get copyWith =>
      __$$RemoveFromFavoriteImplCopyWithImpl<_$RemoveFromFavoriteImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EventEntity data) addToFavorite,
    required TResult Function(int id) removeFromFavorite,
    required TResult Function(int id) loadFavoriteStatus,
  }) {
    return removeFromFavorite(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EventEntity data)? addToFavorite,
    TResult? Function(int id)? removeFromFavorite,
    TResult? Function(int id)? loadFavoriteStatus,
  }) {
    return removeFromFavorite?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EventEntity data)? addToFavorite,
    TResult Function(int id)? removeFromFavorite,
    TResult Function(int id)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (removeFromFavorite != null) {
      return removeFromFavorite(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToFavorite value) addToFavorite,
    required TResult Function(_RemoveFromFavorite value) removeFromFavorite,
    required TResult Function(_LoadFavoriteStatus value) loadFavoriteStatus,
  }) {
    return removeFromFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToFavorite value)? addToFavorite,
    TResult? Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult? Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
  }) {
    return removeFromFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToFavorite value)? addToFavorite,
    TResult Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (removeFromFavorite != null) {
      return removeFromFavorite(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromFavorite implements FavoriteEvent {
  const factory _RemoveFromFavorite(final int id) = _$RemoveFromFavoriteImpl;

  int get id;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveFromFavoriteImplCopyWith<_$RemoveFromFavoriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFavoriteStatusImplCopyWith<$Res> {
  factory _$$LoadFavoriteStatusImplCopyWith(
    _$LoadFavoriteStatusImpl value,
    $Res Function(_$LoadFavoriteStatusImpl) then,
  ) = __$$LoadFavoriteStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadFavoriteStatusImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$LoadFavoriteStatusImpl>
    implements _$$LoadFavoriteStatusImplCopyWith<$Res> {
  __$$LoadFavoriteStatusImplCopyWithImpl(
    _$LoadFavoriteStatusImpl _value,
    $Res Function(_$LoadFavoriteStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$LoadFavoriteStatusImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$LoadFavoriteStatusImpl implements _LoadFavoriteStatus {
  const _$LoadFavoriteStatusImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteEvent.loadFavoriteStatus(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFavoriteStatusImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFavoriteStatusImplCopyWith<_$LoadFavoriteStatusImpl> get copyWith =>
      __$$LoadFavoriteStatusImplCopyWithImpl<_$LoadFavoriteStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EventEntity data) addToFavorite,
    required TResult Function(int id) removeFromFavorite,
    required TResult Function(int id) loadFavoriteStatus,
  }) {
    return loadFavoriteStatus(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EventEntity data)? addToFavorite,
    TResult? Function(int id)? removeFromFavorite,
    TResult? Function(int id)? loadFavoriteStatus,
  }) {
    return loadFavoriteStatus?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EventEntity data)? addToFavorite,
    TResult Function(int id)? removeFromFavorite,
    TResult Function(int id)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (loadFavoriteStatus != null) {
      return loadFavoriteStatus(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToFavorite value) addToFavorite,
    required TResult Function(_RemoveFromFavorite value) removeFromFavorite,
    required TResult Function(_LoadFavoriteStatus value) loadFavoriteStatus,
  }) {
    return loadFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToFavorite value)? addToFavorite,
    TResult? Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult? Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
  }) {
    return loadFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToFavorite value)? addToFavorite,
    TResult Function(_RemoveFromFavorite value)? removeFromFavorite,
    TResult Function(_LoadFavoriteStatus value)? loadFavoriteStatus,
    required TResult orElse(),
  }) {
    if (loadFavoriteStatus != null) {
      return loadFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _LoadFavoriteStatus implements FavoriteEvent {
  const factory _LoadFavoriteStatus(final int id) = _$LoadFavoriteStatusImpl;

  int get id;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadFavoriteStatusImplCopyWith<_$LoadFavoriteStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) successMessage,
    required TResult Function(String message) failedMessage,
    required TResult Function(bool isFavorite) favoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? successMessage,
    TResult? Function(String message)? failedMessage,
    TResult? Function(bool isFavorite)? favoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? successMessage,
    TResult Function(String message)? failedMessage,
    TResult Function(bool isFavorite)? favoriteStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessMessage value) successMessage,
    required TResult Function(_FailedMessage value) failedMessage,
    required TResult Function(_FavoriteStatus value) favoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessMessage value)? successMessage,
    TResult? Function(_FailedMessage value)? failedMessage,
    TResult? Function(_FavoriteStatus value)? favoriteStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessMessage value)? successMessage,
    TResult Function(_FailedMessage value)? failedMessage,
    TResult Function(_FavoriteStatus value)? favoriteStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
    FavoriteState value,
    $Res Function(FavoriteState) then,
  ) = _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) successMessage,
    required TResult Function(String message) failedMessage,
    required TResult Function(bool isFavorite) favoriteStatus,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? successMessage,
    TResult? Function(String message)? failedMessage,
    TResult? Function(bool isFavorite)? favoriteStatus,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? successMessage,
    TResult Function(String message)? failedMessage,
    TResult Function(bool isFavorite)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessMessage value) successMessage,
    required TResult Function(_FailedMessage value) failedMessage,
    required TResult Function(_FavoriteStatus value) favoriteStatus,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessMessage value)? successMessage,
    TResult? Function(_FailedMessage value)? failedMessage,
    TResult? Function(_FavoriteStatus value)? favoriteStatus,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessMessage value)? successMessage,
    TResult Function(_FailedMessage value)? failedMessage,
    TResult Function(_FavoriteStatus value)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavoriteState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessMessageImplCopyWith<$Res> {
  factory _$$SuccessMessageImplCopyWith(
    _$SuccessMessageImpl value,
    $Res Function(_$SuccessMessageImpl) then,
  ) = __$$SuccessMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessMessageImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$SuccessMessageImpl>
    implements _$$SuccessMessageImplCopyWith<$Res> {
  __$$SuccessMessageImplCopyWithImpl(
    _$SuccessMessageImpl _value,
    $Res Function(_$SuccessMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessMessageImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessMessageImpl implements _SuccessMessage {
  const _$SuccessMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteState.successMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessMessageImplCopyWith<_$SuccessMessageImpl> get copyWith =>
      __$$SuccessMessageImplCopyWithImpl<_$SuccessMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) successMessage,
    required TResult Function(String message) failedMessage,
    required TResult Function(bool isFavorite) favoriteStatus,
  }) {
    return successMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? successMessage,
    TResult? Function(String message)? failedMessage,
    TResult? Function(bool isFavorite)? favoriteStatus,
  }) {
    return successMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? successMessage,
    TResult Function(String message)? failedMessage,
    TResult Function(bool isFavorite)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (successMessage != null) {
      return successMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessMessage value) successMessage,
    required TResult Function(_FailedMessage value) failedMessage,
    required TResult Function(_FavoriteStatus value) favoriteStatus,
  }) {
    return successMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessMessage value)? successMessage,
    TResult? Function(_FailedMessage value)? failedMessage,
    TResult? Function(_FavoriteStatus value)? favoriteStatus,
  }) {
    return successMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessMessage value)? successMessage,
    TResult Function(_FailedMessage value)? failedMessage,
    TResult Function(_FavoriteStatus value)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (successMessage != null) {
      return successMessage(this);
    }
    return orElse();
  }
}

abstract class _SuccessMessage implements FavoriteState {
  const factory _SuccessMessage(final String message) = _$SuccessMessageImpl;

  String get message;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessMessageImplCopyWith<_$SuccessMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedMessageImplCopyWith<$Res> {
  factory _$$FailedMessageImplCopyWith(
    _$FailedMessageImpl value,
    $Res Function(_$FailedMessageImpl) then,
  ) = __$$FailedMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedMessageImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FailedMessageImpl>
    implements _$$FailedMessageImplCopyWith<$Res> {
  __$$FailedMessageImplCopyWithImpl(
    _$FailedMessageImpl _value,
    $Res Function(_$FailedMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FailedMessageImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FailedMessageImpl implements _FailedMessage {
  const _$FailedMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavoriteState.failedMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedMessageImplCopyWith<_$FailedMessageImpl> get copyWith =>
      __$$FailedMessageImplCopyWithImpl<_$FailedMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) successMessage,
    required TResult Function(String message) failedMessage,
    required TResult Function(bool isFavorite) favoriteStatus,
  }) {
    return failedMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? successMessage,
    TResult? Function(String message)? failedMessage,
    TResult? Function(bool isFavorite)? favoriteStatus,
  }) {
    return failedMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? successMessage,
    TResult Function(String message)? failedMessage,
    TResult Function(bool isFavorite)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (failedMessage != null) {
      return failedMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessMessage value) successMessage,
    required TResult Function(_FailedMessage value) failedMessage,
    required TResult Function(_FavoriteStatus value) favoriteStatus,
  }) {
    return failedMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessMessage value)? successMessage,
    TResult? Function(_FailedMessage value)? failedMessage,
    TResult? Function(_FavoriteStatus value)? favoriteStatus,
  }) {
    return failedMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessMessage value)? successMessage,
    TResult Function(_FailedMessage value)? failedMessage,
    TResult Function(_FavoriteStatus value)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (failedMessage != null) {
      return failedMessage(this);
    }
    return orElse();
  }
}

abstract class _FailedMessage implements FavoriteState {
  const factory _FailedMessage(final String message) = _$FailedMessageImpl;

  String get message;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedMessageImplCopyWith<_$FailedMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteStatusImplCopyWith<$Res> {
  factory _$$FavoriteStatusImplCopyWith(
    _$FavoriteStatusImpl value,
    $Res Function(_$FavoriteStatusImpl) then,
  ) = __$$FavoriteStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFavorite});
}

/// @nodoc
class __$$FavoriteStatusImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStatusImpl>
    implements _$$FavoriteStatusImplCopyWith<$Res> {
  __$$FavoriteStatusImplCopyWithImpl(
    _$FavoriteStatusImpl _value,
    $Res Function(_$FavoriteStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isFavorite = null}) {
    return _then(
      _$FavoriteStatusImpl(
        null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$FavoriteStatusImpl implements _FavoriteStatus {
  const _$FavoriteStatusImpl(this.isFavorite);

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteState.favoriteStatus(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStatusImpl &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStatusImplCopyWith<_$FavoriteStatusImpl> get copyWith =>
      __$$FavoriteStatusImplCopyWithImpl<_$FavoriteStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) successMessage,
    required TResult Function(String message) failedMessage,
    required TResult Function(bool isFavorite) favoriteStatus,
  }) {
    return favoriteStatus(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? successMessage,
    TResult? Function(String message)? failedMessage,
    TResult? Function(bool isFavorite)? favoriteStatus,
  }) {
    return favoriteStatus?.call(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? successMessage,
    TResult Function(String message)? failedMessage,
    TResult Function(bool isFavorite)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (favoriteStatus != null) {
      return favoriteStatus(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SuccessMessage value) successMessage,
    required TResult Function(_FailedMessage value) failedMessage,
    required TResult Function(_FavoriteStatus value) favoriteStatus,
  }) {
    return favoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SuccessMessage value)? successMessage,
    TResult? Function(_FailedMessage value)? failedMessage,
    TResult? Function(_FavoriteStatus value)? favoriteStatus,
  }) {
    return favoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SuccessMessage value)? successMessage,
    TResult Function(_FailedMessage value)? failedMessage,
    TResult Function(_FavoriteStatus value)? favoriteStatus,
    required TResult orElse(),
  }) {
    if (favoriteStatus != null) {
      return favoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _FavoriteStatus implements FavoriteState {
  const factory _FavoriteStatus(final bool isFavorite) = _$FavoriteStatusImpl;

  bool get isFavorite;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteStatusImplCopyWith<_$FavoriteStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
