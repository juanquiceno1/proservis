import 'package:flutter/material.dart';
import 'package:proservis/src/pages/Widget/show_modal.dart';
import 'package:sizer/sizer.dart';
import 'Widget/tarjeta.dart';

class CarnetScreen extends StatelessWidget {
  static const String routeName = 'carnet_screen';
  const CarnetScreen();

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
          child: _information(context),
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
              'Mi Carné',
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

  Widget _information(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Text(
                  'Juliana Franco Restrepo',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/box-qr.png',
                  height: 12.h,
                  width: 12.h,
                ),
                Image.asset(
                  'assets/qr.png',
                  height: 11.h,
                  width: 11.h,
                )
              ],
            )
          ],
        ),
        SizedBox(height: 5.h,),
        _data('CARGO :', 'OPERARIO'),
        SizedBox(height: 2.h,),
        Row(
          children: [
            Expanded(child: _data('RH : ', 'OPERARIO')),
            SizedBox(width: 5.w,),
            Expanded(child: _data('CC :', '12345678'))
          ],
        ),
        SizedBox(height: 2.h,),
        _data('CLIENTE :', 'GOODYEAR S.A.'),
        SizedBox(height: 2.h,),
        Row(
          children: [
            Expanded(child: _data('INGRESO : ','OPERARIO')),
            SizedBox(width: 5.w,),
            Expanded(child: _data('ARL :', 'SURA'))
          ],
        ),
        SizedBox(height: 2.h,),
        _data('NO. CONTRATO', '1234'),
      ],
    ),
  );

  Widget _data(String title, String description) => Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey
              ),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 11.sp,
              color: Colors.grey[700]
            ),
          )
        ],
      ),
      Divider()
    ],
  );
}