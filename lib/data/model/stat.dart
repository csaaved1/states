import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class Stat extends Equatable {
  final String memberName;
  final String memberSpecialty;

  Stat({
    @required this.memberName,
    @required this.memberSpecialty
  });

  @override
  // Implementing Value Equality, this is needed for the Equatable
  List<Object> get props => [
        memberName,
        memberSpecialty,
      ];
}
