import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/{{name.camelCase}}_notifier.dart';
import '../widgets/{{name.camelCase}}_item_widget.dart';

class {{name.pascalCase}}View extends ConsumerWidget {
  const {{name.pascalCase}}View({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch({{name.camelCase}}NotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('{{name.titleCase}}')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('错误: $err'),
              ElevatedButton(
                onPressed: () => ref.read({{name.camelCase}}NotifierProvider.notifier).refresh(),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () => ref.read({{name.camelCase}}NotifierProvider.notifier).refresh(),
          child: ListView.builder(
            itemCount: data.items.length + (data.hasMore ? 1 : 0),
            itemBuilder: (context, i) {
              if (i == data.items.length) {
                ref.read({{name.camelCase}}NotifierProvider.notifier).loadMore();
                return const Center(child: CircularProgressIndicator());
              }

              final item = data.items[i];
              return {{name.pascalCase}}ItemWidget(item: item);
            },
          ),
        ),
      ),
    );
  }
}
