import 'package:flutter/material.dart';

class SkillProgressWidget extends StatelessWidget {
  final String skillName;
  final IconData icon;
  final Color iconColor;
  final int level;
  final int currentXp;
  final int maxXp;

  const SkillProgressWidget({
    super.key,
    required this.skillName,
    required this.icon,
    this.iconColor = Colors.white,
    required this.level,
    required this.currentXp,
    required this.maxXp,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = maxXp > 0 ? currentXp / maxXp : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: 16),
                  const SizedBox(width: 8),
                  Text(skillName),
                ],
              ),
              Text(
                'Lvl: $level',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$currentXp / $maxXp',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}