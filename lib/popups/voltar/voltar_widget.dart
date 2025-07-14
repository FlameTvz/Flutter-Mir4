import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'voltar_model.dart';
export 'voltar_model.dart';

class VoltarWidget extends StatefulWidget {
  const VoltarWidget({super.key});

  @override
  State<VoltarWidget> createState() => _VoltarWidgetState();
}

class _VoltarWidgetState extends State<VoltarWidget> {
  late VoltarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoltarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30.0,
      borderWidth: 1.0,
      buttonSize: 60.0,
      icon: Icon(
        Icons.arrow_back_rounded,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () async {
        context.safeGoBack();
      },
    );
  }
}
