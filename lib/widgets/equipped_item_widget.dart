import 'package:flutter/material.dart';
import 'package:artifacts_api/artifacts_api.dart'; // For ItemSchema and ItemSlot

class EquippedItemWidget extends StatelessWidget {
  final ItemSlot slot;
  final ItemSchema? item; // Null if slot is empty

  const EquippedItemWidget({super.key, required this.slot, this.item});

  @override
  Widget build(BuildContext context) {
    final String slotName = slot.name[0].toUpperCase() + slot.name.substring(1);
    final String tooltipMessage = item != null
        ? "${slotName}: ${item!.name}"
        : "${slotName}: Empty";

    // Default URL generation (adjust to your actual asset path if different)
    final String imageUrl = item != null
        ? 'https://client.artifactsmmo.com/images/items/${item!.code}.png'
        : 'https://client.artifactsmmo.com/images/ui/empty_${slot.name}.png'; // Placeholder for empty slot

    return Tooltip(
      message: tooltipMessage,
      child: Card(
        color: Colors.white.withValues(alpha: 0.1),
        margin: EdgeInsets.zero, // Remove default card margins
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback for missing item images or empty slot images
                  return Center(
                    child: Text(
                      item?.name ?? slotName,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                        fontStyle: item == null ? FontStyle.italic : FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                slotName,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}