// lib/widgets/inventory_item_widget.dart
import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventorySlot item;

  const InventoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Assumes item names like 'Iron Pickaxe' should be 'iron_pickaxe' in the URL
    final imageUrl =
        'https://client.artifactsmmo.com/images/items/${item.code}.png';

    return Tooltip(
      message: "${item.code}\nQuantity: ${item.quantity}",
      child: Card(
        color: Colors.white.withValues(alpha: 0.1),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Item Image
            Image.network(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.question_mark, color: Colors.grey),
            ),
            // Quantity Overlay
            Positioned(
              bottom: 2,
              right: 4,
              child: Text(
                item.quantity.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 2.0, color: Colors.black)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
