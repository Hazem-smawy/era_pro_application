import 'package:equatable/equatable.dart';

class SystemDocEntity extends Equatable {
  final int id;

  final String docName;
  final int docType;

  const SystemDocEntity({
    required this.id,
    required this.docName,
    required this.docType,
  });

  @override
  List<Object?> get props => [id, docName, docType];
}
