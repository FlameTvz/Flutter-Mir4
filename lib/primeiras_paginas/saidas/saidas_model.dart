import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/voltar/voltar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'saidas_widget.dart' show SaidasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SaidasModel extends FlutterFlowModel<SaidasWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegarStatus)] action in Button widget.
  ApiCallResponse? teste;
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
