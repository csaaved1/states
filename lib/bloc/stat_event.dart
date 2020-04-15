import 'package:equatable/equatable.dart';

abstract class StatEvent extends Equatable {
  const StatEvent();
}

class GetStat extends StatEvent {
  final String memberName;

  const GetStat(this.memberName);

  @override
  List<Object> get props => [memberName];
}
