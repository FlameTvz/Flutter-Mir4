// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/popups/mudarnome_dois/mudarnome_dois_widget.dart';
import 'dart:ui';
import 'rele2_widget.dart' show Rele2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Rele2Model extends FlutterFlowModel<Rele2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (modoAcionamento Copy Dois)] action in ChoiceChips widget.
  ApiCallResponse? apiResult5xx;
  // Stores action output result for [Backend Call - API (modoAcionamento Copy Tres)] action in ChoiceChips widget.
  ApiCallResponse? apiResultjv8;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (tempoPulso Copy)] action in Button widget.
  ApiCallResponse? apiResultct8;
  // Stores action output result for [Backend Call - API (tempoDebouncing Copy)] action in Button widget.
  ApiCallResponse? apiResultydg;
  // Stores action output result for [Backend Call - API (pegarStatusDois)] action in Button widget.
  ApiCallResponse? apiResultjd4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
