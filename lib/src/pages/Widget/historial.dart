import 'package:flutter/material.dart';
import 'package:proservis/src/models/descripcion_tarjeta_model.dart';
import 'package:sizer/sizer.dart';
import 'tarjeta_descricion.dart';

class Historial extends StatefulWidget {
  final List<Map<String, dynamic>> historial;
  const Historial({Key? key, required this.historial}) : super(key: key);
  @override
  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {

  late DescripcionList _card;
  
  @override
  void initState() {
    try {
      _card = DescripcionList.fromJson(widget.historial);
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
      if( _card.data.isNotEmpty)
        for (DescripcionModel item in _card.data) 
          TarjetaDescripcion(data: item,)
      else
        Column(
          children: [
            Image.asset(
              'assets/nodata.png',
              height: 40.h,
              width: 70.w,
            ),
            Text(
              'No Hay Informes',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
    ],
  );
}