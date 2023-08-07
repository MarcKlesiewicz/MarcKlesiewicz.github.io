// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      json['projectName'] as String,
      json['description'] as String,
      json['website'] as String?,
      (json['noteableFeatures'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['techStack'] as List<dynamic>).map((e) => e as String).toList(),
      (json['imagePaths'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'description': instance.description,
      'website': instance.website,
      'noteableFeatures': instance.noteableFeatures,
      'techStack': instance.techStack,
      'imagePaths': instance.imagePaths,
    };
