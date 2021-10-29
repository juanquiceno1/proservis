import 'package:flutter/material.dart';
import 'package:proservis/src/pages/Widget/button.dart';
import 'package:proservis/src/pages/Widget/file_container.dart';
import 'package:proservis/src/pages/Widget/text_field_description.dart';
import 'package:proservis/src/pages/Widget/text_field_drown.dart';
import 'package:proservis/src/pages/Widget/text_field_text.dart';
import 'package:proservis/src/pages/Widget/textfield_date_time.dart';
import 'package:sizer/sizer.dart';

class NewIncapacity extends StatefulWidget {

  @override
  _NewIncapacityState createState() => _NewIncapacityState();
}

class _NewIncapacityState extends State<NewIncapacity> {

  // final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  bool _isChecked = false;
  List<String> _itemsdrop =  [
    'Apple','Banana','Grapes','Orange','watermelon','Pineapple',
    '1Apple','1Banana','1Grapes','1Orange','1watermelon','1Pineapple',
  ];

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
                description: 'F. finaliza', 
                icon: 'calendar.png',
                calendar: true,
              )
            )
          ],
        ),
        SizedBox(height: 15.sp,),
        Row(
          children: [
            Expanded(
              child: TextFieldDateTime(
                description: 'Hora', 
                icon: 'clock.png',
                calendar: false,
              )
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: TextFieldText(
                description: 'Lugar',
                icon: 'location.png',
              ),
            )
          ],
        ),
        SizedBox(height: 15.sp,),
        Column(
          children: [
            TextFieldDown(
              description: 'Codigo Incapacidad',
              icon: 'point.png',
              items: _itemsdrop,
            ),
            SizedBox(height: 5.sp,),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(_getColor),
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text(
                  'No Tengo Codigo',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          ],
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
        SizedBox(height: 15.sp,),
        FileContainer(),
        SizedBox(height: 15.sp,),
        Button(description: 'REPORTAR INCAPACIDAD',),
      ],
    ),
  );

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.green;
  }
}