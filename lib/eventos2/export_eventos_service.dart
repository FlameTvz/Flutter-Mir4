// ============================================================================
// ARQUIVO: lib/eventos2/export_eventos_service.dart - VERSÃO FINAL CORRIGIDA
// ============================================================================

import 'dart:typed_data';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExportEventosService {
  
  // ============================================================================
  // MÉTODO PARA BUSCAR ESTATÍSTICAS DE EVENTOS
  // ============================================================================
  
  static Future<Map<String, dynamic>> getEstatisticasEventos() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .get();
      
      final eventos = snapshot.docs;
      final Map<String, int> eventosPorTipo = {};
      final Map<String, int> eventosPorDispositivo = {};
      
      for (var doc in eventos) {
        final data = doc.data();
        final origem = data['origem']?.toString() ?? 'N/A';
        final dispositivo = data['dispositivoId']?.toString() ?? 'N/A';
        
        eventosPorTipo[origem] = (eventosPorTipo[origem] ?? 0) + 1;
        eventosPorDispositivo[dispositivo] = (eventosPorDispositivo[dispositivo] ?? 0) + 1;
      }
      
      return {
        'totalEventos': eventos.length,
        'eventosPorTipo': eventosPorTipo,
        'eventosPorDispositivo': eventosPorDispositivo,
        'eventosRecentes': eventos.take(10).map((doc) => {
          'id': doc.id,
          'timestamp': doc.data()['timestamp']?.toDate()?.toIso8601String(),
          'dispositivo': doc.data()['dispositivoId'],
          'estado': doc.data()['estado'],
        }).toList(),
      };
    } catch (e) {
      return {
        'totalEventos': 0,
        'eventosPorTipo': {},
        'eventosPorDispositivo': {},
        'eventosRecentes': [],
      };
    }
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
      });
      
      final bytes = Uint8List.fromList(utf8.encode(jsonString));
      final fileName = 'eventos_${DateTime.now().millisecondsSinceEpoch}.json';
      
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
      
      String csvString = 'ID,Data,Tipo,Descricao,Dispositivo,NumeroRele,Estado,Origem,PinoEntrada\n';
      
      for (var evento in eventos) {
        csvString += '${evento['id'] ?? ''},'
                    '${evento['data'] ?? ''},'
                    '${evento['tipo'] ?? ''},'
                    '"${evento['descricao'] ?? ''}",'
                    '${evento['dispositivo'] ?? ''},'
                    '${evento['numeroRele'] ?? ''},'
                    '${evento['estado'] ?? ''},'
                    '${evento['origem'] ?? ''},'
                    '${evento['pinoEntrada'] ?? ''}\n';
      }
      
      final bytes = Uint8List.fromList(utf8.encode(csvString));
      final fileName = 'eventos_${DateTime.now().millisecondsSinceEpoch}.csv';
      
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
  // EXPORTAR EVENTOS POR DISPOSITIVO (CORRIGIDO)
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
  // BUSCAR TODOS OS EVENTOS DO FIRESTORE
  // ============================================================================
  
  static Future<List<dynamic>> _buscarEventos() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .orderBy('timestamp', descending: true)
          .get();
      
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'data': data['timestamp']?.toDate()?.toIso8601String() ?? 
                 DateTime.now().toIso8601String(),
          'tipo': data['origem'] ?? 'N/A',
          'descricao': 'Evento ${data['numeroRele'] ?? 'N/A'} - ${data['estado'] ?? 'N/A'}',
          'dispositivo': data['dispositivoId'] ?? 'N/A',
          'numeroRele': data['numeroRele'] ?? 0,
          'estado': data['estado'] ?? 'N/A',
          'origem': data['origem'] ?? 'N/A',
          'pinoEntrada': data['pinoEntrada'] ?? -1,
        };
      }).toList();
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
      final snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(inicio))
          .where('timestamp', isLessThanOrEqualTo: Timestamp.fromDate(fim))
          .orderBy('timestamp', descending: true)
          .get();
      
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'data': data['timestamp']?.toDate()?.toIso8601String() ?? 
                 DateTime.now().toIso8601String(),
          'tipo': data['origem'] ?? 'N/A',
          'descricao': 'Evento ${data['numeroRele'] ?? 'N/A'} - ${data['estado'] ?? 'N/A'}',
          'dispositivo': data['dispositivoId'] ?? 'N/A',
          'numeroRele': data['numeroRele'] ?? 0,
          'estado': data['estado'] ?? 'N/A',
          'origem': data['origem'] ?? 'N/A',
          'pinoEntrada': data['pinoEntrada'] ?? -1,
        };
      }).toList();
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
      final snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .where('dispositivoId', isEqualTo: dispositivoId)
          .orderBy('timestamp', descending: true)
          .get();
      
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'data': data['timestamp']?.toDate()?.toIso8601String() ?? 
                 DateTime.now().toIso8601String(),
          'tipo': data['origem'] ?? 'N/A',
          'descricao': 'Evento ${data['numeroRele'] ?? 'N/A'} - ${data['estado'] ?? 'N/A'}',
          'dispositivo': data['dispositivoId'] ?? 'N/A',
          'numeroRele': data['numeroRele'] ?? 0,
          'estado': data['estado'] ?? 'N/A',
          'origem': data['origem'] ?? 'N/A',
          'pinoEntrada': data['pinoEntrada'] ?? -1,
        };
      }).toList();
    } catch (e) {
      print('Erro ao buscar eventos por dispositivo: $e');
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