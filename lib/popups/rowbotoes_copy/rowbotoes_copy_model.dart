import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/popups/botaoredondo/botaoredondo_widget.dart';
import 'dart:ui';
import 'rowbotoes_copy_widget.dart' show RowbotoesCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RowbotoesCopyModel extends FlutterFlowModel<RowbotoesCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for botaoredondo component.
  late BotaoredondoModel botaoredondoModel1;
  // Model for botaoredondo component.
  late BotaoredondoModel botaoredondoModel2;

  @override
  void initState(BuildContext context) {
    botaoredondoModel1 = createModel(context, () => BotaoredondoModel());
    botaoredondoModel2 = createModel(context, () => BotaoredondoModel());
  }

  @override
  void dispose() {
    botaoredondoModel1.dispose();
    botaoredondoModel2.dispose();
  }
}
