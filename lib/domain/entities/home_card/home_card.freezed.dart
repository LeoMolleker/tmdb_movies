// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeCard _$HomeCardFromJson(Map<String, dynamic> json) {
  return _HomeCard.fromJson(json);
}

/// @nodoc
mixin _$HomeCard {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeCardCopyWith<HomeCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCardCopyWith<$Res> {
  factory $HomeCardCopyWith(HomeCard value, $Res Function(HomeCard) then) =
      _$HomeCardCopyWithImpl<$Res, HomeCard>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class _$HomeCardCopyWithImpl<$Res, $Val extends HomeCard>
    implements $HomeCardCopyWith<$Res> {
  _$HomeCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeCardCopyWith<$Res> implements $HomeCardCopyWith<$Res> {
  factory _$$_HomeCardCopyWith(
          _$_HomeCard value, $Res Function(_$_HomeCard) then) =
      __$$_HomeCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class __$$_HomeCardCopyWithImpl<$Res>
    extends _$HomeCardCopyWithImpl<$Res, _$_HomeCard>
    implements _$$_HomeCardCopyWith<$Res> {
  __$$_HomeCardCopyWithImpl(
      _$_HomeCard _value, $Res Function(_$_HomeCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = null,
    Object? voteAverage = freezed,
  }) {
    return _then(_$_HomeCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeCard extends _HomeCard {
  const _$_HomeCard(
      {required this.id,
      required this.title,
      @JsonKey(name: 'poster_path') required this.posterPath,
      @JsonKey(name: 'vote_average') this.voteAverage})
      : super._();

  factory _$_HomeCard.fromJson(Map<String, dynamic> json) =>
      _$$_HomeCardFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @override
  String toString() {
    return 'HomeCard(id: $id, title: $title, posterPath: $posterPath, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, posterPath, voteAverage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeCardCopyWith<_$_HomeCard> get copyWith =>
      __$$_HomeCardCopyWithImpl<_$_HomeCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeCardToJson(
      this,
    );
  }
}

abstract class _HomeCard extends HomeCard {
  const factory _HomeCard(
      {required final int id,
      required final String title,
      @JsonKey(name: 'poster_path') required final String posterPath,
      @JsonKey(name: 'vote_average') final double? voteAverage}) = _$_HomeCard;
  const _HomeCard._() : super._();

  factory _HomeCard.fromJson(Map<String, dynamic> json) = _$_HomeCard.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(ignore: true)
  _$$_HomeCardCopyWith<_$_HomeCard> get copyWith =>
      throw _privateConstructorUsedError;
}
