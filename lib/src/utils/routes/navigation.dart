import 'package:flutter/material.dart';

exitAplication(BuildContext context, bool exit) =>
    exit ? Navigator.of(context).pop(true) : Navigator.of(context).pop(false);

navigateCanPop(BuildContext context) => Navigator.canPop(context);

