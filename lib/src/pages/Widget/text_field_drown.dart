import 'package:flutter/material.dart';
import 'package:proservis/src/utils/theme/out_line_border.dart';
import 'package:sizer/sizer.dart';

class TextFieldDown extends StatefulWidget {
  final String description;
  final String icon;
  final List<String> items;
  const TextFieldDown({Key? key, required this.description, required this.items, required this.icon}) : super(key: key);

  @override
  _TextFieldDownState createState() => _TextFieldDownState();
}

class _TextFieldDownState extends State<TextFieldDown> {

  var _item;
  @override


  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
    items: widget.items.map((String item) {
      return new DropdownMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList(),
    onChanged: (newValue) {
      // do other stuff with _item
      setState(() => _item = newValue);
    },
    value: _item,
    decoration: InputDecoration(
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
  );
}