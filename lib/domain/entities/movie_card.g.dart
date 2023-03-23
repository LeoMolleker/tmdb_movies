// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieCard _$$_MovieCardFromJson(Map<String, dynamic> json) => _$_MovieCard(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MovieCardToJson(_$_MovieCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
