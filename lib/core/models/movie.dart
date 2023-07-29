import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  @JsonKey(name: 'imdbid')
  final String imdbId;

  final String img;
  final String synopsis;
  final String title;

  @JsonKey(name: 'titledate')
  final String titleDate;

  @JsonKey(name: 'vtype')
  final String type;
  final int year;

  Movie({
    required this.imdbId,
    required this.img,
    required this.synopsis,
    required this.title,
    required this.titleDate,
    required this.type,
    required this.year,
  });

  Map<String, dynamic> toJson() => _$MovieToJson(this);
  static Movie fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
