import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/popups/mudarnome_cinco/mudarnome_cinco_widget.dart';
import 'dart:ui';
import 'rele5_widget.dart' show Rele5Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Rele5Model extends FlutterFlowModel<Rele5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (modoAcionamento Copy Copy Copy Copy)] action in ChoiceChips widget.
  ApiCallResponse? apiResult9ds;
  // Stores action output result for [Backend Call - API (modoAcionamento Copy Copy Copy Copy Dois)] action in ChoiceChips widget.
  ApiCallResponse? apiResult5xx;
  // Stores action output result for [Backend Call - API (modoAcionamento Copy Copy Copy Copy Tres)] action in ChoiceChips widget.
  ApiCallResponse? apiResultjv8;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  late MaskTextInputFormatter textFieldMask4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - API (tempoPulso Copy Copy Copy Copy)] action in Button widget.
  ApiCallResponse? apiResultct8;
  // Stores action output result for [Backend Call - API (tempoDebouncing Copy Copy Copy Copy)] action in Button widget.
  ApiCallResponse? apiResultydg;
  // Stores action output result for [Backend Call - API (Hora Ativacao Copy Copy Copy Copy)] action in Button widget.
  ApiCallResponse? apiResultu3s;
  // Stores action output result for [Backend Call - API (HoraDesativacao Copy Copy Copy Copy)] action in Button widget.
  ApiCallResponse? apiResultohs;
  // Stores action output result for [Backend Call - API (pegarStatusCinco)] action in Button widget.
  ApiCallResponse? apiResultjd4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
