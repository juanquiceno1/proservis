import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FileContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () async {
      FilePickerResult? _result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png','pdf', 'doc'],
      );
      // FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (_result != null) {
        PlatformFile file = _result.files.first;
        print(file.name);
        print(file.bytes);
        print(file.size);
        print(file.extension);
        print(file.path);
      } else {
        print('sin nada');
        // User canceled the picker
      }
    },
    child: DottedBorder(
      color: Colors.green,
      strokeWidth: 1,
      dashPattern: [5],
      radius: Radius.circular(50),
      borderType: BorderType.RRect,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.green[50]
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adjunta Documentos',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '(jpg, png, pdf, doc)',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
            Image.asset(
              'assets/load-file.png',
              height: 22.sp,
            )
          ],
        ),
      ),
    ),
  );
}