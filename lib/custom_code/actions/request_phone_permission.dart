// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<void> requestPhonePermission() async {
  var status = await Permission.phone.status;
  if (!status.isGranted) {
    status = await Permission.phone.request();
    if (!status.isGranted) {
      // Optionally, you can prompt a dialog here to inform user about the necessity of the permission
    }
  }
}
