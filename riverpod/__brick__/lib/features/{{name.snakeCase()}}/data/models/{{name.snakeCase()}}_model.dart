import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../{{name.snakeCase}}/data/models/{{name.snakeCase}}_model.freezed.dart';
part '../../../{{name.snakeCase}}/data/models/{{name.snakeCase}}_model.g.dart';

@freezed
class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    required int id,
    required String title,
    String? description,
    String? imageUrl,
    @Default(false) bool isLiked,
    @Default(0) int likeCount,
    @Default(0) int commentCount,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);
}
