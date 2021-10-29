import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldDateTime extends StatefulWidget {
  final String description;
  final String icon;
  final bool calendar;
  const TextFieldDateTime({
    Key? key, 
    required this.description, 
    required this.icon, 
    required this.calendar
  }) : super(key: key);

  @override
  _TextFieldDateTimeState createState() => _TextFieldDateTimeState();
}

class _TextFieldDateTimeState extends State<TextFieldDateTime> {
  final TextEditingController _controller = TextEditingController();
  DateTime _selecteddate= DateTime.now();
  TimeOfDay _selectedtime = TimeOfDay.now();

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
    controller: _controller,
    onTap: ()=>widget.calendar?_selectDate(context):_selectTime(context),
    readOnly: true,
    obscureText: false,
    textCapitalization: TextCapitalization.sentences,
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
      // prefixIcon: Icon(
      //   icon,
      //   color: Colors.green,
      //   size: 20.sp,
      // ),
      labelText: widget.description,
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      hoverColor: Colors.grey,
      alignLabelWithHint: true,
      filled: true,
      isDense: false,
      border: outline(50, 1, Colors.green),
      focusedBorder: outline(50, 1, Colors.green),
      disabledBorder: outline(50, 1, Colors.green),
      enabledBorder: outline(50, 1, Colors.green),
      focusedErrorBorder: outline(50, 1, Colors.green)
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

  Future<DateTime?> _selectDate(BuildContext context) async{
    // final DateTime? selected = await showDatePicker(
    //   context: context,
    //   initialDate: date,
    //   firstDate: _selecteddate,
    //   lastDate: DateTime(2030),
    //   errorInvalidText: 'dd/mm/aa',
    //   // helpText: ''
    // );
    // if (selected != null && selected != _selecteddate)
    // setState(() {
    //   _selecteddate = selected;
    //   _controller.text = '${selected.day}/${selected.month}/${selected.year}';
    // });
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selecteddate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
 
    );
    if (selected != null && selected != _selecteddate)
      setState(() {
        _selecteddate = selected;
        _controller.text = '${selected.day}/${selected.month}/${selected.year}';
      });
  }

  _selectTime(BuildContext context) async{
    final TimeOfDay? selected = await showTimePicker(
      context: context, 
      initialTime: _selectedtime,
    );
    if (selected != null /* && selected != _selectedtime */)
    setState(() {
      _selectedtime = selected;
      // print('${selected.hour}:${selected.minute}/${selected.period.index}');
      _controller.text = '${selected.hour}:${selected.minute}';
    });
  }

  OutlineInputBorder outline(double radius, double wi, Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(width: 1, color: Colors.green),
  );
}