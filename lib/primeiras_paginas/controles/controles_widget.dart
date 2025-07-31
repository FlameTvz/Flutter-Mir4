import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/voltar/voltar_widget.dart';
// Importe o novo widget de popup que você criou
import 'add_controle_manual_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controles_model.dart';
export 'controles_model.dart';

class ControlesWidget extends StatefulWidget {

  static const String routeName = 'Controles';
  static const String routePath = '/controles/:idesp/:nomeEsp';

  final String idesp;
  final String nomeEsp;

  const ControlesWidget({
    super.key,
    required this.idesp,
    required this.nomeEsp,
  });

  @override
  State<ControlesWidget> createState() => _ControlesWidgetState();
}

class _ControlesWidgetState extends State<ControlesWidget> {
  late ControlesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlesModel());
    _loadControles();
  }

  Future<void> _loadControles() async {
    // LÓGICA DO TOKEN REVERTIDA CONFORME SOLICITADO
    final controlesResult = await ControlesGroup.pegarControlesCall.call(
      idesp: widget.idesp,
      token: currentJwtToken,
    );

    if (controlesResult.succeeded) {
      final Map<String, dynamic> controlesData =
          getJsonField(controlesResult.jsonBody, r'''$''');
      List<dynamic> tempList = [];
      
      controlesData.forEach((key, value) {
        if (value is Map && key.startsWith('controle_')) {
          value['controleId'] = key;
          tempList.add(value);
        }
      });
      
      if (mounted) {
        setState(() {
          _model.listaDeControles = tempList;
        });
      }
    }
  }

  // Função para mostrar o popup de adicionar controle manual
  Future<void> _showAddManualDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AddControleManualWidget(idesp: widget.idesp),
    );

    // Se o popup retornou 'true', significa que um controle foi adicionado.
    // Então, recarregamos a lista.
    if (result == true) {
      _loadControles();
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async => context.safePop(),
            child: wrapWithModel(
              model: _model.voltarModel,
              updateCallback: () => setState(() {}),
              child: VoltarWidget(),
            ),
          ),
          title: Text(
            'Controles: ${widget.nomeEsp}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Divider(thickness: 2.0),
                    Text('Cadastrar Novo Controle',
                        style: FlutterFlowTheme.of(context).titleMedium),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var result = await ControlesGroup.modoAprendizadoCall.call(
                              idesp: widget.idesp,
                              token: currentJwtToken, // LÓGICA DO TOKEN REVERTIDA
                            );
                            if (result.succeeded) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('ESP em modo de aprendizado. Aproxime o novo controle.'),
                                backgroundColor: FlutterFlowTheme.of(context).success,
                              ));
                              Future.delayed(Duration(seconds: 10), () => _loadControles());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Falha ao iniciar modo de aprendizado.'),
                                backgroundColor: FlutterFlowTheme.of(context).error,
                              ));
                            }
                          },
                          text: 'Proximidade',
                          options: FFButtonOptions(
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(fontFamily: 'Readex Pro', color: Colors.white),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        // BOTÃO MODIFICADO PARA CHAMAR O POPUP
                        FFButtonWidget(
                          onPressed: _showAddManualDialog,
                          text: 'Digitar Serial',
                          options: FFButtonOptions(
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(fontFamily: 'Readex Pro', color: Colors.white),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 2.0, height: 24.0),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Builder(
                    builder: (context) {
                      final controles = _model.listaDeControles;
                      if (controles.isEmpty) {
                        return Center(child: Text('Nenhum controle cadastrado para este ESP.'));
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controles.length,
                        itemBuilder: (context, index) {
                          final ctrlItem = controles[index];
                          final idcontrole = getJsonField(ctrlItem, r'''$.controleId''').toString();

                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Serial: ${getJsonField(ctrlItem, r'''$.serial''')}', style: FlutterFlowTheme.of(context).bodyLarge),
                                      SizedBox(height: 4),
                                      Text('Bateria: ${getJsonField(ctrlItem, r'''$.bateria''')}', style: FlutterFlowTheme.of(context).bodyMedium),
                                      Text('ID: ${getJsonField(ctrlItem, r'''$.id''')}', style: FlutterFlowTheme.of(context).bodyMedium),
                                      Text('Clonagem: ${getJsonField(ctrlItem, r'''$.clonagem''')}', style: FlutterFlowTheme.of(context).bodyMedium),
                                    ],
                                  ),
                                  FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: FaIcon(
                                      FontAwesomeIcons.trashAlt,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      var deleteResult = await ControlesGroup.deletarControleCall.call(
                                        idesp: widget.idesp,
                                        idcontrole: idcontrole,
                                        token: currentJwtToken, // LÓGICA DO TOKEN REVERTIDA
                                      );

                                      if (deleteResult.succeeded) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text('Controle removido com sucesso!'),
                                          backgroundColor: FlutterFlowTheme.of(context).success,
                                        ));
                                        setState(() {
                                          _model.listaDeControles.removeAt(index);
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text('Falha ao remover o controle.'),
                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                        ));
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}