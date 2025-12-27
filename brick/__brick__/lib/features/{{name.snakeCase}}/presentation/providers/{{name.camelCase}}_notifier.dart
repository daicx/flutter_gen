import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/{{name.snakeCase}}_model.dart';
import '../../../data/repositories/{{name.snakeCase}}_repository_impl.dart';

part '{{name.camelCase}}_notifier.g.dart';
part '{{name.camelCase}}_state.freezed.dart';

@freezed
class {{name.pascalCase}}State with _${{name.pascalCase}}State {
  const factory {{name.pascalCase}}State({
    @Default([]) List<{{name.pascalCase}}Model> items,
    @Default(false) bool isLoading,
    String? error,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
  }) = _{{name.pascalCase}}State;
}

@riverpod
class {{name.pascalCase}}Notifier extends _${{name.pascalCase}}Notifier {
  @override
  Future<{{name.pascalCase}}State> build() async {
    return const {{name.pascalCase}}State();
  }

  Future<void> loadFirstPage() async {
    state = state.copyWith(isLoading: true, error: null, currentPage: 1);
    await _loadPage(1);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    state = state.copyWith(isLoading: true);
    await _loadPage(state.currentPage + 1);
  }

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    await _loadPage(1);
  }

  Future<void> _loadPage(int page) async {
    try {
      final repository = ref.read({{name.camelCase}}RepositoryProvider);
      final newItems = await repository.get{{name.pascalCase}}List(page: page, limit: 20);

      state = state.copyWith(
        items: page == 1 ? newItems : [...state.items, ...newItems],
        isLoading: false,
        currentPage: page,
        hasMore: newItems.length == 20,
      );
    } catch (e, st) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
