import 'package:artifacts_mmo/infrastructure/api/dto/resource.dart';
import 'package:flutter/material.dart';

class ResourceView extends StatelessWidget {
  final Resource resource;
  const ResourceView({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(resource.skillType.name),
        Text(resource.name),
        Text(resource.skillLevel.toString()),
      ],
    );
  }

}