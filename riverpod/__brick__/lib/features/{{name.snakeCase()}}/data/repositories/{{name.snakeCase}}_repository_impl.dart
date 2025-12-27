import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/{{name.camelCase}}_notifier.dart';
import '../models/{{name.snakeCase()}}_model.dart';

part '../../../{{name.snakeCase}}/data/models/{{name.snakeCase}}_repository_impl.g.dart';

@riverpod
{{name.pascalCase}}Repository {{name.camelCase}}Repository({{name.camelCase}}RepositoryRef ref) {
  return {{name.pascalCase}}RepositoryImpl();
}

class {{name.pascalCase}}RepositoryImpl implements {{name.pascalCase}}Repository {
  @override
  Future<List<{{name.pascalCase}}Model>> get{{name.pascalCase}}List({
    int page = 1,
    int limit = 20,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return List.generate(limit, (i) {
      final id = (page - 1) * limit + i + 1;
      return {{name.pascalCase}}Model(
        id: id,
        title: '{{name.titleCase}} Item $id',
        description: 'Description for item $id',
        imageUrl: 'https://picsum.photos/seed/$id/300/400',
        likeCount: Random().nextInt(100),
        commentCount: Random().nextInt(50),
      );
    });
  }
}
