// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';
import 'package:call_log/call_log.dart';

Future readPhoneLog() async {
  var status = await Permission.phone.status;
  if (!status.isGranted) {
    status = await Permission.phone.request();
    if (!status.isGranted) {
      // Optionally, you can prompt a dialog here to inform user about the necessity of the permission
    }
  }

  if (await Permission.phone.request().isGranted) {
    Iterable<CallLogEntry> entries = await CallLog.get();

    // Converting enum to string
    String callType = CallType.values[entries.first.callType!.index]
        .toString()
        .split('.')
        .last;

    // Converting the integer timestamp (milliseconds since epoch) to DateTime
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(entries.first.timestamp ?? 0);

    // Formatting timestamp to string
    // String timestamp = DateFormat('yyyy-MM-dd – kk:mm').format(date);
    String timestamp = date.toString();

    FFAppState().myCallState = callType;
    FFAppState().myPhoneNumber = entries.first.number ?? '';
    FFAppState().myDuration = entries.first.duration.toString();
    FFAppState().myTimestamp = timestamp;
  }
}
