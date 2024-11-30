import 'package:equatable/equatable.dart';

class Content with EquatableMixin {
  final String type;
  final String code;

  Content({required this.type, required this.code});
  Content.item({required this.code}) : type = 'item';

  Content.empty() : type = '', code ='';

  @override
  List<Object?> get props => [type, code];
}