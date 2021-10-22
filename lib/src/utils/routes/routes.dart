import 'package:flutter/material.dart';
import 'package:proservis/src/pages/carnet_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  CarnetScreen.routeName: (context) => CarnetScreen(),
};
