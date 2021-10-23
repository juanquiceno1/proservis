import 'package:flutter/material.dart';
import 'package:proservis/src/utils/routes/navigation.dart';


class ShowModaloption extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.credit_card),
        title: Text('Mi Carnet'),
        onTap: () {
          navigatePop(context, false);
          navigateToCredential(context, true);
        },
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Mi ejecutivo de cuenta'),
        onTap: () {
          navigatePop(context, false);
          navigateToAccountExecutive(context, true);
        },
      ),
      ListTile(
        leading: Icon(Icons.list_alt_outlined),
        title: Text('Mis cetificados'),
        onTap: () {
          navigatePop(context, false);
          navigateToCertificate(context, true);
        },
      ),
      ListTile(
        leading: Icon(Icons.card_travel_rounded),
        title: Text('Carta laboral'),
        onTap: () {
          navigatePop(context, false);
        },
      ),
      ListTile(
        leading: Icon(Icons.contacts_rounded),
        title: Text('Contrato'),
        onTap: () {
          navigatePop(context, false);
        },
      ),
      ListTile(
        leading: Icon(Icons.person_add_alt_1_sharp),
        title: Text('Fondo empleados'),
        onTap: () {
          navigatePop(context, false);
        },
      ),
      ListTile(
        leading: Icon(Icons.medical_services),
        title: Text('Reporde incapacidad'),
        onTap: () {
          navigatePop(context, false);
          navigateToDisabilityreport(context, true);
        },
      ),
    ],
  );
}