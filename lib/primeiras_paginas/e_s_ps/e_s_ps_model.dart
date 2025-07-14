import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/addesps/addesps_widget.dart';
import '/popups/delete_e_s_p/delete_e_s_p_widget.dart';
import '/popups/mudarnome/mudarnome_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'e_s_ps_widget.dart' show ESPsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ESPsModel extends FlutterFlowModel<ESPsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegar Esps Autorizados)] action in ESPs widget.
  ApiCallResponse? apiResulttj8;
  // Stores action output result for [Backend Call - API (pegarStatus)] action in Button widget.
  ApiCallResponse? test;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
