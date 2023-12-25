// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeCard _$$_HomeCardFromJson(Map<String, dynamic> json) => _$_HomeCard(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_HomeCardToJson(_$_HomeCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };
