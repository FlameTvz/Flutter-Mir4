import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notificacoes_model.dart';
export 'notificacoes_model.dart';

class NotificacoesWidget extends StatefulWidget {
  const NotificacoesWidget({
    super.key,
    required this.listaentrada,
  });

  final dynamic listaentrada;

  static String routeName = 'Notificacoes';
  static String routePath = '/notificacoes';

  @override
  State<NotificacoesWidget> createState() => _NotificacoesWidgetState();
}

class _NotificacoesWidgetState extends State<NotificacoesWidget> {
  late NotificacoesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Função para buscar as configurações de notificação da API
  Future<void> fetchNotificacaoSettings() async {
    // Chama a API para obter as configurações atuais
    _model.apiResultNotificacoes =
        await NotificacoesGroup.pegarNotificacoesCall.call(
      idesp: FFAppState().idsESP,
      token: currentJwtToken,
    );

    // Verifica se a chamada de API foi bem-sucedida
    if (_model.apiResultNotificacoes!.succeeded) {
      if (_model.apiResultNotificacoes!.jsonBody != null) {
        // Atualiza o estado com os dados recebidos
        setState(() {
          _model.notificacaoConfig =
              Map<String, dynamic>.from(_model.apiResultNotificacoes!.jsonBody);
        });
      } else {
        // Se não houver corpo na resposta, inicializa com um mapa vazio
        setState(() {
          _model.notificacaoConfig = {};
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacoesModel());

    // Ação de carregamento da página para buscar os dados
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchNotificacaoSettings();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
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
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Notificações',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [
            // O botão em actions pode ser mantido ou removido conforme a necessidade
            SizedBox(width: 60), // Espaçamento para centralizar o título
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        // Exibe um loader enquanto os dados não forem carregados
        body: _model.notificacaoConfig == null
            ? Center(
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              )
            : SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Seção de Entradas
                      _buildSection('Entradas', 5),

                      // Seção de Saídas (Relés)
                      _buildSection('Saídas', 5),

                      // Seção Offline
                      Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate),
                      _buildNotificationRow(
                          'offline', 'Avisar quando estiver offline'),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // Widget auxiliar para construir uma seção (Entradas ou Saídas)
  Widget _buildSection(String title, int count) {
    String keyPrefix = title == 'Entradas' ? 'entrada' : 'saida';

    return Column(
      children: [
        Divider(
            thickness: 2.0, color: FlutterFlowTheme.of(context).alternate),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            title,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.interTight(fontWeight: FontWeight.w600),
                  fontSize: 24.0,
                ),
          ),
        ),
        // Gera a lista de itens para a seção
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) {
            final itemIndex = index + 1;
            final key = '$keyPrefix$itemIndex';
            final name =
                'Nome ${title.substring(0, title.length - 1)} #$itemIndex';
            return _buildNotificationRow(key, name);
          },
        ),
      ],
    );
  }

  // Widget auxiliar para construir cada linha de notificação com um switch
  Widget _buildNotificationRow(String key, String name) {
    // Define o valor atual do switch, com 'false' como padrão
    bool currentValue = _model.notificacaoConfig?[key] ?? false;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.interTight(),
                    fontSize: 16,
                  ),
            ),
          ),
          Switch.adaptive(
            value: currentValue,
            onChanged: (newValue) async {
              // Atualiza o estado localmente para uma resposta visual imediata
              setState(() {
                _model.notificacaoConfig?[key] = newValue;
              });
              // Chama a API para persistir a alteração no backend
              await NotificacoesGroup.atualizarNotificacaoCall.call(
                idesp: FFAppState().idsESP,
                token: currentJwtToken,
                notificacaoKey: key,
                status: newValue,
              );
            },
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
            inactiveThumbColor:
                FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ],
      ),
    );
  }
}