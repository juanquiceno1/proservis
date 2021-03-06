import 'package:flutter/material.dart';
import 'package:proservis/src/pages/accident_screen.dart';
import 'package:proservis/src/pages/carnet_screen.dart';
import 'package:proservis/src/pages/certificados_screen.dart';
import 'package:proservis/src/pages/ejecutivo_cuenta_screen.dart';
import 'package:proservis/src/pages/reporte_incapacidad.dart';

exitAplication(BuildContext context, bool exit) => exit 
? Navigator.of(context).pop(true) 
: Navigator.of(context).pop(false);

navigatePop(BuildContext context, bool active) => Navigator.pop(context, active);

navigateToCredential(BuildContext context, bool remplaced) => remplaced
  ? Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext contextt) {
      return CarnetScreen();
    }), (Route route) => false)
  : Navigator.of(context).pushNamed(CarnetScreen.routeName);

navigateToAccountExecutive(BuildContext context, bool remplaced) => remplaced
  ? Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext contextt) {
      return EjecutivoCuentaScreen();
    }), (Route route) => false)
  : Navigator.of(context).pushNamed(EjecutivoCuentaScreen.routeName);

navigateToCertificate(BuildContext context, bool remplaced) => remplaced
  ? Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext contextt) {
      return CertificadoScreen();
    }), (Route route) => false)
  : Navigator.of(context).pushNamed(CertificadoScreen.routeName);

navigateToDisabilityreport(BuildContext context, bool remplaced) => remplaced
  ? Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext contextt) {
      return ReporteIncapacidadScreen();
    }), (Route route) => false)
  : Navigator.of(context).pushNamed(ReporteIncapacidadScreen.routeName);

navigateToAccident(BuildContext context, bool remplaced) => remplaced
  ? Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext contextt) {
      return AccidentScreen();
    }), (Route route) => false)
  : Navigator.of(context).pushNamed(AccidentScreen.routeName);
  
