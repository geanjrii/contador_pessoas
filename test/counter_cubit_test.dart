import 'package:bloc_test/bloc_test.dart';
import 'package:contador_pessoas/domain_layer/domain_layer.dart';
import 'package:contador_pessoas/feature_layer/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  group('CounterCubit', () {
    late CounterRepository counterRepository;

    setUp(() {
      counterRepository = MockCounterRepository();
    });

    CounterCubit buildCubit() => CounterCubit(repository: counterRepository);

    test('initial state should be 0', () {
      expect(buildCubit().state, 0);
    });

    group('onValueLoaded |', () {
      blocTest<CounterCubit, int>(
        'emits [5] when onValueLoaded is called and repository returns 5',
        setUp: () {
          when(() => counterRepository.getValue())
              .thenAnswer((_) async => Future<int>.value(5));
        },
        build: buildCubit,
        act: (cubit) => cubit.onValueLoaded(),
        expect: () => [5],
        verify: (cubit) => verify(() => counterRepository.getValue()).called(1),
      );
    });

    group('onIncrementPressed |', () {
      blocTest<CounterCubit, int>(
        'emits [1] when onIncrementPressed is called and state is 0',
        build: buildCubit,
        act: (cubit) => cubit.onIncrementPressed(),
        expect: () => [1],
        verify: (cubit) =>
            verify(() => counterRepository.saveValue(1)).called(1),
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: buildCubit,
        act: (cubit) => cubit
          ..onIncrementPressed()
          ..onIncrementPressed(),
        expect: () => [1, 2],
        verify: (cubit) {
          verify(() => counterRepository.saveValue(1)).called(1);
          verify(() => counterRepository.saveValue(2)).called(1);
        },
      );

      blocTest<CounterCubit, int>(
        'emits [12] when state is 11',
        build: buildCubit,
        seed: () => 11,
        act: (cubit) => cubit.onIncrementPressed(),
        expect: () => [12],
        verify: (cubit) =>
            verify(() => counterRepository.saveValue(12)).called(1),
      );

      blocTest<CounterCubit, int>(
        'does not emit when onIncrementPressed is called and state is 20',
        build: buildCubit,
        seed: () => 20,
        act: (cubit) => cubit.onIncrementPressed(),
        expect: () => [],
        verify: (cubit) =>
            verifyNever(() => counterRepository.saveValue(any())),
      );
    });

    group('onDecrementPressed |', () {
      blocTest<CounterCubit, int>(
        'emits [0] when onDecrementPressed is called and state is 1',
        build: buildCubit,
        seed: () => 1,
        act: (cubit) => cubit.onDecrementPressed(),
        expect: () => [0],
        verify: (cubit) =>
            verify(() => counterRepository.saveValue(0)).called(1),
      );

      blocTest<CounterCubit, int>(
        'emits [2, 1] when state is 3 and invoked twice',
        build: buildCubit,
        seed: () => 3,
        act: (cubit) => cubit
          ..onDecrementPressed()
          ..onDecrementPressed(),
        expect: () => [2, 1],
        verify: (cubit) {
          verify(() => counterRepository.saveValue(2)).called(1);
          verify(() => counterRepository.saveValue(1)).called(1);
        },
      );

      blocTest<CounterCubit, int>(
        'emits [12] when state is 13',
        build: buildCubit,
        seed: () => 13,
        act: (cubit) => cubit.onDecrementPressed(),
        expect: () => [12],
        verify: (cubit) =>
            verify(() => counterRepository.saveValue(12)).called(1),
      );

      blocTest<CounterCubit, int>(
        'does not emit when onDecrementPressed is called and state is 0',
        build: buildCubit,
        seed: () => 0,
        act: (cubit) => cubit.onDecrementPressed(),
        expect: () => [],
        verify: (cubit) =>
            verifyNever(() => counterRepository.saveValue(any())),
      );
    });
  });
}
