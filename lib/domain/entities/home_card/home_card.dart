import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_card.freezed.dart';
part 'home_card.g.dart';

@freezed
class HomeCard with _$HomeCard {
  const factory HomeCard({
    required int id,
    required String title,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _HomeCard;
  const HomeCard._();

  factory HomeCard.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$HomeCardFromJson(json);

  String getFullPath() => 'https://image.tmdb.org/t/p/original$posterPath';
}
