import 'package:flutter/material.dart';
import 'package:proservis/src/models/descripcion_tarjeta_model.dart';

import 'tarjeta_descricion.dart';


class HistorialIncapacidad extends StatefulWidget {
  // final List<DescripcionModel> data
  @override
  _HistorialIncapacidadState createState() => _HistorialIncapacidadState();
}

class _HistorialIncapacidadState extends State<HistorialIncapacidad> {

  late DescripcionList _card;
  final List<Map<String, dynamic>> _data = [
    {
      'image': 'incapacidad.png',
      'title': 'Informe de Incapacidad',
      'description': '4 de Abril 2020',
      'size': '473 KB',
      'download': 'Comprobante de Pago'
    },
    {
      'image': 'incapacidad.png', 
      'title': 'Informe de Incapacidad',
      'description':'4 de Abril 2020',
      'size': '473 KB',
      'download': 'Certificado Ingresos y Retenciones'
    },
    {
      'image': 'incapacidad.png',
      'title': 'Informe de Incapacidad',
      'description': '473 KB',
      'size': '473 KB',
      'download': 'Seguridad Social',
    }
  ];
  
  @override
  void initState() {
    try {
      _card = DescripcionList.fromJson(_data);
    } catch (e) {
      _card = [] as DescripcionList;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (DescripcionModel item in _card.data) 
        TarjetaDescripcion(data: item,)
    ],
  );
}