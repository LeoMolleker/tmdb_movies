import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_card.freezed.dart';
part 'movie_card.g.dart';

@freezed
class MovieCard with _$MovieCard {
  const factory MovieCard({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _MovieCard;

  factory MovieCard.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MovieCardFromJson(json);
}
