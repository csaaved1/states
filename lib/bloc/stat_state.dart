import 'package:equatable/equatable.dart';
import 'package:states/data/model/stat.dart';

abstract class StatState extends Equatable {
  const StatState();
}

class StatInitial extends StatState {
  @override
  List<Object> get props => [];
}

class StatLoading extends StatState {
  const StatLoading();
  @override
  List<Object> get props => [];
}

class StatLoaded extends StatState {
  final Stat stat;
  const StatLoaded(this.stat);
  @override
  List<Object> get props => [stat];
}

class StatError extends StatState {
  final String message;
  const StatError(this.message);
  @override
  List<Object> get props => [message];
}

