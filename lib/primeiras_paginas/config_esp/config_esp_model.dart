import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'config_esp_widget.dart' show ConfigEspWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: prefer_const_literals_to_create_immutables

class ConfigEspModel extends FlutterFlowModel<ConfigEspWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (pegar Agendamentos)] action in Container widget.
  ApiCallResponse? prog;
  bool showQRCode = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
