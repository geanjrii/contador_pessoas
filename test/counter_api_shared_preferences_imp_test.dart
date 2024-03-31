import 'package:contador_pessoas/data_layer/counter_api_shared_preferences_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late CounterApiSharedPreferencesImp counterApi;
  late SharedPreferences sharedPreferences;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    counterApi =
        CounterApiSharedPreferencesImp(sharedPreferences: sharedPreferences);
  });

  group('CounterApiSharedPreferencesImp', () {
    test('getValue should return the saved value', () async {
      const savedValue = 5;
      when(() => sharedPreferences.getInt(any())).thenReturn(savedValue);

      final value = await counterApi.getValue();

      expect(value, savedValue);
      verify(() => sharedPreferences.getInt('counter')).called(1);
    });

    test('getValue should return 0 if no value is saved', () async {
      when(() => sharedPreferences.getInt(any())).thenReturn(null);

      final value = await counterApi.getValue();

      expect(value, 0);
      verify(() => sharedPreferences.getInt('counter')).called(1);
    });

    test('saveValue should save the given value', () async {
      const valueToSave = 10;

      when(() => sharedPreferences.setInt('counter', valueToSave))
          .thenAnswer((_) => Future.value(true));

      counterApi.saveValue(valueToSave);

      verify(() => sharedPreferences.setInt('counter', valueToSave)).called(1);
    });
  });
}
