import 'package:contador_pessoas/data_layer/data_layer.dart';

class CounterRepository {
  final CounterApi _api;

  CounterRepository( {required CounterApi api}) : _api = api;

  Future<int> getValue() => _api.getValue();

  void saveValue(int value) => _api.saveValue(value);
}
