import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Tarjeta extends StatelessWidget {
  final String image;
  final Widget child;
  const Tarjeta({Key? key, required this.image, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Padding(
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
                  //TODO cambiar Image.network(ruta)
                  child: Image.asset(
                    image,
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
          child,
          SizedBox(height: 5.h)
        ],
      )
    )
  );
}
