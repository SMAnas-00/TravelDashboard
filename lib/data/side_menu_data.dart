import 'package:flutter/material.dart';
import 'package:stats/models/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Dashboard"),
  MenuModel(icon: Icons.person, title: "Profile"),
  // MenuModel(icon: Icons.run_circle, title: "Exersice"),
  MenuModel(icon: Icons.logout, title: "Signout"),];
}