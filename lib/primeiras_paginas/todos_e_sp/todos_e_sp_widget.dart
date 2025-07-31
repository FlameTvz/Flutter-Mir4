import 'package:mir4/primeiras_paginas/addesp/addesp_widget.dart';
import 'package:mir4/primeiras_paginas/home_page/home_page_widget.dart';
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todos_e_sp_model.dart';
export 'todos_e_sp_model.dart';

/// quero que vc mmonte essa estrutura - Column
///   - AppBar (Meus ESPs)
///   - ListView (Data Source: listaDeESPs) ✅
///     - Container (Cada ESP é um container separado) ✅
///       - Column
///         - Row
///           - Column
///             - Text (Nome do ESP) ✅
///             - Text (ID do ESP) ✅
///           - Button (Controlar) ✅
class TodosESpWidget extends StatefulWidget {
  const TodosESpWidget({super.key});

  static String routeName = 'TodosESp';
  static String routePath = '/todosESp';

  @override
  State<TodosESpWidget> createState() => _TodosESpWidgetState();
}

class _TodosESpWidgetState extends State<TodosESpWidget> {
  late TodosESpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodosESpModel());
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
              context.pushNamed(AddespWidget.routeName);
            },
          ),
          title: Text(
            'Meus ESPs',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final esps = FFAppState().listaDeESPS.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: esps.length,
                        itemBuilder: (context, espsIndex) {
                          final espsItem = esps[espsIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                espsItem,
                                                r'''$.nome''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                espsItem,
                                                r'''$.id''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().idsESP = getJsonField(
                                              espsItem,
                                              r'''$.id''',
                                            ).toString();
                                            safeSetState(() {});

                                            context.pushNamed(
                                                HomePageWidget.routeName);

                                            _model.apiResultupn =
                                                await VincularESPCall.call(
                                              idesp: getJsonField(
                                                espsItem,
                                                r'''$.id''',
                                              ).toString(),
                                              userId: currentUserUid,
                                            );

                                            await LestUserCall.call(
                                              idEsp: getJsonField(
                                                espsItem,
                                                r'''$.id''',
                                              ).toString(),
                                              userId: currentUserUid,
                                            );

                                            safeSetState(() {});
                                          },
                                          text: 'Controlar',
                                          options: FFButtonOptions(
                                            width: 120.0,
                                            height: 40.0,
                                            padding: EdgeInsets.all(8.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
