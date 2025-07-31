// ============================================================================
// ARQUIVO: lib/teste_filtro_esp.dart
// ARQUIVO PARA TESTAR O FILTRO DE ESP
// ============================================================================

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Widget principal para testar os filtros
class TesteFiltroEspWidget extends StatelessWidget {
  const TesteFiltroEspWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🧪 Teste de Filtro ESP'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Escolha um teste:',
              style: FlutterFlowTheme.of(context).headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            
            // Info sobre ESPs encontrados
            FutureBuilder<List<String>>(
              future: _buscarESPsDisponiveis(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ESPs encontrados no banco:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...snapshot.data!.map((esp) => Text('• $esp')),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            
            SizedBox(height: 20),
            
            // Botão 1: Todos os eventos
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TesteEventosListWidget(
                      espId: null,
                      titulo: 'TODOS OS EVENTOS',
                    ),
                  ),
                );
              },
              icon: Icon(Icons.list),
              label: Text('Ver TODOS os eventos'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            
            SizedBox(height: 10),
            
            // Botão 2: ESP específico 1
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TesteEventosListWidget(
                      espId: "F894D9498CD4",
                      titulo: 'ESP F894D9498CD4',
                    ),
                  ),
                );
              },
              icon: Icon(Icons.memory),
              label: Text('Ver apenas ESP F894D9498CD4'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            
            SizedBox(height: 10),
            
            // Botão 3: ESP específico 2
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TesteEventosListWidget(
                      espId: "8860B5895DC0",
                      titulo: 'ESP 8860B5895DC0',
                    ),
                  ),
                );
              },
              icon: Icon(Icons.memory),
              label: Text('Ver apenas ESP 8860B5895DC0'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            
            SizedBox(height: 10),
            
            // Botão 4: ESP inexistente
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TesteEventosListWidget(
                      espId: "ESP_INEXISTENTE",
                      titulo: 'ESP INEXISTENTE',
                    ),
                  ),
                );
              },
              icon: Icon(Icons.warning),
              label: Text('Testar ESP inexistente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            
            SizedBox(height: 20),
            
            Text(
              'Observe o console para ver os logs de debug',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<List<String>> _buscarESPsDisponiveis() async {
    try {
      final DatabaseReference eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
      final DatabaseEvent event = await eventosRef.once();
      
      if (!event.snapshot.exists) {
        return [];
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final Set<String> esps = {};
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final dispositivoId = (evento['dispositivoId'] ?? '').toString();
          if (dispositivoId.isNotEmpty) {
            esps.add(dispositivoId);
          }
        }
      });
      
      final lista = esps.toList();
      lista.sort();
      return lista;
    } catch (e) {
      print('Erro ao buscar ESPs: $e');
      return [];
    }
  }
}

// Widget para mostrar a lista filtrada
class TesteEventosListWidget extends StatelessWidget {
  final String? espId;
  final String titulo;

  const TesteEventosListWidget({
    Key? key,
    this.espId,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🧪 $titulo'),
        backgroundColor: espId == null ? Colors.grey[600] : Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header com informações do filtro
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: espId == null ? Colors.grey.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Configuração do Teste:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('ESP ID: ${espId ?? "null (todos os eventos)"}'),
                Text('Filtro ativo: ${espId != null ? "SIM" : "NÃO"}'),
                Text('Caminho: MIR/eventos'),
              ],
            ),
          ),
          
          // Lista de eventos
          Expanded(
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, authSnapshot) {
                if (authSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!authSnapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login, size: 64, color: Colors.blue),
                        SizedBox(height: 16),
                        Text('Faça login para ver os eventos'),
                      ],
                    ),
                  );
                }

                return TesteStreamWidget(espId: espId);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para o stream dos eventos
class TesteStreamWidget extends StatelessWidget {
  final String? espId;

  const TesteStreamWidget({Key? key, this.espId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseReference eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');

    return StreamBuilder<DatabaseEvent>(
      stream: eventosRef.orderByChild('timestamp').onValue,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                Text('Erro: ${snapshot.error}'),
              ],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final DataSnapshot? dataSnapshot = snapshot.data?.snapshot;

        if (dataSnapshot == null || !dataSnapshot.exists) {
          return Center(
            child: Text('Nenhum evento no banco de dados'),
          );
        }

        try {
          final Map<dynamic, dynamic> eventosMap = dataSnapshot.value as Map<dynamic, dynamic>;
          final List<TesteEventoItem> eventosList = [];

          // ============================================================================
          // 🔍 LOGS DE DEBUG DETALHADOS
          // ============================================================================
          print('');
          print('🧪 =================== TESTE DE FILTRO ===================');
          print('🎯 ESP ID para filtrar: ${espId ?? "null (todos)"}');
          print('📊 Total de eventos no banco: ${eventosMap.length}');
          print('');

          eventosMap.forEach((key, value) {
            try {
              if (value is Map) {
                final eventoData = Map<String, dynamic>.from(value);
                final dispositivoId = (eventoData['dispositivoId'] ?? '').toString();
                final timestamp = _parseToInt(eventoData['timestamp']);
                
                print('🔍 Evento $key:');
                print('   - ESP: "$dispositivoId"');
                print('   - Timestamp: $timestamp');
                
                // Aplicar filtro se ESP ID foi especificado
                if (espId != null) {
                  if (dispositivoId == espId) {
                    print('   ✅ INCLUÍDO (ESP corresponde)');
                    eventosList.add(TesteEventoItem(
                      id: key.toString(),
                      data: eventoData,
                    ));
                  } else {
                    print('   ❌ EXCLUÍDO (ESP diferente: "$dispositivoId" != "$espId")');
                  }
                } else {
                  print('   ✅ INCLUÍDO (sem filtro)');
                  eventosList.add(TesteEventoItem(
                    id: key.toString(),
                    data: eventoData,
                  ));
                }
                print('');
              }
            } catch (e) {
              print('❌ Erro ao processar evento $key: $e');
            }
          });

          print('📊 Total de eventos após filtro: ${eventosList.length}');
          print('🧪 =====================================================');
          print('');

          // Ordenar por timestamp
          eventosList.sort((a, b) {
            final timestampA = _parseToInt(a.data['timestamp']);
            final timestampB = _parseToInt(b.data['timestamp']);
            return timestampB.compareTo(timestampA);
          });

          if (eventosList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    espId != null ? Icons.filter_alt_off : Icons.inbox_outlined,
                    size: 64,
                    color: espId != null ? Colors.orange : Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    espId != null 
                        ? 'Nenhum evento do ESP $espId'
                        : 'Nenhum evento encontrado',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                  SizedBox(height: 8),
                  Text(
                    espId != null 
                        ? 'Existem ${eventosMap.length} eventos no banco, mas nenhum é do ESP $espId'
                        : 'Não há eventos no banco de dados',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: eventosList.length,
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              final evento = eventosList[index];
              return TesteEventoCard(
                eventoId: evento.id,
                data: evento.data,
                espFiltro: espId,
              );
            },
          );
        } catch (e) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, size: 64, color: Colors.orange),
                Text('Erro ao processar dados: $e'),
              ],
            ),
          );
        }
      },
    );
  }

  int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }
}

// Classe para item de evento
class TesteEventoItem {
  final String id;
  final Map<String, dynamic> data;

  TesteEventoItem({required this.id, required this.data});
}

// Card para mostrar o evento
class TesteEventoCard extends StatelessWidget {
  final String eventoId;
  final Map<String, dynamic> data;
  final String? espFiltro;

  const TesteEventoCard({
    Key? key,
    required this.eventoId,
    required this.data,
    this.espFiltro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dispositivo = (data['dispositivoId'] ?? 'N/A').toString();
    final estado = (data['estado'] ?? 'N/A').toString();
    final origem = (data['origem'] ?? 'N/A').toString();
    final timestamp = _parseToInt(data['timestamp']);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Destacar se é o ESP filtrado
    final bool isEspFiltrado = espFiltro != null && dispositivo == espFiltro;

    return Card(
      elevation: isEspFiltrado ? 8 : 2,
      color: isEspFiltrado ? Colors.blue.withOpacity(0.1) : null,
      child: Padding(
        padding: EdgeInsets.all(16),
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
                      color: isEspFiltrado ? Colors.blue : Colors.grey,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      dispositivo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isEspFiltrado ? Colors.blue : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    if (isEspFiltrado) ...[
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'FILTRADO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  _formatarData(dateTime),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            
            SizedBox(height: 8),
            
            // Estado
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getCorEstado(estado).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _getCorEstado(estado)),
              ),
              child: Text(
                estado,
                style: TextStyle(
                  color: _getCorEstado(estado),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            
            SizedBox(height: 8),
            
            // Info adicional
            Text(
              'Origem: $origem | ID: $eventoId',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
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

  String _formatarData(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d atrás';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h atrás';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}min atrás';
    } else {
      return 'Agora';
    }
  }

  int _parseToInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }
}