import 'package:flutter/material.dart';
import 'package:proservis/src/models/descripcion_tarjeta_model.dart';
import 'package:sizer/sizer.dart';

class TarjetaDescripcion extends StatelessWidget {
  final DescripcionModel data;
  const TarjetaDescripcion({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Card(
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
          _icon(data.image),
          SizedBox(width: 5.sp,),
          Expanded(
            child: _data(data)
          ),
          SizedBox(width: 5.sp,),
          _download(data.download)
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
      height: 30.sp,
      width: 30.sp,
    ),
  );

  Widget _data(DescripcionModel _data) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        _data.title,
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey[600]
        ),
      ),
      Text(
        '${_data.description} | ${_data.size}',
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey[350]
        ),
      ),
    ],
  );

  Widget _download(String down) =>GestureDetector(
    onTap: () {
      print(down);
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
        size: 14.sp,
      ),
    ),
  );
}