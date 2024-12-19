import 'package:equatable/equatable.dart';

class Content with EquatableMixin {
  final ContentType type;
  final String code;

  Content({required this.type, required this.code});
  Content.item({required this.code}) : type = ContentType.item;

  Content.empty() : type = ContentType.unknown, code ='';

  @override
  List<Object?> get props => [type, code,];
}

enum ContentType {
  unknown,
  monster,
  item,
  resource,
  workshop,
  bank,
  grandExchange,
  tasksMaster,
  santaClaus,
}