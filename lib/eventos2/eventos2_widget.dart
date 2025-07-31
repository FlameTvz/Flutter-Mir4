import 'package:mir4/eventos2/export_eventos_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/nav/nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'eventos2_model.dart';
export 'eventos2_model.dart';

// 🔽 Importar os widgets necessários
import 'eventos_list_widget.dart';
import 'export_dialog_widget.dart';

class Eventos2Widget extends StatefulWidget {
  const Eventos2Widget({Key? key}) : super(key: key);

  static const String routeName = '/eventos2';
  static const String routePath = '/eventos2';

  @override
  _Eventos2WidgetState createState() => _Eventos2WidgetState();
}

class _Eventos2WidgetState extends State<Eventos2Widget> {
  late Eventos2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  
  // ============================================================================
  // 🔧 PEGAR ID DO ESP ATUAL DA VARIÁVEL DO APP
  // ============================================================================
  String? get espIdAtual {
    try {
      // Tenta pegar da variável global do app
      final appState = Provider.of<FFAppState>(context, listen: false);
      final idESP = appState.idsESP; // Sua variável existente
      
      print('🔧 ESP ID obtido da variável idESP: $idESP');
      return idESP.isNotEmpty ? idESP : null;
    } catch (e) {
      print('❌ Erro ao obter ESP ID: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Eventos2Model());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // ============================================================================
    // 🔧 DEBUG: MOSTRAR ESP ID OBTIDO DA VARIÁVEL
    // ============================================================================
    print('🔧 Eventos2Widget - didChangeDependencies');
    print('📱 ESP ID da variável idESP: ${espIdAtual}');
    print('🎯 Filtro ativo: ${espIdAtual != null ? 'SIM' : 'NÃO'}');
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  // ============================================================================
  // 🔧 FUNÇÃO PARA MOSTRAR DIÁLOGO DE EXPORTAÇÃO COM ESP ATUAL
  // ============================================================================
  
  void mostrarDialogoExportacao(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExportDialogWidget(espId: espIdAtual); // Usar ESP atual
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.safePop();
            },
          ),
          title: Text(
            // ============================================================================
            // 🔧 MOSTRAR ESP ID ATUAL NO TÍTULO
            // ============================================================================
            espIdAtual != null ? 'Eventos - $espIdAtual' : 'Eventos',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            // Botão de estatísticas
            IconButton(
              icon: const Icon(Icons.analytics, color: Colors.white),
              onPressed: () {
                _mostrarEstatisticas(context);
              },
            ),
            // Botão de atualizar
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                setState(() {
                  // Força rebuild do StreamBuilder
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Lista de eventos atualizada'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              
              // ============================================================================
              // 🔧 INFO BOX MOSTRANDO ESP ATUAL
              // ============================================================================
              if (espIdAtual != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.memory, color: Colors.blue, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Visualizando eventos do ESP: $espIdAtual',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              
              // Barra de ações
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () {
                          mostrarDialogoExportacao(context);
                        },
                        text: espIdAtual != null 
                            ? 'Exportar ESP $espIdAtual' 
                            : 'Exportar Eventos',
                        icon: const Icon(Icons.file_download, size: 16),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FFButtonWidget(
                      onPressed: () {
                        _mostrarDialogoLimpeza(context);
                      },
                      text: 'Limpar',
                      icon: const Icon(Icons.clear_all, size: 16),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        color: Colors.orange,
                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                // ============================================================================
                // 🔧 PASSAR ESP ID ATUAL PARA O WIDGET DE LISTA
                // ============================================================================
                child: EventosListWidget(espId: espIdAtual),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarEstatisticas(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EstatisticasDialog(espId: espIdAtual); // Usar ESP atual
      },
    );
  }

  void _mostrarDialogoLimpeza(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Icon(Icons.warning, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                'Limpar Eventos',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            ],
          ),
          content: Text(
            espIdAtual != null 
                ? 'Escolha uma opção para limpar os eventos do ESP $espIdAtual:'
                : 'Escolha uma opção para limpar os eventos:',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _limparEventosAntigos();
              },
              child: const Text('Limpar eventos antigos (> 30 dias)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _confirmarLimpezaTotal();
              },
              child: Text(
                espIdAtual != null 
                    ? 'Limpar todos do ESP' 
                    : 'Limpar todos', 
                style: TextStyle(color: Colors.red)
              ),
            ),
          ],
        );
      },
    );
  }

  void _limparEventosAntigos() async {
    try {
      final DateTime dataLimite = DateTime.now().subtract(const Duration(days: 30));
      
      final DatabaseReference eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
      final DatabaseEvent event = await eventosRef.once();
      
      if (event.snapshot.exists) {
        final Map<dynamic, dynamic> eventos = event.snapshot.value as Map<dynamic, dynamic>;
        final Map<String, dynamic> eventosParaRemover = {};
        
        eventos.forEach((key, value) {
          if (value is Map) {
            try {
              final timestamp = SafeParser.parseInt(value['timestamp']);
              final dispositivo = SafeParser.parseString(value['dispositivoId']);
              final DateTime dataEvento = DateTime.fromMillisecondsSinceEpoch(timestamp);
              
              // ============================================================================
              // 🔧 FILTRAR POR ESP ATUAL SE ESPECIFICADO
              // ============================================================================
              bool deveRemover = dataEvento.isBefore(dataLimite);
              if (espIdAtual != null) {
                deveRemover = deveRemover && dispositivo == espIdAtual;
              }
              
              if (deveRemover) {
                eventosParaRemover[key] = null;
              }
            } catch (e) {
              print('Erro ao processar timestamp do evento $key: $e');
            }
          }
        });
        
        if (eventosParaRemover.isNotEmpty) {
          await eventosRef.update(eventosParaRemover);
        }
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              espIdAtual != null 
                  ? 'Eventos antigos do ESP $espIdAtual removidos!'
                  : 'Eventos antigos removidos com sucesso!'
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao limpar eventos: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _confirmarLimpezaTotal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Limpeza Total'),
          content: Text(
            espIdAtual != null 
                ? 'ATENÇÃO: Esta ação irá remover TODOS os eventos do ESP $espIdAtual permanentemente. Esta operação não pode ser desfeita!'
                : 'ATENÇÃO: Esta ação irá remover TODOS os eventos permanentemente. Esta operação não pode ser desfeita!',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _limparTodosEventos();
              },
              child: const Text('Confirmar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _limparTodosEventos() async {
    try {
      final DatabaseReference eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
      
      if (espIdAtual != null) {
        // ============================================================================
        // 🔧 LIMPAR APENAS EVENTOS DO ESP ATUAL
        // ============================================================================
        final DatabaseEvent event = await eventosRef.once();
        
        if (event.snapshot.exists) {
          final Map<dynamic, dynamic> eventos = event.snapshot.value as Map<dynamic, dynamic>;
          final Map<String, dynamic> eventosParaRemover = {};
          
          eventos.forEach((key, value) {
            if (value is Map) {
              final dispositivo = SafeParser.parseString(value['dispositivoId']);
              if (dispositivo == espIdAtual) {
                eventosParaRemover[key] = null;
              }
            }
          });
          
          if (eventosParaRemover.isNotEmpty) {
            await eventosRef.update(eventosParaRemover);
          }
        }
      } else {
        // Limpar todos os eventos
        await eventosRef.remove();
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              espIdAtual != null 
                  ? 'Todos os eventos do ESP $espIdAtual foram removidos!'
                  : 'Todos os eventos foram removidos!'
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao limpar eventos: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

// ============================================================================
// CLASSE PARA PARSING SEGURO
// ============================================================================

class SafeParser {
  static int parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        try {
          return double.parse(value).toInt();
        } catch (e) {
          return 0;
        }
      }
    }
    return 0;
  }

  static String parseString(dynamic value) {
    if (value == null) return '';
    return value.toString();
  }
}

// ============================================================================
// 🔥 WIDGET PARA ESTATÍSTICAS ESPECÍFICAS DO ESP
// ============================================================================
class EstatisticasDialog extends StatelessWidget {
  final String? espId;
  
  const EstatisticasDialog({Key? key, this.espId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.analytics, color: FlutterFlowTheme.of(context).primary),
          const SizedBox(width: 8),
          Text(
            espId != null 
                ? 'Estatísticas - ESP $espId'
                : 'Estatísticas dos Eventos',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ],
      ),
      content: FutureBuilder<Map<String, dynamic>>(
        future: ExportEventosService.getEstatisticasEventosEsp(espId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'Erro ao carregar estatísticas: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final stats = snapshot.data!;
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatCard('Total de Eventos', stats['totalEventos'].toString()),
                  if (espId == null) 
                    _buildStatCard('Dispositivos Únicos', (stats['eventosPorDispositivo'] as Map).length.toString()),
                  _buildStatCard('Estados Únicos', (stats['eventosPorEstado'] as Map).length.toString()),
                  const SizedBox(height: 16),
                  
                  Text(
                    'Eventos por Estado:',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...((stats['eventosPorEstado'] as Map<String, dynamic>).entries.map(
                    (entry) => _buildStatItem(entry.key, entry.value.toString()),
                  )),
                  const SizedBox(height: 16),
                  
                  Text(
                    'Eventos por Origem:',
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...((stats['eventosPorOrigem'] as Map<String, dynamic>).entries.map(
                    (entry) => _buildStatItem(entry.key, entry.value.toString()),
                  )),
                ],
              ),
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// ============================================================================
// 🔥 WIDGET PARA ADICIONAR EVENTO COM ESP ESPECÍFICO
// ============================================================================
class AdicionarEventoDialog extends StatefulWidget {
  final String? espId;
  
  const AdicionarEventoDialog({Key? key, this.espId}) : super(key: key);

  @override
  State<AdicionarEventoDialog> createState() => _AdicionarEventoDialogState();
}

class _AdicionarEventoDialogState extends State<AdicionarEventoDialog> {
  final _formKey = GlobalKey<FormState>();
  final _dispositivoController = TextEditingController();
  final _numeroReleController = TextEditingController();
  final _pinoEntradaController = TextEditingController();
  String _estadoSelecionado = 'LIGADO';
  String _origemSelecionada = 'MANUAL';

  @override
  void initState() {
    super.initState();
    // ============================================================================
    // 🔧 PRÉ-PREENCHER COM ESP ID SE DISPONÍVEL
    // ============================================================================
    if (widget.espId != null) {
      _dispositivoController.text = widget.espId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.espId != null 
            ? 'Adicionar Evento - ESP ${widget.espId}'
            : 'Adicionar Evento',
        style: FlutterFlowTheme.of(context).headlineSmall,
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _dispositivoController,
                decoration: const InputDecoration(
                  labelText: 'ID do Dispositivo',
                  border: OutlineInputBorder(),
                ),
                // ============================================================================
                // 🔧 DESABILITAR CAMPO SE ESP ID ESTIVER DEFINIDO
                // ============================================================================
                enabled: widget.espId == null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: _estadoSelecionado,
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
                items: ['LIGADO', 'DESLIGADO', 'ALERTA'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _estadoSelecionado = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _numeroReleController,
                decoration: const InputDecoration(
                  labelText: 'Número Relé',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: _origemSelecionada,
                decoration: const InputDecoration(
                  labelText: 'Origem',
                  border: OutlineInputBorder(),
                ),
                items: ['MANUAL', 'FIREBASE', 'SENSOR'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _origemSelecionada = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _pinoEntradaController,
                decoration: const InputDecoration(
                  labelText: 'Pino Entrada',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Digite um número válido';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FFButtonWidget(
          onPressed: _adicionarEvento,
          text: 'Adicionar',
          options: FFButtonOptions(
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
            ),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Future<void> _adicionarEvento() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Você precisa estar logado para adicionar eventos'),
              backgroundColor: Colors.orange,
            ),
          );
          return;
        }
        
        final DatabaseReference eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
        final String novoEventoId = eventosRef.push().key!;
        
        final evento = {
          'dispositivoId': _dispositivoController.text,
          'estado': _estadoSelecionado,
          'numeroRele': int.parse(_numeroReleController.text),
          'origem': _origemSelecionada,
          'pinoEntrada': int.parse(_pinoEntradaController.text),
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        };

        await eventosRef.child(novoEventoId).set(evento);

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.espId != null 
                    ? 'Evento adicionado para ESP ${widget.espId}!'
                    : 'Evento adicionado com sucesso!'
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro ao adicionar evento: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _dispositivoController.dispose();
    _numeroReleController.dispose();
    _pinoEntradaController.dispose();
    super.dispose();
  }
}