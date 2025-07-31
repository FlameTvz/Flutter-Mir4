// Copie e cole este código substituindo todo o conteúdo de add_controle_manual_widget.dart

import 'package:flutter/material.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

class AddControleManualWidget extends StatefulWidget {
  final String idesp;

  const AddControleManualWidget({
    Key? key,
    required this.idesp,
  }) : super(key: key);

  @override
  _AddControleManualWidgetState createState() =>
      _AddControleManualWidgetState();
}

class _AddControleManualWidgetState extends State<AddControleManualWidget> {
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _aptoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _serialController.dispose();
    _nomeController.dispose();
    _placaController.dispose();
    _aptoController.dispose();
    super.dispose();
  }

  Future<void> _adicionarControle() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    final int idControle = DateTime.now().millisecondsSinceEpoch;

    var result = await ControlesGroup.addControleCall.call(
      idesp: widget.idesp,
      token: currentJwtToken,
      idcontrole: idControle,
      serial: _serialController.text,
      nome: _nomeController.text,
      placa: _placaController.text,
      apto: _aptoController.text,
      bateria: true,
      clonagem: false,
    );

    setState(() => _isLoading = false);

    if (mounted) {
      if (result.succeeded) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Controle adicionado com sucesso!'),
          backgroundColor: FlutterFlowTheme.of(context).success,
        ));
        Navigator.of(context).pop(true); // Retorna 'true' para indicar sucesso
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Falha ao adicionar o controle.'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Usando o widget Dialog para maior controle sobre o layout
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5.0,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Essencial para o Column se ajustar ao conteúdo
            children: [
              Text(
                'Adicionar Controle Manual',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              SizedBox(height: 24.0),
              // Envolve a parte rolável em Flexible e SingleChildScrollView
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _serialController,
                        decoration: InputDecoration(
                          labelText: 'Serial',
                          hintText: 'Digite o serial...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                        ),
                        validator: (value) => (value == null || value.isEmpty) ? 'Campo obrigatório' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          hintText: 'Ex: João Silva',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                        ),
                        validator: (value) => (value == null || value.isEmpty) ? 'Campo obrigatório' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _aptoController,
                        decoration: InputDecoration(
                          labelText: 'Apartamento (Opcional)',
                          hintText: 'Ex: Apto 101',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _placaController,
                        decoration: InputDecoration(
                          labelText: 'Placa (Opcional)',
                          hintText: 'Ex: BRA2E19',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              // Botões de Ação
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancelar', style: TextStyle(color: FlutterFlowTheme.of(context).secondaryText)),
                  ),
                  SizedBox(width: 8),
                  FFButtonWidget(
                    onPressed: _isLoading ? null : _adicionarControle,
                    text: _isLoading ? 'Aguarde...' : 'Adicionar',
                    options: FFButtonOptions(
                      height: 40,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}