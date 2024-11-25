import 'package:artifacts_mmo/infrastructure/api/dto/inventory_item.dart';
import 'package:flutter/material.dart';

class InventoryItemView extends StatelessWidget {
  final InventoryItem item;
  const InventoryItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.code),
        Text('${item.quantity}'),
      ],
    );
  }

}