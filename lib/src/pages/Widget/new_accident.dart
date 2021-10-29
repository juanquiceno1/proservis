import 'package:flutter/material.dart';
import 'package:proservis/src/pages/Widget/text_field_drown.dart';
import 'package:sizer/sizer.dart';

import 'button.dart';
import 'file_container.dart';
import 'text_field_description.dart';
import 'text_field_text.dart';
import 'textfield_date_time.dart';

class NewAccident extends StatefulWidget {

  @override
  _NewAccidentState createState() => _NewAccidentState();
}

class _NewAccidentState extends State<NewAccident> {

  List<String> _itemsdrop =  ['Si', 'No'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFieldDateTime(
                description: 'F. inicio', 
                icon: 'calendar.png',
                calendar: true,
              )
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: TextFieldDateTime(
                description: 'Hora', 
                icon: 'clock.png',
                calendar: false,
              )
            ),
          ],
        ),
        SizedBox(height: 15.sp,),
        Row(
          children: [
            Expanded(
              child: TextFieldText(
                description: 'Lugar',
                icon: 'location.png',
              ),
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: TextFieldText(
                description: 'Con Que? Objeto es',
                icon: 'accident.png',
              ),
            )
          ],
        ),
        SizedBox(height: 15.sp,),
        TextFieldDown(
          description: 'Testigos',
          icon: 'point.png',
          items: _itemsdrop,
        ),
        SizedBox(height: 15.sp,),
        TextFieldText(
          description: 'Nombre & Apellido Testigo',
          icon: 'name.png',
        ),
        SizedBox(height: 15.sp,),
        TextFieldText(
          description: 'Diagnostico',
          icon: 'heart.png',
        ),
        SizedBox(height: 15.sp,),
        TextFieldDescription(
          description: 'Descripcion\nEscribe aca lo sucedido. Maximo 500 caracteres.',
        ),
        Button(description: 'REPORTAR ACCIDENTE',),
      ],
    ),
  );
}