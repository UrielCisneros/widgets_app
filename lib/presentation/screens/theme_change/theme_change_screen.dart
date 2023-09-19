import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  const ThemeChangeScreen({super.key});

  static const pathName = 'theme_change';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool idDarkModeStateProvider = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change theme"),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((darkMode) => !darkMode);
            },
            // icon: Icon(Icons.light_mode_outlined),
            icon: idDarkModeStateProvider
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          )
        ],
      ),
      body: const _ThemePageView(),
    );
  }
}

class _ThemePageView extends StatelessWidget {
  const _ThemePageView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text("color");
      },
    );
  }
}
