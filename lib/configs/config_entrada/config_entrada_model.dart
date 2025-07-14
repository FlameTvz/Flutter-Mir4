import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/voltar/voltar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'config_entrada_widget.dart' show ConfigEntradaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfigEntradaModel extends FlutterFlowModel<ConfigEntradaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegar Entradas)] action in ConfigEntrada widget.
  ApiCallResponse? pegar;
  // Model for Voltar component.
  late VoltarModel voltarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (tempoDebouncing)] action in IconButton widget.
  ApiCallResponse? apiResultydg;
  // Stores action output result for [Backend Call - API (entradazeroborda)] action in Icon widget.
  ApiCallResponse? apiResult7st;
  // Stores action output result for [Backend Call - API (entradazeroborda)] action in Icon widget.
  ApiCallResponse? apiResultqzz;
  // Stores action output result for [Backend Call - API (entradazeroborda)] action in Icon widget.
  ApiCallResponse? apiResultq5e;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (entradazeroborda Copy)] action in Icon widget.
  ApiCallResponse? apiResultzck;
  // Stores action output result for [Backend Call - API (entradazeroborda Copy)] action in Icon widget.
  ApiCallResponse? apiResulttt9;
  // Stores action output result for [Backend Call - API (entradazeroborda Copy)] action in Icon widget.
  ApiCallResponse? apiResultaw5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - API (entradazeroborda Copy Copy)] action in Icon widget.
  ApiCallResponse? apiResultijq;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {
    voltarModel = createModel(context, () => VoltarModel());
  }

  @override
  void dispose() {
    voltarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
