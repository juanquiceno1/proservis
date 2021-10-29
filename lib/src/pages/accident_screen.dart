import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Widget/description_image.dart';
import 'Widget/historial.dart';
import 'Widget/new_accident.dart';
import 'Widget/show_modal.dart';

class AccidentScreen extends StatefulWidget {
  static const String routeName = 'accident_screen';
  const AccidentScreen();
  @override
  _AccidentScreenState createState() => _AccidentScreenState();
}

class _AccidentScreenState extends State<AccidentScreen> {

  bool _option = true;
  final List<Map<String, dynamic>> _historial = [
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
  Widget build(BuildContext context) => Scaffold(
    body: _content(context)
  );

  Widget _content(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        _appbar(context),
        _body(context),
        SizedBox(height: 15.sp,),
        _option
        ?NewAccident()
        :Historial(
          historial: _historial,
        )
      ],
    ),
  );

  Widget _appbar(BuildContext context) => SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
      child: Row(
        children: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.arrow_back_ios_rounded)
          ),
          Expanded(
            child: Text(
              'Reportar Accidente',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            )
          ),
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (context) => ShowModaloption()
              );
            }, 
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.green,
              size: 20.sp,
            )
          )
        ],
      ),
    ),
  );

  Widget _body(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Column(
      children: [
        DescriptionImage(
          name: 'Juliana Franco Restrepo',
          business: 'Nombre Empresa',
          image: 'woman.png',
        ),
        Container(
          margin: EdgeInsets.only(top: 3.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    _option = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  decoration: BoxDecoration(
                    color: _option
                    ? Colors.green
                    :Colors.grey[100],
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    'Nueva Incapacidad',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _option
                      ?Colors.white
                      :Colors.green,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _option = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: !_option
                      ? Colors.green
                      :Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      'Historial',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: !_option
                        ?Colors.white
                        :Colors.green,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}