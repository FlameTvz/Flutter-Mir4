import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/popups/voltar/voltar_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'config_entrada_model.dart';
import 'edit_nome_entrada_widget.dart';
export 'config_entrada_model.dart';

class ConfigEntradaWidget extends StatefulWidget {
  const ConfigEntradaWidget({
    super.key,
    required this.listaentrada,
  });

  final dynamic listaentrada;

  static String routeName = 'ConfigEntrada';
  static String routePath = '/configEntrada';

  @override
  State<ConfigEntradaWidget> createState() => _ConfigEntradaWidgetState();
}

class _ConfigEntradaWidgetState extends State<ConfigEntradaWidget> {
  late ConfigEntradaModel _model;
  Set<String> modosSelecionados = {};
  Set<String> saidasSelecionadas = {};

  // Variaveis de estado para o modo de operação de cada entrada
  int? modoEntrada1;
  int? modoEntrada2;
  int? modoEntrada3;
  int? modoEntrada4;
  int? modoEntrada5;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfigEntradaModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pegar = await PegarEntradasCall.call(
        idesp: FFAppState().idsESP,
        token: currentJwtToken,
      );

      FFAppState().listaEntradaAPI =
          (_model.pegar?.jsonBody ?? '').toList().cast<String>();
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                ConfigEspWidget.routeName,
                queryParameters: {
                  'lista': serializeParam(
                    widget.listaentrada,
                    ParamType.JSON,
                  ),
                }.withoutNulls,
              );
            },
            child: wrapWithModel(
              model: _model.voltarModel,
              updateCallback: () => safeSetState(() {}),
              child: VoltarWidget(),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Configurações de Entrada',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleMediumFamily),
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // ENTRADA 1
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x20000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // BOTÃO EDITÁVEL ENTRADA 1
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: EditarNomeEntradaWidget(
                                              numeroEntrada: 1,
                                              nomeAtual:
                                                  FFAppState().nomeEntrada1,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          FFAppState().nomeEntrada1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempo debounce:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 106.5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '500ms',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController1Validator
                                              ?.asValidator(context),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.apiResultydg =
                                              await ReleOneGroup
                                                  .tempoDebouncingCall
                                                  .call(
                                            idesp: FFAppState().idsESP,
                                            tempoDebouncing: int.tryParse(
                                                _model.textController1.text),
                                            token: currentJwtToken,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Sucesso',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );

                                          safeSetState(() {});
                                        },
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modo de operação:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: modoEntrada1 == 0
                                                ? const Color(0xFF6A1B9A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0)),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.apiResult7st =
                                                await EntradasZeroGroup
                                                    .entradazerobordaCall
                                                    .call(
                                              borda: 0,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if ((_model
                                                    .apiResult7st?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada1 = 0;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: modoEntrada1 == 0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada1 == 2
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.apiResultqzz =
                                                await EntradasZeroGroup
                                                    .entradazerobordaCall
                                                    .call(
                                              borda: 2,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if ((_model
                                                    .apiResultqzz?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada1 = 2;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: modoEntrada1 == 2
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada1 == 3
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.apiResultq5e =
                                                await EntradasZeroGroup
                                                    .entradazerobordaCall
                                                    .call(
                                              borda: 3,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if ((_model
                                                    .apiResultq5e?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada1 = 3;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.swap_vert_rounded,
                                            color: modoEntrada1 == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saídas:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 1 / SAÍDA 1 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada10 = !(FFAppState().entrada10);
                                          safeSetState(() {});
                                          if (FFAppState().entrada10 == true) {
                                            await EntradasZeroGroup
                                                .entradazeroreleumCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasZeroGroup
                                                .entradazeroreleumOffCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '1',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada10 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada10 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 1 / SAÍDA 1 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 1 / SAÍDA 2 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada11 = !(FFAppState().entrada11);
                                          safeSetState(() {});
                                          if (FFAppState().entrada11 == true) {
                                            await EntradasZeroGroup
                                                .entradazeroreledoisCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasZeroGroup
                                                .entradazeroreledoisOffCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '2',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada11 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada11 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 1 / SAÍDA 2 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 1 / SAÍDA 3 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada12 = !(FFAppState().entrada12);
                                          safeSetState(() {});
                                          if (FFAppState().entrada12 == true) {
                                            await EntradasZeroGroup
                                                .entradazeroreletresCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasZeroGroup
                                                .entradazeroreletresOffCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '3',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada12 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada12 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 1 / SAÍDA 3 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 1 / SAÍDA 4 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada13 = !(FFAppState().entrada13);
                                          safeSetState(() {});
                                          if (FFAppState().entrada13 == true) {
                                            await EntradasZeroGroup
                                                .entradazerorelequatroCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasZeroGroup
                                                .entradazerorelequatroOffCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '4',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada13 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada13 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 1 / SAÍDA 4 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 1 / SAÍDA 5 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada14 = !(FFAppState().entrada14);
                                          safeSetState(() {});
                                          if (FFAppState().entrada14 == true) {
                                            await EntradasZeroGroup
                                                .entradazerorelecincoCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasZeroGroup
                                                .entradazerorelecincoOffCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '5',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada14 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada14 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 1 / SAÍDA 5 ---
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),

                    // ENTRADA 2
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x20000000),
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // BOTÃO EDITÁVEL ENTRADA 2
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: EditarNomeEntradaWidget(
                                              numeroEntrada: 2,
                                              nomeAtual:
                                                  FFAppState().nomeEntrada2,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          FFAppState().nomeEntrada2,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempo debounce:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 106.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '500ms',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController2Validator
                                              ?.asValidator(context),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await ReleTwoGroup
                                              .tempoDebouncingCopyCall
                                              .call(
                                            idesp: FFAppState().idsESP,
                                            tempoDebouncing: int.tryParse(
                                                _model.textController2.text),
                                            token: currentJwtToken,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Sucesso'),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modo de operação:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: modoEntrada2 == 0
                                                ? const Color(0xFF6A1B9A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0)),
                                        child: InkWell(
                                          onTap: () async {
                                            _model.apiResultzck =
                                                await EntradasUmGroup
                                                    .entradazerobordaCopyCall
                                                    .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                              borda: 0,
                                            );
                                            if ((_model
                                                    .apiResultzck?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada2 = 0;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: modoEntrada2 == 0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada2 == 2
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            _model.apiResulttt9 =
                                                await EntradasUmGroup
                                                    .entradazerobordaCopyCall
                                                    .call(
                                              borda: 2,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                            if ((_model
                                                    .apiResulttt9?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada2 = 2;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: modoEntrada2 == 2
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada2 == 3
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            _model.apiResultaw5 =
                                                await EntradasUmGroup
                                                    .entradazerobordaCopyCall
                                                    .call(
                                              borda: 3,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                            if ((_model
                                                    .apiResultaw5?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada2 = 3;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.swap_vert_rounded,
                                            color: modoEntrada2 == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saídas:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 2 / SAÍDA 1 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada20 = !(FFAppState().entrada20);
                                          safeSetState(() {});
                                          if (FFAppState().entrada20 == true) {
                                            await EntradasUmGroup
                                                .entradazeroreleumCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasUmGroup
                                                .entradazeroreleumOffCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '1',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada20 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada20 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 2 / SAÍDA 1 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 2 / SAÍDA 2 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada21 = !(FFAppState().entrada21);
                                          safeSetState(() {});
                                          if (FFAppState().entrada21 == true) {
                                            await EntradasUmGroup
                                                .entradazeroreledoisCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasUmGroup
                                                .entradazeroreledoisOffCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '2',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada21 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada21 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 2 / SAÍDA 2 ---
                                      
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 2 / SAÍDA 3 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada22 = !(FFAppState().entrada22);
                                          safeSetState(() {});
                                          if (FFAppState().entrada22 == true) {
                                            await EntradasUmGroup
                                                .entradazeroreletresCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasUmGroup
                                                .entradazeroreletresOffCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '3',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada22 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada22 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 2 / SAÍDA 3 ---
                                      
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 2 / SAÍDA 4 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada23 = !(FFAppState().entrada23);
                                          safeSetState(() {});
                                          if (FFAppState().entrada23 == true) {
                                            await EntradasUmGroup
                                                .entradazerorelequatroCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasUmGroup
                                                .entradazerorelequatroOffCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '4',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada23 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada23 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 2 / SAÍDA 4 ---
                                      
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 2 / SAÍDA 5 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada24 = !(FFAppState().entrada24);
                                          safeSetState(() {});
                                          if (FFAppState().entrada24 == true) {
                                            await EntradasUmGroup
                                                .entradazerorelecincoCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasUmGroup
                                                .entradazerorelecincoOffCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '5',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada24 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada24 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 2 / SAÍDA 5 ---
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),

                    // ENTRADA 3
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x20000000),
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // BOTÃO EDITÁVEL ENTRADA 3
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: EditarNomeEntradaWidget(
                                              numeroEntrada: 3,
                                              nomeAtual:
                                                  FFAppState().nomeEntrada3,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          FFAppState().nomeEntrada3,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempo debounce:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 106.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '500ms',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController3Validator
                                              ?.asValidator(context),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await ReleThreeGroup
                                              .tempoDebouncingCopyCopyCall
                                              .call(
                                            idesp: FFAppState().idsESP,
                                            tempoDebouncing: int.tryParse(
                                                _model.textController3.text),
                                            token: currentJwtToken,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Sucesso'),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modo de operação:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: modoEntrada3 == 0
                                                ? const Color(0xFF6A1B9A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0)),
                                        child: InkWell(
                                          onTap: () async {
                                            _model.apiResultijq =
                                                await EntradasDoisGroup
                                                    .entradazerobordaCopyCopyCall
                                                    .call(
                                              borda: 0,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                            if ((_model
                                                    .apiResultijq?.succeeded ??
                                                true)) {
                                              setState(() {
                                                modoEntrada3 = 0;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: modoEntrada3 == 0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada3 == 2
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await EntradasDoisGroup
                                                .entradazerobordaCopyCopyCall
                                                .call(
                                              borda: 2,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada3 = 2;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: modoEntrada3 == 2
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada3 == 3
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            await EntradasDoisGroup
                                                .entradazerobordaCopyCopyCall
                                                .call(
                                              borda: 3,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada3 = 3;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.swap_vert_rounded,
                                            color: modoEntrada3 == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saídas:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 3 / SAÍDA 1 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada30 = !(FFAppState().entrada30);
                                          safeSetState(() {});
                                          if (FFAppState().entrada30 == true) {
                                            await EntradasDoisGroup
                                                .entradazeroreleumCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasDoisGroup
                                                .entradazeroreleumOffCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '1',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada30 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada30 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 3 / SAÍDA 1 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 3 / SAÍDA 2 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada31 = !(FFAppState().entrada31);
                                          safeSetState(() {});
                                          if (FFAppState().entrada31 == true) {
                                            await EntradasDoisGroup
                                                .entradazeroreledoisCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasDoisGroup
                                                .entradazeroreledoisOffCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '2',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada31 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada31 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 3 / SAÍDA 2 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 3 / SAÍDA 3 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada32 = !(FFAppState().entrada32);
                                          safeSetState(() {});
                                          if (FFAppState().entrada32 == true) {
                                            await EntradasDoisGroup
                                                .entradazeroreletresCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasDoisGroup
                                                .entradazeroreletresOffCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '3',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada32 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada32 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 3 / SAÍDA 3 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 3 / SAÍDA 4 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada33 = !(FFAppState().entrada33);
                                          safeSetState(() {});
                                          if (FFAppState().entrada33 == true) {
                                            await EntradasDoisGroup
                                                .entradazerorelequatroCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasDoisGroup
                                                .entradazerorelequatroOffCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '4',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada33 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada33 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 3 / SAÍDA 4 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 3 / SAÍDA 5 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada34 = !(FFAppState().entrada34);
                                          safeSetState(() {});
                                          if (FFAppState().entrada34 == true) {
                                            await EntradasDoisGroup
                                                .entradazerorelecincoCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          } else {
                                            await EntradasDoisGroup
                                                .entradazerorelecincoOffCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                      widget.listaentrada,
                                                      r'''$.id''')
                                                  .toString(),
                                            );
                                          }
                                        },
                                        text: '5',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada34 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada34 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 3 / SAÍDA 5 ---
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    // ENTRADA 4
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x20000000),
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // BOTÃO EDITÁVEL ENTRADA 4
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: EditarNomeEntradaWidget(
                                              numeroEntrada: 4,
                                              nomeAtual:
                                                  FFAppState().nomeEntrada4,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          FFAppState().nomeEntrada4,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempo debounce:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 106.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController4,
                                          focusNode: _model.textFieldFocusNode4,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '500ms',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController4Validator
                                              ?.asValidator(context),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await ReleFourGroup
                                              .tempoDebouncingCopyCopyCopyCall
                                              .call(
                                            idesp: FFAppState().idsESP,
                                            tempoDebouncing: int.tryParse(
                                                _model.textController4.text),
                                            token: currentJwtToken,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Sucesso',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modo de operação:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: modoEntrada4 == 0
                                                ? const Color(0xFF6A1B9A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0)),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasTresGroup
                                                .entradazerobordaCopyCopyCopyCall
                                                .call(
                                              borda: 0,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada4 = 0;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: modoEntrada4 == 0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada4 == 2
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasTresGroup
                                                .entradazerobordaCopyCopyCopyCall
                                                .call(
                                              borda: 2,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada4 = 2;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: modoEntrada4 == 2
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada4 == 3
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasTresGroup
                                                .entradazerobordaCopyCopyCopyCall
                                                .call(
                                              borda: 3,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada4 = 3;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.swap_vert_rounded,
                                            color: modoEntrada4 == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saídas:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 4 / SAÍDA 1 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada40 = !(FFAppState().entrada40);
                                          safeSetState(() {});
                                          if (FFAppState().entrada40 == true) {
                                            await EntradasTresGroup
                                                .entradazeroreleumCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasTresGroup
                                                .entradazeroreleumOffCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '1',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada40 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada40 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 4 / SAÍDA 1 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 4 / SAÍDA 2 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var bool = FFAppState().entrada41 = !(FFAppState().entrada41);
                                          safeSetState(() {});
                                          if (FFAppState().entrada41 == true) {
                                            await EntradasTresGroup
                                                .entradazeroreledoisCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasTresGroup
                                                .entradazeroreledoisOffCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '2',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada41 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada41 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 4 / SAÍDA 2 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 4 / SAÍDA 3 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada42 = !(FFAppState().entrada42);
                                          safeSetState(() {});
                                          if (FFAppState().entrada42 == true) {
                                            await EntradasTresGroup
                                                .entradazeroreletresCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasTresGroup
                                                .entradazeroreletresOffCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '3',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada42 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada42 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 4 / SAÍDA 3 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 4 / SAÍDA 4 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada43 = !(FFAppState().entrada43);
                                          safeSetState(() {});
                                          if (FFAppState().entrada43 == true) {
                                            await EntradasTresGroup
                                                .entradazerorelequatroCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasTresGroup
                                                .entradazerorelequatroOffCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '4',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada43 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada43 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 4 / SAÍDA 4 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 4 / SAÍDA 5 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var bool = FFAppState().entrada44 = !(FFAppState().entrada44);
                                          safeSetState(() {});
                                          if (FFAppState().entrada44 == true) {
                                            await EntradasTresGroup
                                                .entradazerorelecincoCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasTresGroup
                                                .entradazerorelecincoOffCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '5',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada44 == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada44 ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 4 / SAÍDA 5 ---
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    // ENTRADA 5
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x20000000),
                              offset: Offset(0.0, 2.0),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // BOTÃO EDITÁVEL ENTRADA 5
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: EditarNomeEntradaWidget(
                                              numeroEntrada: 5,
                                              nomeAtual:
                                                  FFAppState().nomeEntrada5,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          FFAppState().nomeEntrada5,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tempo debounce:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 106.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: _model.textController5,
                                          focusNode: _model.textFieldFocusNode5,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '500ms',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 8.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController5Validator
                                              ?.asValidator(context),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await ReleFiveGroup
                                              .tempoDebouncingCopyCopyCopyCopyCall
                                              .call(
                                            idesp: FFAppState().idsESP,
                                            tempoDebouncing: int.tryParse(
                                                _model.textController5.text),
                                            token: currentJwtToken,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Sucesso',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modo de operação:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: modoEntrada5 == 0
                                                ? const Color(0xFF6A1B9A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0)),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasQuatroGroup
                                                .entradazerobordaCopyCopyCopyCopyCall
                                                .call(
                                              borda: 0,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada5 = 0;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: modoEntrada5 == 0
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada5 == 2
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasQuatroGroup
                                                .entradazerobordaCopyCopyCopyCopyCall
                                                .call(
                                              borda: 2,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada5 = 2;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_downward_rounded,
                                            color: modoEntrada5 == 2
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: modoEntrada5 == 3
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await EntradasQuatroGroup
                                                .entradazerobordaCopyCopyCopyCopyCall
                                                .call(
                                              borda: 3,
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                            if (true) {
                                              setState(() {
                                                modoEntrada5 = 3;
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.swap_vert_rounded,
                                            color: modoEntrada5 == 3
                                                ? Colors.white
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Saídas:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 5 / SAÍDA 1 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada0On = !(FFAppState().entrada0On);
                                          safeSetState(() {});
                                          if (FFAppState().entrada0On == true) {
                                            await EntradasQuatroGroup
                                                .entradazeroreleumCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasQuatroGroup
                                                .entradazeroreleumOffCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '1',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada0On == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada0On ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 5 / SAÍDA 1 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 5 / SAÍDA 2 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada1on = !(FFAppState().entrada1on);
                                          safeSetState(() {});
                                          if (FFAppState().entrada1on == true) {
                                            await EntradasQuatroGroup
                                                .entradazeroreledoisCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasQuatroGroup
                                                .entradazeroreledoisOffCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '2',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada1on == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada1on ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 5 / SAÍDA 2 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 5 / SAÍDA 3 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada2on = !(FFAppState().entrada2on);
                                          safeSetState(() {});
                                          if (FFAppState().entrada2on == true) {
                                            await EntradasQuatroGroup
                                                .entradazeroreletresCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasQuatroGroup
                                                .entradazeroreletresOffCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '3',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada2on == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada2on ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 5 / SAÍDA 3 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 5 / SAÍDA 4 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada3on = !(FFAppState().entrada3on);
                                          safeSetState(() {});
                                          if (FFAppState().entrada3on == true) {
                                            await EntradasQuatroGroup
                                                .entradazerorelequatroCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasQuatroGroup
                                                .entradazerorelequatroOffCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '4',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada3on == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada3on ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 5 / SAÍDA 4 ---

                                      // --- INÍCIO DA CORREÇÃO: ENTRADA 5 / SAÍDA 5 ---
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().entrada4on = !(FFAppState().entrada4on);
                                          safeSetState(() {});
                                          if (FFAppState().entrada4on == true) {
                                            await EntradasQuatroGroup
                                                .entradazerorelecincoCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          } else {
                                            await EntradasQuatroGroup
                                                .entradazerorelecincoOffCopyCopyCopyCopyCall
                                                .call(
                                              token: currentJwtToken,
                                              idesp: getJsonField(
                                                widget.listaentrada,
                                                r'''$.id''',
                                              ).toString(),
                                            );
                                          }
                                        },
                                        text: '5',
                                        options: FFButtonOptions(
                                          width: 40.0,
                                          height: 40.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().entrada4on == true
                                              ? const Color(0xFF6A1B9A)
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: FFAppState().entrada4on ==
                                                        true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      // --- FIM DA CORREÇÃO: ENTRADA 5 / SAÍDA 5 ---
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}