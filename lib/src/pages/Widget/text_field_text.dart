import 'package:flutter/material.dart';
import 'package:proservis/src/utils/theme/out_line_border.dart';
import 'package:sizer/sizer.dart';

class TextFieldText extends StatefulWidget {
  final String description;
  final String icon;
  const TextFieldText({Key? key, required this.description, required this.icon,}) : super(key: key);
  @override
  _TextFieldTextState createState() => _TextFieldTextState();
}

class _TextFieldTextState extends State<TextFieldText> {
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
      readOnly: false,
      textCapitalization: TextCapitalization.sentences,
      obscureText: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        
      },
      style: TextStyle(color: Colors.black, fontSize: 11.sp),
      cursorColor: Colors.green,
      decoration:InputDecoration(
        fillColor: Colors.green[50],
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.sp),
          child: ImageIcon(
            AssetImage('assets/${widget.icon}'), 
            color: Colors.green,
            size: 30.sp,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20.sp
        ),
        labelText: widget.description,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        hoverColor: Colors.grey,
        alignLabelWithHint: true,
        filled: true,
        isDense: false,
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