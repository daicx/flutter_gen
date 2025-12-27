import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/{{name.snakeCase}}_model.dart';

class {{name.pascalCase}}ItemWidget extends ConsumerWidget {
  final {{name.pascalCase}}Model item;

  const {{name.pascalCase}}ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: item.imageUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.imageUrl!, width: 60, height: 60, fit: BoxFit.cover),
              )
            : const Icon(Icons.image, size: 60),
        title: Text(item.title),
        subtitle: item.description != null ? Text(item.description!) : null,
        trailing: IconButton(
          icon: Icon(item.isLiked ? Icons.favorite : Icons.favorite_border, color: item.isLiked ? Colors.red : null),
          onPressed: () {
            // TODO: 切换喜欢状态
          },
        ),
      ),
    );
  }
}
