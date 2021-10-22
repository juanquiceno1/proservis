import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Widget/show_modal.dart';
import 'Widget/tarjeta.dart';

class EjecutivoCuentaScreen extends StatefulWidget {
  static const String routeName = 'ejecutivo_cuenta_screen';
  const EjecutivoCuentaScreen();

  @override
  _EjecutivoCuentaScreenState createState() => _EjecutivoCuentaScreenState();
}

class _EjecutivoCuentaScreenState extends State<EjecutivoCuentaScreen> {

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
      backgroundColor: Colors.white,
      body: _content(context)
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        _appbar(context),
        Tarjeta(
          image: 'assets/Logo-Proservis.png', 
          child: _data(context),
        ),
        SizedBox(height: 10.h,)
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
              'Mi Ejecutivo de Cuenta',
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

  Widget _data(BuildContext context) => Column(
    children: [
      Text(
        'Nombre Completo',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp
        ),
      ),
      Text(
        'EJECUTIVO DE CUENTA',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10.sp
        ),
      ),
      SizedBox(height: 5.h,),
      Text(
        'nombre.apellido@proservis.com.co',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10.sp
        ),
      ),
      Text(
        '305 444 5687',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10.sp
        ),
      ),
      SizedBox(height: 8.h,),
      Container(
        margin: EdgeInsets.symmetric(horizontal:10.w),
        padding: EdgeInsets.symmetric(
          vertical: 10.sp,
          horizontal: 10.sp
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellow
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/chat.png',
              color: Colors.grey,
              height: 16.sp,
              width: 16.sp,
            ),
            SizedBox(width: 5.sp,),
            Text(
              'COMENZAR CHAT',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      )
    ],
  );
}