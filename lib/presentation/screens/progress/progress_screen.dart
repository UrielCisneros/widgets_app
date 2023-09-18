import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const pathName = 'progress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text("Circular progress indicators"),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black26,
        ),
        SizedBox(
          height: 30,
        ),
        Text("Progress indicators Circular ty linear controlated"),
        SizedBox(
          height: 20,
        ),
        _ControllerProgressIndicator()
      ]),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: ((context, snapshot) {
        final valueProgress = snapshot.data ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black12,
                value: valueProgress,
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                value: valueProgress,
              ))
            ],
          ),
        );
      }),
    );
  }
}
