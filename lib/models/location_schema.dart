class LocationSchema {
  final int x;
  final int y;

  LocationSchema({required this.x, required this.y});

  @override
  String toString() {
    return '[$x, $y]';
  }

  @override
  bool operator ==(Object other) {
    return other is LocationSchema && other.x == x && other.y == y;
  }
}