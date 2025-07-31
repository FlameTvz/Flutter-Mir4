import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'addesps_widget.dart' show AddespsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: prefer_const_literals_to_create_immutables
class AddespsModel extends FlutterFlowModel<AddespsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (pegar Esps Autorizados)] action in Button widget.
  ApiCallResponse? apiResultrjy;
  var idDoEspQR = '';
  // Stores action output result for [Backend Call - API (adicionar quais esps usuario tem)] action in Button widget.
  ApiCallResponse? apiResult7xs;
  // Stores action output result for [Backend Call - API (pegar Esps Autorizados)] action in Button widget.
  ApiCallResponse? teste;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
