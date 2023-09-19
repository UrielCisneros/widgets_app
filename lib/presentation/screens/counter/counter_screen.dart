import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const pathName = 'counter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme;

    final counterStateProvider = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Valor: ",
              style: titleStyle.titleLarge,
            ),
            Text(
              "$counterStateProvider",
              style: titleStyle.titleLarge,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Esta es una forma de hacerlo
          // ref.read(counterProvider.notifier).state++;

          //Esta es otra forma de hacerlo (Esta nos regresa una funcion con el estado actual)
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
