import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'export_eventos_service.dart';

// Widget para mostrar estatísticas com tratamento de erros
class EstatisticasDialog extends StatelessWidget {
  const EstatisticasDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.analytics, color: FlutterFlowTheme.of(context).primary),
          const SizedBox(width: 8),
          Text(
            'Estatísticas dos Eventos',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
        ],
      ),
      content: FutureBuilder<Map<String, dynamic>>(
        future: _getEstatisticasSeguras(),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      'Erro ao carregar estatísticas',
                      style: FlutterFlowTheme.of(context).titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Verifique sua conexão com o Firebase',
                      style: FlutterFlowTheme.of(context).bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
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
                  // Estatísticas principais
                  _buildStatCard('Total de Eventos', stats['totalEventos']?.toString() ?? '0'),
                  _buildStatCard('Dispositivos Únicos', stats['dispositivosUnicos']?.toString() ?? '0'),
                  _buildStatCard('Origens Únicas', stats['origensUnicas']?.toString() ?? '0'),
                  const SizedBox(height: 16),
                  
                  // Eventos por Estado
                  if (stats['eventosPorEstado'] != null && (stats['eventosPorEstado'] as Map).isNotEmpty) ...[
                    Text(
                      'Eventos por Estado:',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...((stats['eventosPorEstado'] as Map<String, int>).entries.map(
                      (entry) => _buildStatItem(entry.key, entry.value.toString()),
                    )),
                    const SizedBox(height: 16),
                  ],
                  
                  // Eventos por Origem
                  if (stats['eventosPorOrigem'] != null && (stats['eventosPorOrigem'] as Map).isNotEmpty) ...[
                    Text(
                      'Eventos por Origem:',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...((stats['eventosPorOrigem'] as Map<String, int>).entries.map(
                      (entry) => _buildStatItem(entry.key, entry.value.toString()),
                    )),
                    const SizedBox(height: 16),
                  ],
                  
                  // Top 5 Dispositivos
                  if (stats['eventosPorDispositivo'] != null && (stats['eventosPorDispositivo'] as Map).isNotEmpty) ...[
                    Text(
                      'Top 5 Dispositivos:',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...((stats['eventosPorDispositivo'] as Map<String, int>)
                        .entries
                        .toList()
                        ..sort((a, b) => b.value.compareTo(a.value)))
                        .take(5)
                        .map(
                          (entry) => _buildStatItem(entry.key, entry.value.toString()),
                        ),
                  ],
                  
                  // Evento mais recente
                  if (stats['eventoMaisRecente'] != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Evento Mais Recente:',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStatItem('Dispositivo', stats['eventoMaisRecente']['dispositivoId'] ?? 'N/A'),
                          _buildStatItem('Estado', stats['eventoMaisRecente']['estado'] ?? 'N/A'),
                          _buildStatItem('Timestamp', stats['eventoMaisRecente']['timestamp'] ?? 'N/A'),
                        ],
                      ),
                    ),
                  ],
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

  Future<Map<String, dynamic>> _getEstatisticasSeguras() async {
    try {
      return await ExportEventosService.getEstatisticasEventos();
    } catch (e) {
      print('Erro ao obter estatísticas: $e');
      // Retorna estatísticas vazias em caso de erro
      return {
        'totalEventos': 0,
        'eventosPorEstado': <String, int>{},
        'eventosPorOrigem': <String, int>{},
        'eventosPorDispositivo': <String, int>{},
        'eventoMaisRecente': null,
        'dispositivosUnicos': 0,
        'origensUnicas': 0,
        'estadosUnicos': 0,
      };
    }
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
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}