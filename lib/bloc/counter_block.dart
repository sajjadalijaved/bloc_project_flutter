import 'dart:async';

import 'package:bloc_project/bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_state.dart';

class CounterBloc {
  final StreamController<CounterEvent> _counterEventStreamController =
      StreamController<CounterEvent>();
  final StreamController<CounterState> _counterStateStreamController =
      StreamController<CounterState>();

  final counterState = CounterState();

  CounterBloc() {
    _eventstream.listen(_mapEventToStream);
  }

  StreamSink<CounterEvent> get eventsink => _counterEventStreamController.sink;
  StreamSink<CounterState> get _statesink => _counterStateStreamController.sink;
  Stream<CounterState> get statestream => _counterStateStreamController.stream;
  Stream<CounterEvent> get _eventstream => _counterEventStreamController.stream;

  void _mapEventToStream(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _statesink.add(counterState..increment());
    } else {
      _statesink.add(counterState..decrement());
    }
  }
}
