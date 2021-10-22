import 'package:flutter/material.dart';
import 'package:proservis/src/pages/carnet_screen.dart';
import 'package:proservis/src/pages/certificados_screen.dart';
import 'package:proservis/src/pages/ejecutivo_cuenta_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  CarnetScreen.routeName: (context) => CarnetScreen(),
  EjecutivoCuentaScreen.routeName: (context) => EjecutivoCuentaScreen(),
  CertificadoScreen.routeName: (context) => CertificadoScreen(),
};
