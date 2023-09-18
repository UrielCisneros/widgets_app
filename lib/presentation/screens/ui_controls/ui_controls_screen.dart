import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const pathName = 'ui_controls';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI Controls"),
      ),
      body: const _ControlListView(),
    );
  }
}

class _ControlListView extends StatefulWidget {
  const _ControlListView();

  @override
  State<_ControlListView> createState() => _ControlListViewState();
}

enum Transportation { car, plane, boat, submarine }

class _ControlListViewState extends State<_ControlListView> {
  bool isDevelop = true;
  Transportation selectedTrasnportation = Transportation.car;
  bool wantsDinner = false;
  bool wantsLunch = false;
  bool wantsBreakFast = false;

  void changeSwitchValue(value) {
    isDevelop = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            title: const Text("Developer mode"),
            subtitle: const Text("Adicional controls"),
            value: isDevelop,
            onChanged: (value) => changeSwitchValue(value)),
        ExpansionTile(
          title: const Text("Veiculo de transporte"),
          subtitle: const Text("Selecciona el veiculo de tu agrado"),
          children: [
            RadioListTile(
                title: const Text("By car"),
                value: Transportation.car,
                groupValue: selectedTrasnportation,
                onChanged: (value) => setState(() {
                      selectedTrasnportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text("By plane"),
                value: Transportation.plane,
                groupValue: selectedTrasnportation,
                onChanged: (value) => setState(() {
                      selectedTrasnportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text("By boat"),
                value: Transportation.boat,
                groupValue: selectedTrasnportation,
                onChanged: (value) => setState(() {
                      selectedTrasnportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text("By submarine"),
                value: Transportation.submarine,
                groupValue: selectedTrasnportation,
                onChanged: (value) => setState(() {
                      selectedTrasnportation = Transportation.submarine;
                    })),
          ],
        ),
        CheckboxListTile(
            title: const Text("BreakFast"),
            value: wantsBreakFast,
            onChanged: (value) => setState(() {
                  wantsBreakFast = !wantsBreakFast;
                })),
        CheckboxListTile(
            title: const Text("Dinner"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
        CheckboxListTile(
            title: const Text("Lunch"),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
      ],
    );
  }
}
