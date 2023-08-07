import 'package:freezed_annotation/freezed_annotation.dart';

part 'projectmodel.freezed.dart';
part 'projectmodel.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  factory ProjectModel(
    String projectName,
    String description,
    String? website,
    List<String> noteableFeatures,
    List<String> techStack,
    List<String> imagePaths,
  ) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
