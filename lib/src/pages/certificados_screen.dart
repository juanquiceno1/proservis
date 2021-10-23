import 'package:flutter/material.dart';
import 'package:proservis/src/models/descripcion_tarjeta_model.dart';
import 'package:sizer/sizer.dart';
import 'Widget/show_modal.dart';
import 'Widget/tarjeta_descricion.dart';

class CertificadoScreen extends StatefulWidget {
  static const String routeName = 'certificado_screen';
  const CertificadoScreen();

  @override
  _CertificadoScreenState createState() => _CertificadoScreenState();
}

class _CertificadoScreenState extends State<CertificadoScreen> {
  late DescripcionList _card;
  final List<Map<String, dynamic>> _data = [
    {
      'image': 'comprobante-pago.png',
      'title': 'Comprobante de Pago',
      'description': '4 de Abril 2020',
      'size': '473 KB',
      'download': 'Comprobante de Pago'
    },
    {
      'image': 'certificado.png', 
      'title': 'Certificado Ingresos y Retenciones',
      'description':'4 de Abril 2020',
      'size': '473 KB',
      'download': 'Certificado Ingresos y Retenciones'
    },
    {
      'image': 'seguridad-social.png',
      'title': 'Seguridad Social',
      'description': '473 KB',
      'size': '473 KB',
      'download': 'Seguridad Social',
    }
  ];

  @override
  void initState() {
    try {
      _card = DescripcionList.fromJson(_data);
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
      for (DescripcionModel item in _card.data)
        TarjetaDescripcion(data: item,)
    ],
  );

}