import 'package:artifacts_mmo/infrastructure/api/dto/item/item_quantity.dart';
import 'package:equatable/equatable.dart';

enum Providable {
  /// Not sure if we can provide or not.
  unknown,

  /// Has this item right now and can provide it on short notice.
  canProvideImmediately,

  /// Doesn't have this item, but has the ability to fetch it relatively soon.
  /// Usually this means we have the needed skill level but don't have the item
  /// yet.
  canProvideSoon,

  /// Doesn't have the item, but has the ability to fetch it eventually. This
  /// usually means we are working on leveling the right skill, but aren't there
  /// yet.
  canProvideEventually,

  /// Cannot provide.
  cannotProvide,
}

class ProvideResult with EquatableMixin {
  final Providable providable;
  final List<ItemQuantity> neededDependencies;
  final ProvideMethod provideMethod;
  final int countNeeded;

  ProvideResult({
    required this.providable,
    required this.neededDependencies,
    required this.provideMethod,
    required this.countNeeded,
  });

  @override
  List<Object?> get props => [
    providable,
    neededDependencies,
    provideMethod,
    countNeeded,
  ];
}

enum ProvideMethod {
  unknown,
  inventory,
  fight,
  craft,
  gather,
  bankWithdraw,
  bankDeposit,
}

extension EnumComparisionOperators<T extends Enum> on T {
  bool operator <(T other) {
    return index < other.index;
  }
  bool operator <=(T other) {
    return index <= other.index;
  }

  bool operator >(T other) {
    return index > other.index;
  }

  bool operator >=(T other) {
    return index >= other.index;
  }
}
