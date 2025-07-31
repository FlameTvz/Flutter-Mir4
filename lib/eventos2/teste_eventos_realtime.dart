// ============================================================================
// ARQUIVO: lib/eventos2/teste_eventos_realtime.dart
// ARQUIVO PARA TESTAR A MIGRAÇÃO DO FIRESTORE PARA REALTIME DATABASE
// ============================================================================

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TesteEventosRealtimeWidget extends StatefulWidget {
  const TesteEventosRealtimeWidget({Key? key}) : super(key: key);

  @override
  _TesteEventosRealtimeWidgetState createState() => _TesteEventosRealtimeWidgetState();
}

class _TesteEventosRealtimeWidgetState extends State<TesteEventosRealtimeWidget> {
  final DatabaseReference _eventosRef = FirebaseDatabase.instance.ref('MIR/eventos');
  bool _testando = false;
  List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _adicionarLog('🔄 Widget de teste inicializado');
    _adicionarLog('📍 Caminho: MIR/eventos');
    _adicionarLog('🌐 URL: https://poised-bot-443613-p6-default-rtdb.firebaseio.com/');
  }

  void _adicionarLog(String mensagem) {
    setState(() {
      _logs.add('${DateTime.now().toString().substring(11, 19)} - $mensagem');
    });
    print(mensagem);
  }

  void _limparLogs() {
    setState(() {
      _logs.clear();
    });
  }

  // ============================================================================
  // TESTE 1: VERIFICAR CONEXÃO
  // ============================================================================
  
  Future<void> _testarConexao() async {
    setState(() => _testando = true);
    _adicionarLog('🔄 Testando conexão...');
    
    try {
      final DatabaseReference testRef = FirebaseDatabase.instance.ref('test/conexao');
      
      await testRef.set({
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'teste': 'Conexão OK',
        'origem': 'TesteWidget',
      });
      
      final DatabaseEvent event = await testRef.once();
      if (event.snapshot.exists) {
        _adicionarLog('✅ Conexão bem-sucedida!');
        await testRef.remove();
        _adicionarLog('🗑️ Dados de teste removidos');
      } else {
        _adicionarLog('❌ Falha na conexão - dados não encontrados');
      }
      
    } catch (e) {
      _adicionarLog('❌ Erro na conexão: $e');
    }
    
    setState(() => _testando = false);
  }

  // ============================================================================
  // TESTE 2: CRIAR EVENTO DE TESTE
  // ============================================================================
  
  Future<void> _criarEventoTeste() async {
    setState(() => _testando = true);
    _adicionarLog('🔄 Criando evento de teste...');
    
    try {
      final String novoEventoId = _eventosRef.push().key!;
      
      final evento = {
        'dispositivoId': 'TESTE_${DateTime.now().millisecondsSinceEpoch}',
        'estado': 'TESTE',
        'numeroRele': 999,
        'origem': 'TESTE_WIDGET',
        'pinoEntrada': 0,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'criadoPor': 'TesteWidget',
      };
      
      await _eventosRef.child(novoEventoId).set(evento);
      
      _adicionarLog('✅ Evento criado com ID: $novoEventoId');
      _adicionarLog('📊 Dados: ${evento.toString()}');
      
    } catch (e) {
      _adicionarLog('❌ Erro ao criar evento: $e');
    }
    
    setState(() => _testando = false);
  }

  // ============================================================================
  // TESTE 3: LISTAR EVENTOS EXISTENTES
  // ============================================================================
  
  Future<void> _listarEventos() async {
    setState(() => _testando = true);
    _adicionarLog('🔄 Listando eventos existentes...');
    
    try {
      final DatabaseEvent event = await _eventosRef.orderByChild('timestamp').limitToLast(5).once();
      
      if (!event.snapshot.exists) {
        _adicionarLog('📋 Nenhum evento encontrado');
        setState(() => _testando = false);
        return;
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      _adicionarLog('📊 Total de eventos encontrados: ${eventosData.length}');
      
      int contador = 0;
      eventosData.forEach((key, value) {
        contador++;
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final timestamp = evento['timestamp'] ?? 0;
          final data = DateTime.fromMillisecondsSinceEpoch(timestamp);
          
          _adicionarLog('📄 [$contador] ID: $key');
          _adicionarLog('   🔧 Dispositivo: ${evento['dispositivoId'] ?? 'N/A'}');
          _adicionarLog('   ⚡ Estado: ${evento['estado'] ?? 'N/A'}');
          _adicionarLog('   🕒 Data: ${data.toString()}');
          _adicionarLog('   📍 Origem: ${evento['origem'] ?? 'N/A'}');
        }
      });
      
    } catch (e) {
      _adicionarLog('❌ Erro ao listar eventos: $e');
    }
    
    setState(() => _testando = false);
  }

  // ============================================================================
  // TESTE 4: BUSCAR POR DISPOSITIVO
  // ============================================================================
  
  Future<void> _buscarPorDispositivo() async {
    setState(() => _testando = true);
    _adicionarLog('🔄 Buscando dispositivos únicos...');
    
    try {
      final DatabaseEvent event = await _eventosRef.once();
      
      if (!event.snapshot.exists) {
        _adicionarLog('📋 Nenhum evento encontrado');
        setState(() => _testando = false);
        return;
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final Set<String> dispositivos = {};
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final dispositivo = evento['dispositivoId']?.toString();
          if (dispositivo != null && dispositivo.isNotEmpty) {
            dispositivos.add(dispositivo);
          }
        }
      });
      
      _adicionarLog('📱 Dispositivos únicos encontrados: ${dispositivos.length}');
      
      for (String dispositivo in dispositivos.take(5)) {
        _adicionarLog('   📱 $dispositivo');
      }
      
      if (dispositivos.length > 5) {
        _adicionarLog('   ... e mais ${dispositivos.length - 5} dispositivos');
      }
      
    } catch (e) {
      _adicionarLog('❌ Erro ao buscar dispositivos: $e');
    }
    
    setState(() => _testando = false);
  }

  // ============================================================================
  // TESTE 5: LIMPAR EVENTOS DE TESTE
  // ============================================================================
  
  Future<void> _limparEventosTeste() async {
    setState(() => _testando = true);
    _adicionarLog('🔄 Limpando eventos de teste...');
    
    try {
      final DatabaseEvent event = await _eventosRef.orderByChild('origem').equalTo('TESTE_WIDGET').once();
      
      if (!event.snapshot.exists) {
        _adicionarLog('🗑️ Nenhum evento de teste encontrado');
        setState(() => _testando = false);
        return;
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final Map<String, dynamic> eventosParaRemover = {};
      
      eventosData.forEach((key, value) {
        eventosParaRemover[key] = null; // null remove o item
      });
      
      await _eventosRef.update(eventosParaRemover);
      
      _adicionarLog('✅ ${eventosData.length} evento(s) de teste removido(s)');
      
    } catch (e) {
      _adicionarLog('❌ Erro ao limpar eventos de teste: $e');
    }
    
    setState(() => _testando = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Realtime Database'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.clear_all),
            onPressed: _limparLogs,
            tooltip: 'Limpar logs',
          ),
        ],
      ),
      body: Column(
        children: [
          // Informações de conexão
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border: Border(bottom: BorderSide(color: Colors.blue.withOpacity(0.3))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🔗 Configuração:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('URL: https://poised-bot-443613-p6-default-rtdb.firebaseio.com/'),
                Text('Caminho: MIR/eventos'),
                Text('Status: ${_testando ? '🔄 Executando...' : '✅ Pronto'}'),
              ],
            ),
          ),
          
          // Botões de teste
          Container(
            padding: EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: _testando ? null : _testarConexao,
                  icon: Icon(Icons.wifi),
                  label: Text('Testar Conexão'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton.icon(
                  onPressed: _testando ? null : _criarEventoTeste,
                  icon: Icon(Icons.add),
                  label: Text('Criar Evento Teste'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton.icon(
                  onPressed: _testando ? null : _listarEventos,
                  icon: Icon(Icons.list),
                  label: Text('Listar Eventos'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton.icon(
                  onPressed: _testando ? null : _buscarPorDispositivo,
                  icon: Icon(Icons.devices),
                  label: Text('Buscar Dispositivos'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                ),
                ElevatedButton.icon(
                  onPressed: _testando ? null : _limparEventosTeste,
                  icon: Icon(Icons.delete),
                  label: Text('Limpar Testes'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
          
          // Logs
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: _logs.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum log ainda. Execute um teste acima.',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  )
                : ListView.builder(
                    itemCount: _logs.length,
                    itemBuilder: (context, index) {
                      final log = _logs[index];
                      Color cor = Colors.white;
                      
                      if (log.contains('✅')) cor = Colors.green;
                      else if (log.contains('❌')) cor = Colors.red;
                      else if (log.contains('⚠️')) cor = Colors.orange;
                      else if (log.contains('🔄')) cor = Colors.blue;
                      else if (log.contains('📊') || log.contains('📄') || log.contains('📱')) cor = Colors.cyan;
                      
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          log,
                          style: TextStyle(
                            color: cor,
                            fontFamily: 'monospace',
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}