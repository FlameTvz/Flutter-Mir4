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

// ignore_for_file: prefer_const_constructors
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
class ControlesModel extends FlutterFlowModel<ControlesWidget> {
  ///  State fields for stateful widgets in this page.
  final formKey = GlobalKey<FormState>();
  final unfocusNode = FocusNode();
  // Model for VoltarWidget.
  late VoltarModel voltarModel;

  TextEditingController? serialController;
  String? Function(BuildContext, String?)? serialControllerValidator;
  // State field(s) for nome
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for placa
  TextEditingController? placaController;
  String? Function(BuildContext, String?)? placaControllerValidator;
  // State field(s) for apto
  TextEditingController? aptoController;
  String? Function(BuildContext, String?)? aptoControllerValidator;
  // State field(s) for bateria
  bool? bateriaValue;
  // State field(s) for clonagem
  bool? clonagemValue;

  Map<String, dynamic> controlesPorEsp = {};
  // Armazena a lista de controles do ESP atual.
  List<dynamic> listaDeControles = [];

  @override
  void initState(BuildContext context) {
    voltarModel = createModel(context, () => VoltarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    voltarModel.dispose();
    serialController?.dispose();
    nomeController?.dispose();
    placaController?.dispose();
    aptoController?.dispose();
  }
}
