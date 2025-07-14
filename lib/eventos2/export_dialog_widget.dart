import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'export_eventos_service.dart';

class ExportDialogWidget extends StatefulWidget {
  const ExportDialogWidget({Key? key}) : super(key: key);

  @override
  State<ExportDialogWidget> createState() => _ExportDialogWidgetState();
}

class _ExportDialogWidgetState extends State<ExportDialogWidget> {
  String _formatoSelecionado = 'json';
  String _tipoExportacao = 'todos';
  DateTime? _dataInicio;
  DateTime? _dataFim;
  String _dispositivoId = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.file_download,
            color: FlutterFlowTheme.of(context).primary,
          ),
          const SizedBox(width: 8),
          Text(
            'Exportar Eventos',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Seleção do formato
              Text(
                'Formato do arquivo:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('JSON'),
                      subtitle: const Text('Arquivo JavaScript Object Notation'),
                      value: 'json',
                      groupValue: _formatoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _formatoSelecionado = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('CSV'),
                      subtitle: const Text('Arquivo de valores separados por vírgula'),
                      value: 'csv',
                      groupValue: _formatoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _formatoSelecionado = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Tipo de exportação
              Text(
                'Tipo de exportação:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Todos os eventos'),
                    value: 'todos',
                    groupValue: _tipoExportacao,
                    onChanged: (value) {
                      setState(() {
                        _tipoExportacao = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Por período'),
                    value: 'periodo',
                    groupValue: _tipoExportacao,
                    onChanged: (value) {
                      setState(() {
                        _tipoExportacao = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Por dispositivo'),
                    value: 'dispositivo',
                    groupValue: _tipoExportacao,
                    onChanged: (value) {
                      setState(() {
                        _tipoExportacao = value!;
                      });
                    },
                  ),
                ],
              ),
              
              // Campos condicionais
              if (_tipoExportacao == 'periodo') ...[
                const SizedBox(height: 16),
                Text(
                  'Selecione o período:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _dataInicio ?? DateTime.now().subtract(const Duration(days: 30)),
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              _dataInicio = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: FlutterFlowTheme.of(context).alternate),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _dataInicio != null 
                                ? DateFormat('dd/MM/yyyy').format(_dataInicio!)
                                : 'Data início',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: _dataFim ?? DateTime.now(),
                            firstDate: _dataInicio ?? DateTime(2020),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() {
                              _dataFim = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: FlutterFlowTheme.of(context).alternate),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _dataFim != null 
                                ? DateFormat('dd/MM/yyyy').format(_dataFim!)
                                : 'Data fim',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              
              if (_tipoExportacao == 'dispositivo') ...[
                const SizedBox(height: 16),
                Text(
                  'ID do dispositivo:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _dispositivoId = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Digite o ID do dispositivo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(
            'Cancelar',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
        ),
        FFButtonWidget(
          onPressed: _isLoading ? null : _exportarEventos,
          text: _isLoading ? 'Exportando...' : 'Exportar',
          icon: _isLoading 
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.download, size: 16),
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

  Future<void> _exportarEventos() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      switch (_tipoExportacao) {
        case 'todos':
          if (_formatoSelecionado == 'json') {
            await ExportEventosService.exportarEventosParaJSON();
          } else {
            await ExportEventosService.exportarEventosParaCSV();
          }
          break;
          
        case 'periodo':
          if (_dataInicio == null || _dataFim == null) {
            _mostrarErro('Selecione as datas de início e fim');
            return;
          }
          if (_dataInicio!.isAfter(_dataFim!)) {
            _mostrarErro('A data de início deve ser anterior à data de fim');
            return;
          }
          await ExportEventosService.exportarEventosPorPeriodo(
            dataInicio: _dataInicio!,
            dataFim: _dataFim!,
            formato: _formatoSelecionado,
          );
          break;
          
        case 'dispositivo':
          if (_dispositivoId.isEmpty) {
            _mostrarErro('Digite o ID do dispositivo');
            return;
          }
          await ExportEventosService.exportarEventosPorDispositivo(
            dispositivoId: _dispositivoId,
            formato: _formatoSelecionado,
          );
          break;
      }

      Navigator.of(context).pop();
      _mostrarSucesso('Eventos exportados com sucesso!');
    } catch (e) {
      _mostrarErro('Erro ao exportar eventos: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _mostrarSucesso(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

// Função para mostrar o diálogo de exportação
void mostrarDialogoExportacao(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ExportDialogWidget();
    },
  );
}