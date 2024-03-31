import 'package:bloc/bloc.dart';
import 'package:contador_pessoas/domain_layer/counter_repository.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({required CounterRepository repository})
      : _repository = repository,
        super(0);

  final CounterRepository _repository;

  void onValueLoaded() async {
    final int value = await _repository.getValue();
    emit(value);
  }

  void onIncrementPressed() {
    if (state < 20) {
      final newValue = state + 1;
      _repository.saveValue(newValue);
      emit(newValue);
    }
  }

  void onDecrementPressed() {
    if (state > 0) {
      final newValue = state - 1;
      _repository.saveValue(newValue);
      emit(newValue);
    }
  }
}

extension Get on int {
  bool get isEmpty => this == 0;

  bool get isFull => this == 20;
}