import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarnetScreen extends StatelessWidget {
  static const String routeName = 'carnet_screen';
  const CarnetScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context)
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        _appbar(context),
        _card(context),
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
            onPressed: (){}, 
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.green,
              // size: 15,
            )
          )
        ],
      ),
    ),
  );

  Widget _card(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                    bottom: 10.h
                  ),
                  child: Image.asset(
                    'assets/Logo-Proservis.png',
                    height: 12.h,
                    width: 12.h,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 13.h,
                        width: 13.h,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Colors.green,
                                Colors.green,
                                Colors.white,
                                Colors.white
                              ]
                            ),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/woman.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          _information(context),
          SizedBox(height: 5.h)
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