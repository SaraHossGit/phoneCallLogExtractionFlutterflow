import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'bottom_sheet1_widget.dart' show BottomSheet1Widget;
import 'package:flutter/material.dart';

class BottomSheet1Model extends FlutterFlowModel<BottomSheet1Widget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
