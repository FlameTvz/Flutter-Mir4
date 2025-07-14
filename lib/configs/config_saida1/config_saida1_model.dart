import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/mudarnome_um/mudarnome_um_widget.dart';
import 'dart:ui';
import 'config_saida1_widget.dart' show ConfigSaida1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfigSaida1Model extends FlutterFlowModel<ConfigSaida1Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegar Agendamentos)] action in ConfigSaida1 widget.
  ApiCallResponse? apiResultzvw;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (tempoPulso)] action in Button widget.
  ApiCallResponse? apiResultydg;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
