import 'package:artifacts_mmo/presentation/base_model.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel<T extends BaseModel> extends ValueNotifier<T> {
  BaseViewModel(super.initialData) {
    try {
      loadAsync();
    } on Error catch (err){
      value = errorModel(err);
    }
  }

  T errorModel(Error err);

  Future<void> loadAsync();
}
