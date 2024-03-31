import 'package:bloc_test/bloc_test.dart';
import 'package:contador_pessoas/app/keys.dart';
import 'package:contador_pessoas/feature_layer/feature_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
  });

  group('CounterView', () {
    testWidgets('renders current CounterCubit state', (tester) async {
      when(() => counterCubit.state).thenReturn(2);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.onIncrementPressed()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      await tester.tap(find.byKey(incrementButtonKey));
      verify(() => counterCubit.onIncrementPressed()).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(1);
      when(() => counterCubit.onDecrementPressed()).thenReturn(null);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: counterCubit,
            child: const CounterView(),
          ),
        ),
      );
      final decrementFinder = find.byKey(decrementButtonKey);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(() => counterCubit.onDecrementPressed()).called(1);
    });
  });
}
