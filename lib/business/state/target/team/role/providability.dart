enum Providable {
  /// Not sure if we can provide or not.
  unknown,

  /// Cannot provide.
  cannotProvide,

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
}
