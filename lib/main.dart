import 'package:flutter/material.dart';

import 'src/pages/carnet_screen.dart';
import 'src/utils/routes/routes.dart';
import 'src/utils/theme/theme.dart';
import 'package:sizer/sizer.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) => Sizer(
    builder: (context, orientation, deviceType) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'proservis',
      home: CarnetScreen(),
      initialRoute: CarnetScreen.routeName,
      routes: routes,
      theme:  theme,
    ),
  );
}