import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:states/data/stat_repository.dart';
import './bloc.dart';

class StatBloc extends Bloc<StatEvent, StatState> {
  final StatRepository statRepository;

  StatBloc(this.statRepository);

  @override
  StatState get initialState => StatInitial();

  @override
  Stream<StatState> mapEventToState(
    StatEvent event,
  ) async* {
   // yield StatLoading();

    if (event is GetStat) {
      try {
        final stat = await statRepository.fetchStat(event.memberName);
        yield StatLoaded(stat);
      } on NetworkError {
        yield StatError('This Member is Not Part of the App Team!');
      }
    }
  }

}
