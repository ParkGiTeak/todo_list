// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
  title: json['title'] as String,
  dateTime: (json['dateTime'] as num).toInt(),
);

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'title': instance.title,
  'dateTime': instance.dateTime,
};
