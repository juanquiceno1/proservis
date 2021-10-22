import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Widget/show_modal.dart';

class CertificadoScreen extends StatefulWidget {
  static const String routeName = 'certificado_screen';
  const CertificadoScreen();

  @override
  _CertificadoScreenState createState() => _CertificadoScreenState();
}

class _CertificadoScreenState extends State<CertificadoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _content(context)
    );
  }

  Widget _content(BuildContext context)=>SingleChildScrollView(
    child: Column(
      children: [
        _appbar(context),
        _body(context),
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
              'Mis Certificados',
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
      _container(
        'comprobante-pago.png', //TODO optimizar con un modelo
        'Comprobante de Pago',
        '4 de Abril 2020',
        '473 KB',
        'Comprobante de Pago'
        
      ),
      _container(
        'certificado.png', 
        'Certificado Ingresos y Retenciones',
        '4 de Abril 2020',
        '473 KB',
        'Certificado Ingresos y Retenciones'
      ),
      _container(
        'seguridad-social.png', 
        'Seguridad Social',
        '4 de Abril 2020',
        '473 KB',
        'Seguridad Social'
      ),
    ],
  );

  Widget _container(String image, String title, 
  String description, String size, String rutaDescarga)=>Card(
    margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 14.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp)
      ),
      child: Row(
        children: [
          _icon(image),
          SizedBox(width: 5.sp,),
          Expanded(
            child: _data(title, description, size)
          ),
          SizedBox(width: 5.sp,),
          _download(rutaDescarga)
        ],
      ),
    ),
  );

  Widget _icon(String image,) => Container(
    decoration: BoxDecoration(
      color: Colors.amber.withOpacity(0.2),
      borderRadius: BorderRadius.circular(8.sp)
    ),
    padding: EdgeInsets.all(5.sp),
    child: Image.asset(
      'assets/$image',
      height: 35.sp,
      width: 35.sp,
    ),
  );

  Widget _data(String title, String description, String size) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey[600]
        ),
      ),
      Text(
        '$description | $size',
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey[350]
        ),
      ),
    ],
  );

  Widget _download(String rutaDescarga) =>GestureDetector(
    onTap: () {
      print(rutaDescarga);
    },
    child: Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(
        Icons.download,
        color: Colors.white,
        size: 16.sp,
      ),
    ),
  );
}