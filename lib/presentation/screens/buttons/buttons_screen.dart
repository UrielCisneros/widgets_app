import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String pathName = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _HomeView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {},
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevation button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevation disable')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc),
                label: const Text("Elevate button icon")),
            FilledButton(onPressed: () {}, child: const Text("Fill button")),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc_rounded),
                label: const Text("fill icons")),
            OutlinedButton(onPressed: () {}, child: const Text("Outline")),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              label: const Text("Outline icon"),
            ),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc_sharp),
                label: const Text("Text")),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.ac_unit_outlined)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit_outlined),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(themeColor.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: colorsTheme.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Custom button",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
