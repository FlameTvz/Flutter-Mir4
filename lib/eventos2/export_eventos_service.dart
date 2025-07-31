// ============================================================================
// ARQUIVO: lib/eventos2/export_eventos_service.dart - FIREBASE REALTIME DATABASE
// ============================================================================

import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_database/firebase_database.dart';

class ExportEventosService {
  
  // ============================================================================
  // REFERÊNCIA PARA O REALTIME DATABASE - CAMINHO CORRETO
  // ============================================================================
  
  // Usar o caminho correto onde estão os eventos
  static DatabaseReference get _eventosRef {
    return FirebaseDatabase.instance.ref('MIR/eventos');
  }
  
  // Função auxiliar para verificar autenticação
  static Future<void> _garantirAutenticacao() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('Usuário não autenticado. Faça login para acessar os eventos.');
    }
  }
  
  // ============================================================================
  // MÉTODO PARA BUSCAR ESTATÍSTICAS DE EVENTOS (GERAL OU POR ESP)
  // ============================================================================
  
  static Future<Map<String, dynamic>> getEstatisticasEventos() async {
    return getEstatisticasEventosEsp(null); // Todos os eventos
  }
  
  static Future<Map<String, dynamic>> getEstatisticasEventosEsp(String? espId) async {
    try {
      await _garantirAutenticacao();
      
      final DatabaseEvent event = await _eventosRef.once();
      
      if (!event.snapshot.exists) {
        return {
          'totalEventos': 0,
          'eventosPorTipo': <String, int>{},
          'eventosPorDispositivo': <String, int>{},
          'eventosPorEstado': <String, int>{},
          'eventosPorOrigem': <String, int>{},
          'eventoMaisRecente': null,
          'dispositivosUnicos': 0,
          'origensUnicas': 0,
          'estadosUnicos': 0,
        };
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final Map<String, int> eventosPorTipo = {};
      final Map<String, int> eventosPorDispositivo = {};
      final Map<String, int> eventosPorEstado = {};
      final Map<String, int> eventosPorOrigem = {};
      
      Map<String, dynamic>? eventoMaisRecente;
      int timestampMaisRecente = 0;
      int totalEventos = 0;
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          
          // Contadores - garantir que são strings
          final origem = (evento['origem'] ?? 'N/A').toString();
          final dispositivo = (evento['dispositivoId'] ?? 'N/A').toString();
          final estado = (evento['estado'] ?? 'N/A').toString();
          
          // ============================================================================
          // 🔧 FILTRAR POR ESP SE ESPECIFICADO
          // ============================================================================
          if (espId != null && dispositivo != espId) {
            return; // Pular este evento se não for do ESP especificado
          }
          
          totalEventos++;
          eventosPorTipo[origem] = (eventosPorTipo[origem] ?? 0) + 1;
          eventosPorDispositivo[dispositivo] = (eventosPorDispositivo[dispositivo] ?? 0) + 1;
          eventosPorEstado[estado] = (eventosPorEstado[estado] ?? 0) + 1;
          eventosPorOrigem[origem] = (eventosPorOrigem[origem] ?? 0) + 1;
          
          // Evento mais recente - garantir que timestamp é int
          final timestamp = _parseToInt(evento['timestamp']);
          if (timestamp > timestampMaisRecente) {
            timestampMaisRecente = timestamp;
            eventoMaisRecente = {
              'id': key.toString(),
              'dispositivoId': dispositivo,
              'estado': estado,
              'timestamp': DateTime.fromMillisecondsSinceEpoch(timestamp).toString(),
              'numeroRele': _parseToInt(evento['numeroRele']),
              'origem': origem,
              'pinoEntrada': _parseToInt(evento['pinoEntrada']),
            };
          }
        }
      });
      
      return {
        'totalEventos': totalEventos,
        'eventosPorTipo': eventosPorTipo,
        'eventosPorDispositivo': eventosPorDispositivo,
        'eventosPorEstado': eventosPorEstado,
        'eventosPorOrigem': eventosPorOrigem,
        'eventoMaisRecente': eventoMaisRecente,
        'dispositivosUnicos': eventosPorDispositivo.keys.length,
        'origensUnicas': eventosPorOrigem.keys.length,
        'estadosUnicos': eventosPorEstado.keys.length,
      };
      
    } catch (e) {
      print('Erro ao buscar estatísticas: $e');
      return {
        'totalEventos': 0,
        'eventosPorTipo': <String, int>{},
        'eventosPorDispositivo': <String, int>{},
        'eventosPorEstado': <String, int>{},
        'eventosPorOrigem': <String, int>{},
        'eventoMaisRecente': null,
        'dispositivosUnicos': 0,
        'origensUnicas': 0,
        'estadosUnicos': 0,
      };
    }
  }

  // ============================================================================
  // FUNÇÃO AUXILIAR PARA CONVERTER VALORES PARA INT
  // ============================================================================
  
  static int _parseToInt(dynamic value) {
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
  
  // ============================================================================
  // FUNÇÃO AUXILIAR PARA CONVERTER VALORES PARA STRING
  // ============================================================================
  
  static String _parseToString(dynamic value) {
    if (value == null) return '';
    return value.toString();
  }
  
  // ============================================================================
  // EXPORTAR EVENTOS PARA JSON
  // ============================================================================
  
  static Future<void> exportarEventosParaJSON([List<dynamic>? eventos]) async {
    try {
      eventos ??= await _buscarEventos();
      
      final jsonString = jsonEncode({
        'eventos': eventos,
        'exportadoEm': DateTime.now().toIso8601String(),
        'total': eventos.length,
        'fonte': 'Firebase Realtime Database',
        'caminho': 'MIR/Eventos',
      });
      
      final bytes = Uint8List.fromList(utf8.encode(jsonString));
      final fileName = 'eventos_realtime_${DateTime.now().millisecondsSinceEpoch}.json';
      
      await _exportFile(bytes, fileName, 'application/json');
      
    } catch (e) {
      throw Exception('Erro ao exportar JSON: $e');
    }
  }
  
  // ============================================================================
  // EXPORTAR EVENTOS PARA CSV
  // ============================================================================
  
  static Future<void> exportarEventosParaCSV([List<dynamic>? eventos]) async {
    try {
      eventos ??= await _buscarEventos();
      
      String csvString = 'ID,Data,Dispositivo,Estado,NumeroRele,Origem,PinoEntrada,Timestamp\n';
      
      for (var evento in eventos) {
        csvString += '${evento['id'] ?? ''},'
                    '"${evento['data'] ?? ''}",'
                    '"${evento['dispositivo'] ?? ''}",'
                    '${evento['estado'] ?? ''},'
                    '${evento['numeroRele'] ?? ''},'
                    '${evento['origem'] ?? ''},'
                    '${evento['pinoEntrada'] ?? ''},'
                    '${evento['timestamp'] ?? ''}\n';
      }
      
      final bytes = Uint8List.fromList(utf8.encode(csvString));
      final fileName = 'eventos_realtime_${DateTime.now().millisecondsSinceEpoch}.csv';
      
      await _exportFile(bytes, fileName, 'text/csv');
      
    } catch (e) {
      throw Exception('Erro ao exportar CSV: $e');
    }
  }
  
  // ============================================================================
  // EXPORTAR EVENTOS POR PERÍODO
  // ============================================================================
  
  static Future<void> exportarEventosPorPeriodo(
    DateTime dataInicio,
    DateTime dataFim, {
    String formato = 'json',
  }) async {
    try {
      final eventos = await _buscarEventosPorPeriodo(dataInicio, dataFim);
      
      if (formato.toLowerCase() == 'csv') {
        await exportarEventosParaCSV(eventos);
      } else {
        await exportarEventosParaJSON(eventos);
      }
      
    } catch (e) {
      throw Exception('Erro ao exportar por período: $e');
    }
  }
  
  // ============================================================================
  // EXPORTAR EVENTOS POR DISPOSITIVO
  // ============================================================================
  
  static Future<void> exportarEventosPorDispositivo(
    String dispositivoId, {
    String formato = 'json',
  }) async {
    try {
      final eventos = await _buscarEventosPorDispositivo(dispositivoId);
      
      if (formato.toLowerCase() == 'csv') {
        await exportarEventosParaCSV(eventos);
      } else {
        await exportarEventosParaJSON(eventos);
      }
      
    } catch (e) {
      throw Exception('Erro ao exportar por dispositivo: $e');
    }
  }

  // ============================================================================
  // BUSCAR TODOS OS EVENTOS DO REALTIME DATABASE
  // ============================================================================
  
  static Future<List<dynamic>> _buscarEventos() async {
    try {
      final DatabaseEvent event = await _eventosRef.orderByChild('timestamp').once();
      
      if (!event.snapshot.exists) {
        return [];
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final List<dynamic> eventos = [];
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final timestamp = _parseToInt(evento['timestamp']);
          
          eventos.add({
            'id': key.toString(),
            'data': DateTime.fromMillisecondsSinceEpoch(timestamp).toIso8601String(),
            'dispositivo': _parseToString(evento['dispositivoId']),
            'estado': _parseToString(evento['estado']),
            'numeroRele': _parseToInt(evento['numeroRele']),
            'origem': _parseToString(evento['origem']),
            'pinoEntrada': _parseToInt(evento['pinoEntrada']),
            'timestamp': timestamp,
          });
        }
      });
      
      // Ordenar por timestamp (mais recente primeiro)
      eventos.sort((a, b) => (b['timestamp'] ?? 0).compareTo(a['timestamp'] ?? 0));
      
      return eventos;
      
    } catch (e) {
      print('Erro ao buscar eventos: $e');
      return [];
    }
  }
  
  // ============================================================================
  // BUSCAR EVENTOS POR PERÍODO
  // ============================================================================
  
  static Future<List<dynamic>> _buscarEventosPorPeriodo(
    DateTime inicio, 
    DateTime fim,
  ) async {
    try {
      final timestampInicio = inicio.millisecondsSinceEpoch;
      final timestampFim = fim.millisecondsSinceEpoch;
      
      final DatabaseEvent event = await _eventosRef
          .orderByChild('timestamp')
          .startAt(timestampInicio)
          .endAt(timestampFim)
          .once();
      
      if (!event.snapshot.exists) {
        return [];
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final List<dynamic> eventos = [];
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final timestamp = _parseToInt(evento['timestamp']);
          
          eventos.add({
            'id': key.toString(),
            'data': DateTime.fromMillisecondsSinceEpoch(timestamp).toIso8601String(),
            'dispositivo': _parseToString(evento['dispositivoId']),
            'estado': _parseToString(evento['estado']),
            'numeroRele': _parseToInt(evento['numeroRele']),
            'origem': _parseToString(evento['origem']),
            'pinoEntrada': _parseToInt(evento['pinoEntrada']),
            'timestamp': timestamp,
          });
        }
      });
      
      // Ordenar por timestamp (mais recente primeiro)
      eventos.sort((a, b) => (b['timestamp'] ?? 0).compareTo(a['timestamp'] ?? 0));
      
      return eventos;
      
    } catch (e) {
      print('Erro ao buscar eventos por período: $e');
      return [];
    }
  }
  
  // ============================================================================
  // BUSCAR EVENTOS POR DISPOSITIVO
  // ============================================================================
  
  static Future<List<dynamic>> _buscarEventosPorDispositivo(String dispositivoId) async {
    try {
      final DatabaseEvent event = await _eventosRef
          .orderByChild('dispositivoId')
          .equalTo(dispositivoId)
          .once();
      
      if (!event.snapshot.exists) {
        return [];
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final List<dynamic> eventos = [];
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final timestamp = _parseToInt(evento['timestamp']);
          
          eventos.add({
            'id': key.toString(),
            'data': DateTime.fromMillisecondsSinceEpoch(timestamp).toIso8601String(),
            'dispositivo': _parseToString(evento['dispositivoId']),
            'estado': _parseToString(evento['estado']),
            'numeroRele': _parseToInt(evento['numeroRele']),
            'origem': _parseToString(evento['origem']),
            'pinoEntrada': _parseToInt(evento['pinoEntrada']),
            'timestamp': timestamp,
          });
        }
      });
      
      // Ordenar por timestamp (mais recente primeiro)
      eventos.sort((a, b) => (b['timestamp'] ?? 0).compareTo(a['timestamp'] ?? 0));
      
      return eventos;
      
    } catch (e) {
      print('Erro ao buscar eventos por dispositivo: $e');
      return [];
    }
  }

  // ============================================================================
  // BUSCAR LISTA DE DISPOSITIVOS ÚNICOS
  // ============================================================================
  
  static Future<List<String>> buscarDispositivos() async {
    try {
      final DatabaseEvent event = await _eventosRef.once();
      
      if (!event.snapshot.exists) {
        return [];
      }
      
      final Map<dynamic, dynamic> eventosData = event.snapshot.value as Map<dynamic, dynamic>;
      final Set<String> dispositivos = {};
      
      eventosData.forEach((key, value) {
        if (value is Map) {
          final evento = Map<String, dynamic>.from(value);
          final dispositivo = _parseToString(evento['dispositivoId']);
          if (dispositivo.isNotEmpty && dispositivo != 'N/A') {
            dispositivos.add(dispositivo);
          }
        }
      });
      
      final lista = dispositivos.toList();
      lista.sort();
      return lista;
      
    } catch (e) {
      print('Erro ao buscar dispositivos: $e');
      return [];
    }
  }

  // ============================================================================
  // MÉTODO PRINCIPAL PARA EXPORTAR ARQUIVOS
  // ============================================================================
  
  static Future<void> _exportFile(
    Uint8List bytes,
    String fileName,
    String mimeType,
  ) async {
    try {
      if (kIsWeb) {
        await _exportForWebAlternative(bytes, fileName, mimeType);
      } else {
        await _exportForMobile(bytes, fileName, mimeType);
      }
    } catch (e) {
      throw Exception('Erro ao exportar arquivo: $e');
    }
  }

  // ============================================================================
  // MÉTODO PARA WEB (sem dart:html)
  // ============================================================================
  
  static Future<void> _exportForWebAlternative(
    Uint8List bytes, 
    String fileName, 
    String mimeType,
  ) async {
    if (kIsWeb) {
      try {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(bytes);

        await Share.shareXFiles(
          [XFile(filePath)],
          text: 'Exportando $fileName',
        );
        
      } catch (e) {
        print('Exportação na web não disponível: $e');
        throw Exception('Exportação na web não disponível no momento');
      }
    }
  }

  // ============================================================================
  // MÉTODO PARA MOBILE (Android/iOS)
  // ============================================================================
  
  static Future<void> _exportForMobile(
    Uint8List bytes, 
    String fileName, 
    String mimeType,
  ) async {
    try {
      // 1. Solicitar permissão (Android)
      if (Platform.isAndroid) {
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
          if (!status.isGranted) {
            print('Permissão negada, tentando compartilhar mesmo assim...');
          }
        }
      }

      // 2. Criar arquivo temporário
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // 3. Compartilhar arquivo
      await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Exportando $fileName',
        subject: fileName,
      );

      // 4. Limpar arquivo temporário após 5 minutos
      Future.delayed(Duration(minutes: 5), () {
        try {
          if (file.existsSync()) {
            file.deleteSync();
          }
        } catch (e) {
          // Ignorar erros de limpeza
        }
      });

    } catch (e) {
      throw Exception('Erro ao exportar para mobile: $e');
    }
  }

  // ============================================================================
  // MÉTODO PÚBLICO GENÉRICO PARA EXPORTAR DADOS
  // ============================================================================
  
  static Future<void> exportData({
    required Uint8List bytes,
    required String fileName,
    String mimeType = 'application/octet-stream',
  }) async {
    await _exportFile(bytes, fileName, mimeType);
  }

  // ============================================================================
  // MÉTODO PARA SALVAR DIRETAMENTE NO DOWNLOADS (Android)
  // ============================================================================
  
  static Future<void> saveToDownloads({
    required Uint8List bytes,
    required String fileName,
  }) async {
    if (!Platform.isAndroid) {
      throw Exception('Este método só funciona no Android');
    }

    try {
      // Solicitar permissão
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        status = await Permission.storage.request();
        if (!status.isGranted) {
          throw Exception('Permissão de armazenamento negada');
        }
      }

      // Salvar no Downloads
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (!downloadsDir.existsSync()) {
        downloadsDir.createSync(recursive: true);
      }

      final filePath = '${downloadsDir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      print('✅ Arquivo salvo em: $filePath');
      
    } catch (e) {
      throw Exception('Erro ao salvar no Downloads: $e');
    }
  }
}