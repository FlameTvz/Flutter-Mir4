import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'botaoredondo_model.dart';
export 'botaoredondo_model.dart';

class BotaoredondoWidget extends StatefulWidget {
  const BotaoredondoWidget({super.key});

  @override
  State<BotaoredondoWidget> createState() => _BotaoredondoWidgetState();
}

class _BotaoredondoWidgetState extends State<BotaoredondoWidget> {
  late BotaoredondoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotaoredondoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.import_export_rounded,
      color: FlutterFlowTheme.of(context).primary,
      size: 24.0,
    );
  }
}
