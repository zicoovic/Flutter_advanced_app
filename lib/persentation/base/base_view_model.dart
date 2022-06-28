import 'dart:async';

import 'package:advanced_flutter_arabic/persentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutptus {
  //shared variables and functions that will be used through any view model.
  final StreamController _inputStreamController = BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowstate) => flowstate);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutptus {
  Stream<FlowState> get outputState;
}
