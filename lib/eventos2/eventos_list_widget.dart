import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventosListWidget extends StatelessWidget {
  // ============================================================================
  // 🔧 ADICIONAR PARÂMETRO PARA ESP ID
  // ============================================================================
  final String? espId; // ID do ESP específico para filtrar

  const EventosListWidget({Key? key, this.espId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ============================================================================
    // 🔧 PEGAR ESP ID DA VARIÁVEL GLOBAL OU USAR O PARÂMETRO
    // ============================================================================
    String? espIdFinal = espId;

    if (espIdFinal == null) {
      try {
        final appState = Provider.of<FFAppState>(context,
            listen: true); // listen: true para reagir a mudanças
        espIdFinal = appState.idsESP.isNotEmpty ? appState.idsESP : null;
        print('🔧 ESP ID obtido da variável global: $espIdFinal');
      } catch (e) {
        print('❌ Erro ao obter ESP ID da variável global: $e');
      }
    }

    print('🎯 ESP ID final para filtro: $espIdFinal');

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {
        // Aguardar autenticação
        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Verificando autenticação...'),
              ],
            ),
          );
        }

        // Se não autenticado, mostrar mensagem para fazer login
        if (!authSnapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login,
                  size: 64,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                Text(
                  'Login necessário',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  espIdFinal != null
                      ? 'Faça login para ver eventos do ESP $espIdFinal'
                      : 'Faça login para ver seus eventos',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Caminho: MIR/eventos',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final user = authSnapshot.data!;
        return EventosStreamWidget(userId: user.uid, espId: espIdFinal);
      },
    );
  }
}

// ============================================================================
// WIDGET PARA STREAM DOS EVENTOS
// ============================================================================

class EventosStreamWidget extends StatelessWidget {
  final String userId;
  final String? espId; // Adicionar ESP ID

  const EventosStreamWidget({Key? key, required this.userId, this.espId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usar o caminho correto onde estão os eventos
    final DatabaseReference eventosRef =
        FirebaseDatabase.instance.ref('MIR/eventos');

    return StreamBuilder<DatabaseEvent>(
      stream: eventosRef.orderByChild('timestamp').onValue,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Erro ao carregar eventos',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Erro: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Força rebuild
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  'Carregando eventos...',
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ],
            ),
          );
        }

        final DataSnapshot? dataSnapshot = snapshot.data?.snapshot;

        if (dataSnapshot == null || !dataSnapshot.exists) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  espId != null
                      ? 'Nenhum evento encontrado para ESP $espId'
                      : 'Nenhum evento encontrado',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  espId != null
                      ? 'Os eventos do ESP $espId aparecerão aqui quando forem criados'
                      : 'Os eventos aparecerão aqui quando forem criados',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Caminho: MIR/eventos',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                ),
                if (espId != null)
                  Text(
                    'Filtrando por: $espId',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          color: Colors.blue[600],
                          fontSize: 10,
                        ),
                  ),
              ],
            ),
          );
        }

        try {
          final Map<dynamic, dynamic> eventosMap =
              dataSnapshot.value as Map<dynamic, dynamic>;
          final List<EventoItem> eventosList = [];

          print('🔍 Processando ${eventosMap.length} eventos do banco...');
          if (espId != null) {
            print('🎯 Filtrando apenas eventos do ESP: $espId');
          }

          eventosMap.forEach((key, value) {
            try {
              if (value is Map) {
                final eventoData = Map<String, dynamic>.from(value);
                final dispositivoId =
                    SafeParser.parseString(eventoData['dispositivoId']);

                // ============================================================================
                // 🔧 FILTRO MAIS RIGOROSO POR ESP ID
                // ============================================================================
                if (espId != null) {
                  // Debug: mostrar o que está sendo comparado
                  print(
                      '🔍 Comparando: "$dispositivoId" == "$espId" ? ${dispositivoId == espId}');

                  if (dispositivoId != espId) {
                    print(
                        '❌ Evento $key ignorado (ESP: $dispositivoId != $espId)');
                    return; // Pular este evento se não for do ESP especificado
                  }
                  print('✅ Evento $key incluído (ESP: $dispositivoId)');
                }

                eventosList.add(EventoItem(
                  id: key.toString(),
                  data: eventoData,
                ));
              }
            } catch (e) {
              print('Erro ao processar evento $key: $e');
            }
          });

          print('📊 Total de eventos após filtro: ${eventosList.length}');

          // Se não há eventos após o filtro, mostrar mensagem específica
          if (eventosList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.filter_alt_off,
                      size: 64, color: Colors.orange),
                  const SizedBox(height: 16),
                  Text(
                    espId != null
                        ? 'Nenhum evento do ESP $espId'
                        : 'Nenhum evento encontrado',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    espId != null
                        ? 'Existem eventos no banco, mas nenhum é do ESP $espId'
                        : 'Não há eventos disponíveis',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (espId != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.withOpacity(0.3)),
                      ),
                      child: Text(
                        'Filtro ativo: $espId',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }

          // Ordenar por timestamp
          eventosList.sort((a, b) {
            try {
              final timestampA = SafeParser.parseInt(a.data['timestamp']);
              final timestampB = SafeParser.parseInt(b.data['timestamp']);
              return timestampB.compareTo(timestampA);
            } catch (e) {
              return 0;
            }
          });

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: eventosList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final evento = eventosList[index];
              return EventoCard(
                eventoId: evento.id,
                data: evento.data,
                userId: userId,
              );
            },
          );
        } catch (e) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning, size: 64, color: Colors.orange),
                const SizedBox(height: 16),
                Text(
                  'Erro ao processar dados',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Erro: $e',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

// ============================================================================
// CLASSE PARA ITEM DE EVENTO
// ============================================================================

class EventoItem {
  final String id;
  final Map<String, dynamic> data;

  EventoItem({required this.id, required this.data});
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
      // Se for uma string de data/hora, converter para timestamp
      if (value.contains('-') && value.contains(':')) {
        try {
          return _parseTimestampString(value);
        } catch (e) {
          print('Erro ao converter timestamp string: $e');
          return DateTime.now().millisecondsSinceEpoch;
        }
      }

      // Tentar converter string numérica normal
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

  static int _parseTimestampString(String dateString) {
    try {
      // Remover aspas se houver
      String cleanString = dateString.replaceAll('"', '').trim();

      // Formatos possíveis:
      // "2025-07-16 11:27"
      // "2025-07-16 11:27:30"
      // "16/07/2025 11:27"
      // "16/07/2025 11:27:30"

      DateTime dateTime;

      if (cleanString.contains('-')) {
        // Formato YYYY-MM-DD
        if (cleanString.split(' ').length == 2) {
          String datePart = cleanString.split(' ')[0];
          String timePart = cleanString.split(' ')[1];

          List<String> dateComponents = datePart.split('-');
          List<String> timeComponents = timePart.split(':');

          int year = int.parse(dateComponents[0]);
          int month = int.parse(dateComponents[1]);
          int day = int.parse(dateComponents[2]);
          int hour = int.parse(timeComponents[0]);
          int minute = int.parse(timeComponents[1]);
          int second =
              timeComponents.length > 2 ? int.parse(timeComponents[2]) : 0;

          dateTime = DateTime(year, month, day, hour, minute, second);
        } else {
          // Tentar parse direto
          dateTime = DateTime.parse(cleanString);
        }
      } else if (cleanString.contains('/')) {
        // Formato DD/MM/YYYY
        String datePart = cleanString.split(' ')[0];
        String timePart = cleanString.split(' ')[1];

        List<String> dateComponents = datePart.split('/');
        List<String> timeComponents = timePart.split(':');

        int day = int.parse(dateComponents[0]);
        int month = int.parse(dateComponents[1]);
        int year = int.parse(dateComponents[2]);
        int hour = int.parse(timeComponents[0]);
        int minute = int.parse(timeComponents[1]);
        int second =
            timeComponents.length > 2 ? int.parse(timeComponents[2]) : 0;

        dateTime = DateTime(year, month, day, hour, minute, second);
      } else {
        // Formato ISO ou outro
        dateTime = DateTime.parse(cleanString);
      }

      return dateTime.millisecondsSinceEpoch;
    } catch (e) {
      print('Erro ao fazer parse da data "$dateString": $e');
      return DateTime.now().millisecondsSinceEpoch;
    }
  }

  static String parseString(dynamic value) {
    if (value == null) return '';
    return value.toString();
  }

  static double parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return 0.0;
      }
    }
    return 0.0;
  }
}

// ============================================================================
// CARD DO EVENTO
// ============================================================================

class EventoCard extends StatelessWidget {
  final String eventoId;
  final Map<String, dynamic> data;
  final String userId;

  const EventoCard({
    Key? key,
    required this.eventoId,
    required this.data,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parsing seguro dos dados
    final timestamp = SafeParser.parseInt(data['timestamp']);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final dispositivo = SafeParser.parseString(data['dispositivoId']);
    final estado = SafeParser.parseString(data['estado']);
    final numeroRele = SafeParser.parseInt(data['numeroRele']);
    final origem = SafeParser.parseString(data['origem']);
    final pinoEntrada = SafeParser.parseInt(data['pinoEntrada']);

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => _mostrarDetalhes(context),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.memory,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        dispositivo.isEmpty ? 'Dispositivo N/A' : dispositivo,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  Text(
                    _formatarData(dateTime),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Estado e relé
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCorEstado(estado).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _getCorEstado(estado)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.power,
                          size: 16,
                          color: _getCorEstado(estado),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          estado.isEmpty ? 'N/A' : estado,
                          style: TextStyle(
                            color: _getCorEstado(estado),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.electrical_services,
                          size: 16,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Relé $numeroRele',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Origem e pino
              Row(
                children: [
                  Icon(
                    _getIconeOrigem(origem),
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Origem: ${origem.isEmpty ? 'N/A' : origem}',
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.input,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Pino: $pinoEntrada',
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // ID do evento
              Text(
                'ID: $eventoId',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      color: Colors.grey[500],
                      fontSize: 10,
                    ),
              ),
            ],
          ),
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

  String _formatarData(DateTime dateTime) {
    try {
      // Se receber o valor diretamente do data, fazer parse primeiro
      if (dateTime == null) {
        final timestampValue = data['timestamp'];

        if (timestampValue is String) {
          final timestamp = SafeParser.parseInt(timestampValue);
          dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
        } else {
          final timestamp = SafeParser.parseInt(timestampValue);
          dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
        }
      }

      return '${dateTime.day.toString().padLeft(2, '0')}/'
          '${dateTime.month.toString().padLeft(2, '0')} '
          '${dateTime.hour.toString().padLeft(2, '0')}:'
          '${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Data inválida';
    }
  }

  void _mostrarDetalhes(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.info_outline,
                color: FlutterFlowTheme.of(context).primary),
            const SizedBox(width: 8),
            const Text('Detalhes do Evento'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetalheItem('ID do Evento', eventoId),
              _buildDetalheItem(
                  'Dispositivo', SafeParser.parseString(data['dispositivoId'])),
              _buildDetalheItem(
                  'Estado', SafeParser.parseString(data['estado'])),
              _buildDetalheItem('Número do Relé',
                  SafeParser.parseInt(data['numeroRele']).toString()),
              _buildDetalheItem(
                  'Origem', SafeParser.parseString(data['origem'])),
              _buildDetalheItem('Pino de Entrada',
                  SafeParser.parseInt(data['pinoEntrada']).toString()),
              _buildDetalheItem('Timestamp', _formatarDataCompleta()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
          TextButton(
            onPressed: () => _deletarEvento(context),
            child: const Text('Deletar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildDetalheItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? 'N/A' : value,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatarDataCompleta() {
    try {
      final timestampValue = data['timestamp'];

      DateTime dateTime;

      if (timestampValue is String) {
        // Se for string, usar o novo parser
        final timestamp = SafeParser.parseInt(timestampValue);
        dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      } else {
        // Se for número, usar conversão normal
        final timestamp = SafeParser.parseInt(timestampValue);

        // Verificar se é timestamp em segundos ou milissegundos
        int timestampCorreto = timestamp;
        if (timestamp < 946684800000 && timestamp > 946684800) {
          // Se for entre 2000 em segundos e 2000 em milissegundos, está em segundos
          timestampCorreto = timestamp * 1000;
        }

        dateTime = DateTime.fromMillisecondsSinceEpoch(timestampCorreto);
      }

      return '${dateTime.day.toString().padLeft(2, '0')}/'
          '${dateTime.month.toString().padLeft(2, '0')}/'
          '${dateTime.year} '
          '${dateTime.hour.toString().padLeft(2, '0')}:'
          '${dateTime.minute.toString().padLeft(2, '0')}:'
          '${dateTime.second.toString().padLeft(2, '0')}';
    } catch (e) {
      print('Erro ao formatar data: $e');
      return 'Data inválida';
    }
  }

  void _deletarEvento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: const Text(
            'Tem certeza que deseja deletar este evento? Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              try {
                final DatabaseReference eventoRef =
                    FirebaseDatabase.instance.ref('MIR/eventos/$eventoId');
                await eventoRef.remove();

                if (context.mounted) {
                  Navigator.of(context).pop(); // Fechar dialog de confirmação
                  Navigator.of(context).pop(); // Fechar dialog de detalhes

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Evento deletado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop(); // Fechar dialog de confirmação

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro ao deletar evento: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('Deletar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
