import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: "Botones",
      subTitle: "Varios botones en flutter",
      link: "/buttons",
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: "Tarjetas",
      subTitle: "Un contenedor estilizado",
      link: "/cards",
      icon: Icons.credit_card),
  MenuItems(
      title: "ProgressIndicator",
      subTitle: "Generales y controlados",
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: "Snackbars",
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar',
      icon: Icons.inbox_outlined),
  MenuItems(
      title: "Animated Container",
      subTitle: "Stateful widgets animated",
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItems(
      title: "Controls",
      subTitle: "All controls",
      link: "/ui_controls",
      icon: Icons.car_rental_outlined),
  MenuItems(
      title: "Into to appp",
      subTitle: "Initial tutorial",
      link: "/app_tutorial",
      icon: Icons.accessibility_new_rounded),
  MenuItems(
      title: "Infinite scroll and Pull",
      subTitle: "Infinite list and pull or refresh",
      link: '/infinite_scroll',
      icon: Icons.list_alt_outlined),
  MenuItems(
      title: "Counter app",
      subTitle: "App for counter",
      link: '/counter_app',
      icon: Icons.summarize_outlined),
  MenuItems(
      title: "Change theme",
      subTitle: "Config for change theme",
      link: "/theme_change",
      icon: Icons.color_lens_outlined)
];
