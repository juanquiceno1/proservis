import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Widget/historial_incapacidad.dart';
import 'Widget/show_modal.dart';

class ReporteIncapacidadScreen extends StatefulWidget {
  static const String routeName = 'reporte_incapacidad_screen';
  const ReporteIncapacidadScreen();

  @override
  _ReporteIncapacidadScreenState createState() => _ReporteIncapacidadScreenState();
}

class _ReporteIncapacidadScreenState extends State<ReporteIncapacidadScreen> {

  bool _option = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        _appbar(context),
        _body(context)
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
              'Reportar Incapacidad',
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

  Widget _body(BuildContext context) => Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Juliana Franco Restrepo',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Nombre Empresa',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 10.h,
                    width: 10.h,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/woman.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
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
      ),
      SizedBox(height: 15.sp,),
      _option?Text('falta desarollar'):HistorialIncapacidad()
    ],
  );
}