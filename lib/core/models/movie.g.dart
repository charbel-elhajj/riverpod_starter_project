// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      imdbId: json['imdbid'] as String,
      img: json['img'] as String,
      synopsis: json['synopsis'] as String,
      title: json['title'] as String,
      titleDate: json['titledate'] as String,
      type: json['vtype'] as String,
      year: json['year'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'imdbid': instance.imdbId,
      'img': instance.img,
      'synopsis': instance.synopsis,
      'title': instance.title,
      'titledate': instance.titleDate,
      'vtype': instance.type,
      'year': instance.year,
    };
