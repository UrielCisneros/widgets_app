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

class _ThemePageView extends ConsumerWidget {
  const _ThemePageView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorListStateProvider = ref.watch(colorListProvider);
    final int indexSelectedColorStateProvider =
        ref.watch(indexColorSelectedProvider);

    return ListView.builder(
      itemCount: colorListStateProvider.length,
      itemBuilder: (context, index) {
        final Color color = colorListStateProvider[index];
        return RadioListTile(
          title: Text(
            "Este color",
            style: TextStyle(color: color),
          ),
          subtitle: Text(color.value.toString()),
          activeColor: color,
          value: index,
          groupValue: indexSelectedColorStateProvider,
          onChanged: (value) {
            ref.read(indexColorSelectedProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
