// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:contador_pessoas/app/keys.dart';
import 'package:contador_pessoas/domain_layer/domain_layer.dart';
import 'package:contador_pessoas/feature_layer/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CounterCubit(repository: context.read<CounterRepository>()),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  void initState() {
    super.initState();
    context.read<CounterCubit>().onValueLoaded();
  }

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    final state = context.watch<CounterCubit>().state;
    final isFull = state.isFull;
    final isEmpty = state.isEmpty;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        //backgruound image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CapacityStatus(isFull: isFull),
            const SizedBox(
              height: 32,
            ),
            CounterDisplay(
              counter: state,
              isFull: isFull,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecrementButton(
                  key: decrementButtonKey,
                  onPressed: () => counterCubit.onDecrementPressed(),
                  isEmpty: isEmpty,
                ),
                const SizedBox(
                  width: 32,
                ),
                IncrementButton(
                  key: incrementButtonKey,
                  onPressed: () => counterCubit.onIncrementPressed(),
                  isFull: isFull,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
