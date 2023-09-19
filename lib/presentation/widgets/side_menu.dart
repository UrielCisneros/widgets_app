import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
            context.pop();
          });
          final menuSelected = appMenuItems[value];
          context.push(menuSelected.link);
        },
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 30, 10),
              child: Text("Main")),
          ...appMenuItems
              .sublist(0, 3)
              .map((menu) => NavigationDrawerDestination(
                  icon: Icon(
                    menu.icon,
                    color: colorTheme.primary,
                  ),
                  label: Text(
                    menu.title,
                    style: TextStyle(color: colorTheme.primary),
                  )))
              .toList(),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Divider(
                color: colorTheme.primary,
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 30, 10),
              child: Text("More opctions")),
          ...appMenuItems
              .sublist(3)
              .map((menu) => NavigationDrawerDestination(
                  icon: Icon(
                    menu.icon,
                    color: colorTheme.primary,
                  ),
                  label: Text(
                    menu.title,
                    style: TextStyle(color: colorTheme.primary),
                  )))
              .toList(),
        ]);
  }
}
