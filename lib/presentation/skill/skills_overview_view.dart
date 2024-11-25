import 'package:artifacts_mmo/presentation/base_view.dart';
import 'package:artifacts_mmo/presentation/skill/skill_view.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_model.dart';
import 'package:artifacts_mmo/presentation/skill/skills_overview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillsOverviewView
    extends BaseView<SkillsOverviewModel, SkillsOverviewViewModel> {
  const SkillsOverviewView._({required super.viewModel, super.key});

  factory SkillsOverviewView({required BuildContext context, Key? key}) {
    return SkillsOverviewView._(
      viewModel: Provider.of<SkillsOverviewViewModel>(context, listen: false),
      key: key,
    );
  }

  @override
  Widget widgetForState(SkillsOverviewModel value) {
    switch (value) {
      case SkillsOverviewModelLoading a:
        return _widgetLoading(a);
      case SkillsOverviewModelError a:
        return _widgetError(a);
      case SkillsOverviewModelLoaded a:
        return _widgetLoaded(a);
    }
  }

  Widget _widgetLoading(SkillsOverviewModelLoading model) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _widgetError(SkillsOverviewModelError model) {
    return Center(child: Text("Template error! ${model.error}"));
  }

  Widget _widgetLoaded(SkillsOverviewModelLoaded model) {
    return ListView.builder(
        itemCount: model.skills.length,
        itemBuilder: (BuildContext context, int index) {
          return SkillView(skill: model.skills[index]);
        });
  }
}
