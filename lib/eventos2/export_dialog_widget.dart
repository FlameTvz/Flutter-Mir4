// ============================================================================
// ARQUIVO: lib/eventos2/export_dialog_widget.dart - VERSÃO FINAL CORRIGIDA
// ============================================================================

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'export_eventos_service.dart';

class ExportDialogWidget extends StatefulWidget {
  const ExportDialogWidget({Key? key}) : super(key: key);

  @override
  _ExportDialogWidgetState createState() => _ExportDialogWidgetState();
}

class _ExportDialogWidgetState extends State<ExportDialogWidget> {
  String _formatoSelecionado = 'json';
  String? _dispositivoSelecionado;
  List<String> _listaDispositivos = [];
  bool _carregandoDispositivos = false;
  
  @override
  void initState() {
    super.initState();
    _carregarDispositivos();
  }

  // ============================================================================
  // FUNÇÃO PARA CARREGAR DISPOSITIVOS DO FIRESTORE
  // ============================================================================
  
  Future<void> _carregarDispositivos() async {
    setState(() {
      _carregandoDispositivos = true;
    });
    
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .get();
      
      // Extrair lista única de dispositivoId
      final Set<String> dispositivosUnicos = {};
      
      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data['dispositivoId'] != null && data['dispositivoId'].toString().isNotEmpty) {
          dispositivosUnicos.add(data['dispositivoId'].toString());
        }
      }
      
      setState(() {
        _listaDispositivos = dispositivosUnicos.toList()..sort();
        _carregandoDispositivos = false;
      });
      
    } catch (e) {
      setState(() {
        _carregandoDispositivos = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar dispositivos: $e')),
        );
      }
    }
  }

  // ============================================================================
  // FUNÇÕES DE EXPORTAÇÃO CORRIGIDAS
  // ============================================================================
  
  // Exportar todos os eventos para JSON
  Future<void> _exportarTodosJSON() async {
    try {
      _mostrarLoading('Exportando todos os eventos para JSON...');
      await ExportEventosService.exportarEventosParaJSON();
      
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eventos exportados para JSON com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        _mostrarErro('Erro ao exportar JSON: $e');
      }
    }
  }

  // Exportar todos os eventos para CSV
  Future<void> _exportarTodosCSV() async {
    try {
      _mostrarLoading('Exportando todos os eventos para CSV...');
      await ExportEventosService.exportarEventosParaCSV();
      
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eventos exportados para CSV com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        _mostrarErro('Erro ao exportar CSV: $e');
      }
    }
  }

  // Exportar por período (últimos 30 dias)
  Future<void> _exportarPorPeriodo() async {
    try {
      _mostrarLoading('Exportando eventos dos últimos 30 dias...');
      
      final dataInicio = DateTime.now().subtract(Duration(days: 30));
      final dataFim = DateTime.now();
      
      await ExportEventosService.exportarEventosPorPeriodo(
        dataInicio,
        dataFim,
        formato: _formatoSelecionado,
      );
      
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eventos do período exportados com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        _mostrarErro('Erro ao exportar por período: $e');
      }
    }
  }

  // Exportar por dispositivo selecionado
  Future<void> _exportarPorDispositivo() async {
    try {
      // Verificar se um dispositivo foi selecionado
      if (_dispositivoSelecionado == null || _dispositivoSelecionado!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Por favor, selecione um dispositivo'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
      
      _mostrarLoading('Exportando eventos do dispositivo $_dispositivoSelecionado...');
      
      await ExportEventosService.exportarEventosPorDispositivo(
        _dispositivoSelecionado!,
        formato: _formatoSelecionado,
      );
      
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eventos de $_dispositivoSelecionado exportados com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
      
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Fechar loading
        _mostrarErro('Erro ao exportar por dispositivo: $e');
      }
    }
  }

  // ============================================================================
  // FUNÇÕES AUXILIARES
  // ============================================================================
  
  void _mostrarLoading(String mensagem) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                mensagem,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _mostrarErro(String erro) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(erro),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  // ============================================================================
  // INTERFACE DO USUÁRIO
  // ============================================================================
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.download, color: Theme.of(context).primaryColor),
          SizedBox(width: 8),
          Text('Exportar Eventos'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seleção de formato
            Text(
              'Formato de Exportação:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('JSON'),
                    value: 'json',
                    groupValue: _formatoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _formatoSelecionado = value!;
                      });
                    },
                    dense: true,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('CSV'),
                    value: 'csv',
                    groupValue: _formatoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _formatoSelecionado = value!;
                      });
                    },
                    dense: true,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Seleção de dispositivo
            Text(
              'Dispositivo (para exportação específica):',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            
            _carregandoDispositivos 
              ? Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12),
                      Text('Carregando dispositivos...'),
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton<String>(
                    value: _dispositivoSelecionado,
                    hint: Text('Selecione um dispositivo'),
                    isExpanded: true,
                    underline: SizedBox(),
                    items: _listaDispositivos.map((dispositivo) {
                      return DropdownMenuItem<String>(
                        value: dispositivo,
                        child: Text(dispositivo),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _dispositivoSelecionado = value;
                      });
                    },
                  ),
                ),
            
            SizedBox(height: 24),
            
            // Botões de ação
            Text(
              'Opções de Exportação:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: _exportarTodosJSON,
                  icon: Icon(Icons.code),
                  label: Text('Exportar Todos (JSON)'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                
                SizedBox(height: 8),
                
                ElevatedButton.icon(
                  onPressed: _exportarTodosCSV,
                  icon: Icon(Icons.table_chart),
                  label: Text('Exportar Todos (CSV)'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                
                SizedBox(height: 8),
                
                ElevatedButton.icon(
                  onPressed: _exportarPorPeriodo,
                  icon: Icon(Icons.date_range),
                  label: Text('Exportar Últimos 30 Dias ($_formatoSelecionado)'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                
                SizedBox(height: 8),
                
                ElevatedButton.icon(
                  onPressed: (_listaDispositivos.isEmpty || _dispositivoSelecionado == null) 
                    ? null 
                    : _exportarPorDispositivo,
                  icon: Icon(Icons.devices),
                  label: Text(_dispositivoSelecionado != null 
                    ? 'Exportar $_dispositivoSelecionado ($_formatoSelecionado)'
                    : 'Selecione um Dispositivo'
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
            
            if (_listaDispositivos.isEmpty && !_carregandoDispositivos)
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Nenhum dispositivo encontrado na base de dados.',
                        style: TextStyle(color: Colors.orange.shade800),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Fechar'),
        ),
        if (_listaDispositivos.isNotEmpty)
          TextButton(
            onPressed: _carregarDispositivos,
            child: Text('Atualizar Dispositivos'),
          ),
      ],
    );
  }
}