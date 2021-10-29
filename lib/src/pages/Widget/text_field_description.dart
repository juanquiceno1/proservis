import 'package:flutter/material.dart';
import 'package:proservis/src/utils/theme/out_line_border.dart';
import 'package:sizer/sizer.dart';

class TextFieldDescription extends StatefulWidget {
  final String description;
  const TextFieldDescription({Key? key, required this.description}) : super(key: key);
  @override
  _TextFieldDescriptionState createState() => _TextFieldDescriptionState();
}

class _TextFieldDescriptionState extends State<TextFieldDescription> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => TextFormField(
    // focusNode: focus,
    controller: _controller,
    // onTap: funtion,
    textCapitalization: TextCapitalization.sentences,
    obscureText: false,
    keyboardType: TextInputType.multiline,
    textInputAction: TextInputAction.newline,
    maxLength: 500,
    minLines: 1,
    maxLines: 50,
    onFieldSubmitted: (value) {
      
    },
    style: TextStyle(color: Colors.black, fontSize: 11.sp),
    cursorColor: Colors.green,
    decoration:InputDecoration(
      fillColor: Colors.green[50],
      contentPadding: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 10.sp),
      // labelText: description,
      // labelStyle: TextStyle(
      //   color: Colors.grey,
      // ),
      hintText: widget.description,
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      hoverColor: Colors.grey,
      alignLabelWithHint: true,
      filled: true,
      isDense: true,
      border: OutLineBorder().outline(50, 1, Colors.green),
      focusedBorder: OutLineBorder().outline(50, 1, Colors.green),
      disabledBorder: OutLineBorder().outline(50, 1, Colors.green),
      enabledBorder: OutLineBorder().outline(50, 1, Colors.green),
      focusedErrorBorder: OutLineBorder().outline(50, 1, Colors.green)
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return '${widget.description} Requerido';
      } else {
        return null;
      }
    },
    onSaved: (value) {},
  );
}