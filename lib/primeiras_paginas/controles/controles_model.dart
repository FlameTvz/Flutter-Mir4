import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/voltar/voltar_widget.dart';
import 'dart:ui';
import 'controles_widget.dart' show ControlesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlesModel extends FlutterFlowModel<ControlesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegar Esps Autorizados)] action in Controles widget.
  ApiCallResponse? apiResulttj8;
  // Model for Voltar component.
  late VoltarModel voltarModel;

  @override
  void initState(BuildContext context) {
    voltarModel = createModel(context, () => VoltarModel());
  }

  @override
  void dispose() {
    voltarModel.dispose();
  }
}
