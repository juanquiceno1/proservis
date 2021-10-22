import 'package:flutter/material.dart';
import 'package:proservis/src/pages/carnet_screen.dart';
import 'package:proservis/src/pages/ejecutivo_cuenta_screen.dart';

exitAplication(BuildContext context, bool exit) =>
    exit ? Navigator.of(context).pop(true) : Navigator.of(context).pop(false);

navigatePop(BuildContext context, bool active) => Navigator.pop(context, active);

navigateToCredential(BuildContext context, bool remplaced) => remplaced
    ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext contextt) {
        return CarnetScreen();
      }), (Route route) => false)
    : Navigator.of(context).pushNamed(CarnetScreen.routeName);

//Home
navigateToAccountExecutive(BuildContext context, bool remplaced) => remplaced
    ? Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext contextt) {
        return EjecutivoCuentaScreen();
      }), (Route route) => false)
    : Navigator.of(context).pushNamed(EjecutivoCuentaScreen.routeName);

