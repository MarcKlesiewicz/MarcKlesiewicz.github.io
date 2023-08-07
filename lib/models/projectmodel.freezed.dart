// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projectmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get projectName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  List<String> get noteableFeatures => throw _privateConstructorUsedError;
  List<String> get techStack => throw _privateConstructorUsedError;
  List<String> get imagePaths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String projectName,
      String description,
      String? website,
      List<String> noteableFeatures,
      List<String> techStack,
      List<String> imagePaths});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? description = null,
    Object? website = freezed,
    Object? noteableFeatures = null,
    Object? techStack = null,
    Object? imagePaths = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      noteableFeatures: null == noteableFeatures
          ? _value.noteableFeatures
          : noteableFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      techStack: null == techStack
          ? _value.techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imagePaths: null == imagePaths
          ? _value.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$_ProjectModelCopyWith(
          _$_ProjectModel value, $Res Function(_$_ProjectModel) then) =
      __$$_ProjectModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectName,
      String description,
      String? website,
      List<String> noteableFeatures,
      List<String> techStack,
      List<String> imagePaths});
}

/// @nodoc
class __$$_ProjectModelCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$_ProjectModel>
    implements _$$_ProjectModelCopyWith<$Res> {
  __$$_ProjectModelCopyWithImpl(
      _$_ProjectModel _value, $Res Function(_$_ProjectModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? description = null,
    Object? website = freezed,
    Object? noteableFeatures = null,
    Object? techStack = null,
    Object? imagePaths = null,
  }) {
    return _then(_$_ProjectModel(
      null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      null == noteableFeatures
          ? _value._noteableFeatures
          : noteableFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == techStack
          ? _value._techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectModel implements _ProjectModel {
  _$_ProjectModel(
      this.projectName,
      this.description,
      this.website,
      final List<String> noteableFeatures,
      final List<String> techStack,
      final List<String> imagePaths)
      : _noteableFeatures = noteableFeatures,
        _techStack = techStack,
        _imagePaths = imagePaths;

  factory _$_ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectModelFromJson(json);

  @override
  final String projectName;
  @override
  final String description;
  @override
  final String? website;
  final List<String> _noteableFeatures;
  @override
  List<String> get noteableFeatures {
    if (_noteableFeatures is EqualUnmodifiableListView)
      return _noteableFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteableFeatures);
  }

  final List<String> _techStack;
  @override
  List<String> get techStack {
    if (_techStack is EqualUnmodifiableListView) return _techStack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techStack);
  }

  final List<String> _imagePaths;
  @override
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  String toString() {
    return 'ProjectModel(projectName: $projectName, description: $description, website: $website, noteableFeatures: $noteableFeatures, techStack: $techStack, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectModel &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality()
                .equals(other._noteableFeatures, _noteableFeatures) &&
            const DeepCollectionEquality()
                .equals(other._techStack, _techStack) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectName,
      description,
      website,
      const DeepCollectionEquality().hash(_noteableFeatures),
      const DeepCollectionEquality().hash(_techStack),
      const DeepCollectionEquality().hash(_imagePaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
      __$$_ProjectModelCopyWithImpl<_$_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectModelToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  factory _ProjectModel(
      final String projectName,
      final String description,
      final String? website,
      final List<String> noteableFeatures,
      final List<String> techStack,
      final List<String> imagePaths) = _$_ProjectModel;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectModel.fromJson;

  @override
  String get projectName;
  @override
  String get description;
  @override
  String? get website;
  @override
  List<String> get noteableFeatures;
  @override
  List<String> get techStack;
  @override
  List<String> get imagePaths;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
