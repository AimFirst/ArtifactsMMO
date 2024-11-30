import 'package:artifacts_mmo/infrastructure/api/dto/resource/resource.dart';
import 'package:flutter/material.dart';

class ResourceView extends StatelessWidget {
  final Resource resource;
  final int characterLevelInSkill;
  const ResourceView({super.key, required this.resource, required this.characterLevelInSkill});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(resource.skillType.name),
        const Spacer(),
        Text(resource.name),
        const Spacer(),
        Text(resource.code),
        const Spacer(),
        Text(resource.skillLevel.toString(), style: TextStyle(color: characterLevelInSkill >= resource.skillLevel ? Colors.green : Colors.red),),
      ],
    );
  }

}