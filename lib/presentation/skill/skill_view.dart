import 'package:artifacts_mmo/infrastructure/api/dto/skill.dart';
import 'package:flutter/material.dart';

class SkillView extends StatelessWidget {
  final Skill skill;
  const SkillView({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(top: 0, left: 0, right: 0, bottom: 0, child: LinearProgressIndicator(value: skill.xp / skill.nextLevelTargetXp,)),
      Row(children: [
        Text(skill.xp.toString()),
        Flexible(child: Column(
          children: [
            Center(child: Text(skill.skillType.toString()),),
            Center(child:Text('Level: ${skill.level}')),
          ],
        )),
        Text(skill.nextLevelTargetXp.toString()),
      ],),
    ],);
  }

}