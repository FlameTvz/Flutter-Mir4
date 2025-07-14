import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'evento_model.dart';

class EventosListWidget extends StatelessWidget {
  const EventosListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('eventos')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Erro ao carregar eventos: ${snapshot.error}',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_note,
                  size: 64,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                const SizedBox(height: 16),
                Text(
                  'Nenhum evento encontrado',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ],
            ),
          );
        }

        final eventos = snapshot.data!.docs
            .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: eventos.length,
          itemBuilder: (context, index) {
            final evento = eventos[index];
            return _buildEventoCard(context, evento);
          },
        );
      },
    );
  }

  Widget _buildEventoCard(BuildContext context, EventoModel evento) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getCorEstado(evento.estado).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getIconeOrigem(evento.origem),
                    color: _getCorEstado(evento.estado),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dispositivo: ${evento.dispositivoId}',
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatarTimestamp(evento.timestamp),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCorEstado(evento.estado),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    evento.estado.toUpperCase(),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(color: FlutterFlowTheme.of(context).alternate),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildInfoChip(context, 'Role', evento.numeroRele.toString()),
                const SizedBox(width: 8),
                _buildInfoChip(context, 'Pino', evento.pinoEntrada.toString()),
                const SizedBox(width: 8),
                _buildInfoChip(context, 'Origem', evento.origem),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => _mostrarDetalhes(context, evento),
                  icon: const Icon(Icons.info_outline, size: 16),
                  label: const Text('Detalhes'),
                  style: TextButton.styleFrom(
                    foregroundColor: FlutterFlowTheme.of(context).primary,
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _confirmarExclusao(context, evento.id),
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Excluir'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Text(
        '$label: $value',
        style: FlutterFlowTheme.of(context).bodySmall.override(
          fontFamily: 'Readex Pro',
          fontSize: 12,
        ),
      ),
    );
  }

  Color _getCorEstado(String estado) {
    switch (estado.toUpperCase()) {
      case 'LIGADO':
        return Colors.green;
      case 'DESLIGADO':
        return Colors.red;
      case 'ALERTA':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconeOrigem(String origem) {
    switch (origem.toUpperCase()) {
      case 'FIREBASE':
        return Icons.cloud;
      case 'SENSOR':
        return Icons.sensors;
      case 'MANUAL':
        return Icons.touch_app;
      default:
        return Icons.device_unknown;
    }
  }

  String _formatarTimestamp(String timestamp) {
    if (timestamp.isEmpty) return 'N/A';
    
    try {
      DateTime dateTime;
      
      // Tenta formato ISO primeiro
      if (timestamp.contains('T') || timestamp.contains('Z')) {
        dateTime = DateTime.parse(timestamp);
      } 
      // Tenta formato brasileiro DD/MM/YYYY HH:MM ou YYYY-MM-DD HH:MM
      else if (timestamp.contains('/') || timestamp.contains('-')) {
        final parts = timestamp.split(' ');
        if (parts.length >= 2) {
          if (timestamp.contains('/')) {
            // Formato DD/MM/YYYY HH:MM:SS
            final dateParts = parts[0].split('/');
            final timeParts = parts[1].split(':');
            
            if (dateParts.length == 3 && timeParts.length >= 2) {
              final day = int.parse(dateParts[0]);
              final month = int.parse(dateParts[1]);
              final year = int.parse(dateParts[2]);
              final hour = int.parse(timeParts[0]);
              final minute = int.parse(timeParts[1]);
              final second = timeParts.length > 2 ? int.parse(timeParts[2]) : 0;
              
              dateTime = DateTime(year, month, day, hour, minute, second);
            } else {
              return timestamp; // Retorna como está se não conseguir parsear
            }
          } else {
            // Formato YYYY-MM-DD HH:MM
            final dateParts = parts[0].split('-');
            final timeParts = parts[1].split(':');
            
            if (dateParts.length == 3 && timeParts.length >= 2) {
              final year = int.parse(dateParts[0]);
              final month = int.parse(dateParts[1]);
              final day = int.parse(dateParts[2]);
              final hour = int.parse(timeParts[0]);
              final minute = int.parse(timeParts[1]);
              
              dateTime = DateTime(year, month, day, hour, minute);
            } else {
              return timestamp; // Retorna como está se não conseguir parsear
            }
          }
        } else {
          return timestamp; // Retorna como está se não conseguir parsear
        }
      } else {
        // Tenta parsear diretamente
        dateTime = DateTime.parse(timestamp);
      }
      
      return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    } catch (e) {
      print('Erro ao formatar timestamp "$timestamp": $e');
      return timestamp; // Retorna o timestamp original se não conseguir formatar
    }
  }

  void _mostrarDetalhes(BuildContext context, EventoModel evento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Evento'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetalheItem('ID', evento.id),
                _buildDetalheItem('Dispositivo', evento.dispositivoId),
                _buildDetalheItem('Estado', evento.estado),
                _buildDetalheItem('Número Role', evento.numeroRele.toString()),
                _buildDetalheItem('Origem', evento.origem),
                _buildDetalheItem('Pino Entrada', evento.pinoEntrada.toString()),
                _buildDetalheItem('Timestamp', evento.timestamp),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetalheItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _confirmarExclusao(BuildContext context, String eventoId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Tem certeza que deseja excluir este evento?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('eventos')
                      .doc(eventoId)
                      .delete();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Evento excluído com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro ao excluir evento: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Excluir', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}