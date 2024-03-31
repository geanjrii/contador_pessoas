import 'package:shared_preferences/shared_preferences.dart';

import 'counter_api.dart';

class CounterApiSharedPreferencesImp implements CounterApi {
  static const _key = 'counter';
  final SharedPreferences _sharedPreferences;

  CounterApiSharedPreferencesImp({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<int> getValue() async => _sharedPreferences.getInt(_key) ?? 0;

  @override
  void saveValue(int value) async => _sharedPreferences.setInt(_key, value);
}
