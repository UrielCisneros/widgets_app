import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const pathName = 'snackbar';

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text("Hola mundo"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Estas seguro ?"),
        content: const Text(
            "Consequat dolore do veniam ea excepteur. Magna voluptate ex officia amet aute eiusmod. Deserunt enim voluptate enim consequat. Deserunt aliqua excepteur aute consequat duis Lorem ullamco incididunt aliquip tempor ea. Officia ipsum voluptate ut labore labore voluptate labore deserunt. Enim id do cupidatat elit aute elit officia occaecat in incididunt culpa."),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("Cancelar")),
          FilledButton(
              onPressed: () => context.pop(), child: const Text("Aceptar")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context);
                },
                child: const Text("Licencias usadas")),
            FilledButton.tonal(
                onPressed: () => showAlertDialog(context),
                child: const Text("Mostrar dialogo de pantalla"))
          ],
        ),
      ),
    );
  }
}
