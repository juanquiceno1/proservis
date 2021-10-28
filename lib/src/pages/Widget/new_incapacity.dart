import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewIncapacity extends StatefulWidget {

  @override
  _NewIncapacityState createState() => _NewIncapacityState();
}

class _NewIncapacityState extends State<NewIncapacity> {

  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  final FocusNode _focusdatastart = FocusNode();
  final FocusNode _focusdataend = FocusNode();

  final TextEditingController _datestartController = TextEditingController();
  final TextEditingController _dateendController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _diagnostiController = TextEditingController();
  final TextEditingController _descritionController = TextEditingController();
  DateTime _selecteddatestart = DateTime.now();
  DateTime _selecteddatesend = DateTime.now();
  TimeOfDay _selectedtime = TimeOfDay.now();

  bool _isfile = false;
  bool _isChecked = false;

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.green;
  }

  @override
  void initState() {
    super.initState();  
  }

  @override
  void dispose() {
    _focusdatastart.dispose();
    _focusdataend.dispose();
    _datestartController.dispose();
    _dateendController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    _nameController.dispose();
    _diagnostiController.dispose();
    _descritionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _date(
                context, 
                // _focusdatastart, 
                'F. inicio', 
                'calendar',
                _datestartController,
                () async{
                  final DateTime? selected = await _selectDate(context, _selecteddatestart);
                  if (selected != null && selected != _selecteddatestart)
                  setState(() {
                    _selecteddatestart = selected;
                    _datestartController.text = '${selected.day}/${selected.month}/${selected.year}';
                  });
                }
              )
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: _date(
                context, 
                // _focusdataend,
                'F. finaliza',
                'calendar',
                _dateendController,
                () async{
                  final DateTime? selected = await _selectDate(context, _selecteddatesend);
                  if (selected != null && selected != _selecteddatesend)
                  setState(() {
                    _selecteddatesend = selected;
                    _dateendController.text = '${selected.day}/${selected.month}/${selected.year}';
                  });
                }
              )
            )
          ],
        ),
        SizedBox(height: 10.sp,),
        Row(
          children: [
            Expanded(
              child: _date(
                context, 
                'Hora', 
                'clock',
                _timeController,
                () async{
                  final TimeOfDay? selected = await _selectTime(context);
                  // await showTimePicker(
                  //   context: context, 
                  //   initialTime: _selectedtime,
                  // );
                  print('====');
                  if (selected != null /* && selected != _selectedtime */)
                  setState(() {
                    _selectedtime = selected;
                    // print('${selected.hour}:${selected.minute}/${selected.period.index}');
                    _timeController.text = '${selected.hour}:${selected.minute}';
                  });
                }
              )
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: _textform(
                context, 
                'Lugar',
                'location',
                _locationController,
                () async{
                  
                }
              )
            )
          ],
        ),
        SizedBox(height: 10.sp,),
        if(!_isChecked)
          _textformpoint(
            context, 
            'Codigo Incapacidad',
            'point',
            _nameController,
            () async{
              
            }
          ),
        SizedBox(height: 5.sp,),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(_getColor),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Text(
              'No Tengo Codigo',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            )
          ],
        ),
        _textform(
          context, 
          'Diagnostico',
          'heart',
          _diagnostiController,
          () async{
            
          }
        ),
        _descriptionform(
          context, 
          'Descripcion Escribe aca lo sucedido. Maximo 500 caracteres.',
          Icons.location_on_outlined,
          _descritionController,
          () async{
              
          }
        ),

        GestureDetector(
          onTap: () async {
            FilePickerResult? _result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg', 'png','pdf', 'doc'],
            );
            // FilePickerResult? result = await FilePicker.platform.pickFiles();

            if (_result != null) {
              _isfile = true;
              PlatformFile file = _result.files.first;

              print(file.name);
              print(file.bytes);
              print(file.size);
              print(file.extension);
              print(file.path);
            } else {
              _isfile = false;
              print('sin nada');
              // User canceled the picker
            }
          },
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          padding: EdgeInsets.symmetric(
            vertical: 10.sp,
            horizontal: 10.sp
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.yellow
          ),
          child: Center(
            child: Text(
              'REPORTAR ACCIDENTE',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        )
      ],
    ),
  );

  Widget _date(BuildContext context, /* FocusNode focus, */ String description, 
  String icon, TextEditingController controller ,VoidCallback funtion) => TextFormField(
    // focusNode: focus,
    controller: controller,
    onTap: funtion,
    readOnly: true,
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
          AssetImage('assets/$icon.png'), 
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
      labelText: description,
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
        return '$description Requerido';
      } else {
        return null;
      }
    },
    onSaved: (value) {},
  );

  Widget _textformpoint(BuildContext context, /* FocusNode focus, */ String description, 
  String icon, TextEditingController controller ,VoidCallback funtion) => Padding(
    padding: EdgeInsets.symmetric(vertical:5.sp),
    child: TextFormField(
      // focusNode: focus,
      controller: controller,
      onTap: funtion,
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
            AssetImage('assets/$icon.png'), 
            color: Colors.green,
            size: 30.sp,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20.sp
        ),
        suffixIcon: IconButton(
          onPressed: (){

          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded, 
            color: Colors.grey,
            size: 24.0,
          ),
        ),
        labelText: description,
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
          return '$description Requerido';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    ),
  );

  Widget _textform(BuildContext context, /* FocusNode focus, */ String description, 
  String icon, TextEditingController controller ,VoidCallback funtion) => Padding(
    padding: EdgeInsets.symmetric(vertical:5.sp),
    child: TextFormField(
      // focusNode: focus,
      controller: controller,
      onTap: funtion,
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
            AssetImage('assets/$icon.png'), 
            color: Colors.green,
            size: 30.sp,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20.sp
        ),
        labelText: description,
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
          return '$description Requerido';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    ),
  );

  Widget _descriptionform(BuildContext context, /* FocusNode focus, */ String description, 
  IconData icon, TextEditingController controller ,VoidCallback funtion) => Padding(
    padding: EdgeInsets.symmetric(vertical:5.sp),
    child: TextFormField(
      // focusNode: focus,
      controller: controller,
      onTap: funtion,
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
        hintText: description,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        hoverColor: Colors.grey,
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        border: outline(50, 1, Colors.green),
        focusedBorder: outline(50, 1, Colors.green),
        disabledBorder: outline(50, 1, Colors.green),
        enabledBorder: outline(50, 1, Colors.green),
        focusedErrorBorder: outline(50, 1, Colors.green)
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$description Requerido';
        } else {
          return null;
        }
      },
      onSaved: (value) {},
    ),
  );

  OutlineInputBorder outline(double radius, double wi, Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(width: 1, color: Colors.green),
  );

  Future<DateTime?> _selectDate(BuildContext context, DateTime date) async{
    return await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().toLocal(),
      lastDate: DateTime(2030),
      errorInvalidText: 'dd/mm/aa',
      // helpText: ''
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async{
    return await showTimePicker(
      context: context, 
      initialTime: _selectedtime,
    );
  }
}