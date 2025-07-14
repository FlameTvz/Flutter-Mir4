import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).error,
              ),
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
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
            final data = doc.data() as Map<String, dynamic>;
            
            return EventoCard(
              eventoId: doc.id,
              eventoData: data,
            );
          },
        );
      },
    );
  }
}

class EventoCard extends StatelessWidget {
  final String eventoId;
  final Map<String, dynamic> eventoData;

  const EventoCard({
    Key? key,
    required this.eventoId,
    required this.eventoData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extrair dados do evento com valores padrão
    final dispositivo = eventoData['dispositivoId'] ?? 'N/A';
    final estado = eventoData['estado'] ?? 'N/A';
    final numeroRele = eventoData['numeroRele'] ?? 0;
    final origem = eventoData['origem'] ?? 'N/A';
    final pinoEntrada = eventoData['pinoEntrada'] ?? 0;
    final timestamp = eventoData['timestamp'] ?? '';

    // Formatar timestamp se necessário
    String formatarTimestamp(String timestamp) {
      if (timestamp.isEmpty) return 'N/A';
      try {
        final DateTime dateTime = DateTime.parse(timestamp);
        return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
      } catch (e) {
        return timestamp;
      }
    }

    // Definir cor baseada no estado
    Color getCorEstado(String estado) {
      switch (estado.toUpperCase()) {
        case 'LIGADO':
          return Colors.green;
        case 'DESLIGADO':
          return Colors.red;
        case 'ALERTA':
          return Colors.orange;
        default:
          return FlutterFlowTheme.of(context).secondaryText;
      }
    }

    // Definir ícone baseado na origem
    IconData getIconeOrigem(String origem) {
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

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(
          getIconeOrigem(origem),
          color: FlutterFlowTheme.of(context).primary,
          size: 24,
        ),
        title: Text(
          'Dispositivo: $dispositivo',
          style: FlutterFlowTheme.of(context).titleMedium.override(
            fontFamily: 'Readex Pro',
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          formatarTimestamp(timestamp),
          style: FlutterFlowTheme.of(context).bodySmall.override(
            fontFamily: 'Readex Pro',
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: getCorEstado(estado).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            estado,
            style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Readex Pro',
              color: getCorEstado(estado),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'ID do Evento',
                        eventoId,
                        Icons.fingerprint,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'Origem',
                        origem,
                        getIconeOrigem(origem),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'Número Role',
                        numeroRele.toString(),
                        Icons.numbers,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildInfoCard(
                        context,
                        'Pino Entrada',
                        pinoEntrada.toString(),
                        Icons.input,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _mostrarDetalhesEvento(context, eventoId, eventoData);
                      },
                      icon: const Icon(Icons.info_outline, size: 16),
                      label: const Text('Detalhes'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _confirmarExclusao(context, eventoId);
                      },
                      icon: const Icon(Icons.delete_outline, size: 16),
                      label: const Text('Excluir'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDetalhesEvento(BuildContext context, String eventoId, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Detalhes do Evento',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDetalheItem('ID do Evento', eventoId),
                _buildDetalheItem('Dispositivo ID', data['dispositivoId'] ?? 'N/A'),
                _buildDetalheItem('Estado', data['estado'] ?? 'N/A'),
                _buildDetalheItem('Número Role', data['numeroRele']?.toString() ?? 'N/A'),
                _buildDetalheItem('Origem', data['origem'] ?? 'N/A'),
                _buildDetalheItem('Pino Entrada', data['pinoEntrada']?.toString() ?? 'N/A'),
                _buildDetalheItem('Timestamp', data['timestamp'] ?? 'N/A'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Fechar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
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
          title: Text(
            'Confirmar Exclusão',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          content: const Text('Tem certeza que deseja excluir este evento?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
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
              child: Text(
                'Excluir',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}