import 'dart:convert';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'evento_model.dart';

class ExportEventosService {
  static Future<void> exportarEventosParaJSON() async {
    try {
      // Buscar todos os eventos do Firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .orderBy('timestamp', descending: false)
          .get();

      // Converter para lista de EventoModel
      final List<EventoModel> eventos = snapshot.docs
          .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      // Converter para JSON
      final List<Map<String, dynamic>> eventosJson = eventos
          .map((evento) => {
                'id': evento.id,
                'dispositivoId': evento.dispositivoId,
                'estado': evento.estado,
                'numeroRele': evento.numeroRele,
                'origem': evento.origem,
                'pinoEntrada': evento.pinoEntrada,
                'timestamp': evento.timestamp,
              })
          .toList();

      final String jsonString = const JsonEncoder.withIndent('  ').convert({
        'eventos': eventosJson,
        'totalEventos': eventos.length,
        'exportadoEm': DateTime.now().toIso8601String(),
      });

      // Download do arquivo
      _downloadFile(jsonString, 'eventos_export.json', 'application/json');
    } catch (e) {
      print('Erro ao exportar eventos: $e');
      throw Exception('Erro ao exportar eventos: $e');
    }
  }

  static Future<void> exportarEventosParaCSV() async {
    try {
      // Buscar todos os eventos do Firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .orderBy('timestamp', descending: false)
          .get();

      // Converter para lista de EventoModel
      final List<EventoModel> eventos = snapshot.docs
          .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      // Criar CSV
      final StringBuffer csv = StringBuffer();
      
      // Cabeçalho do CSV
      csv.writeln('ID,Dispositivo ID,Estado,Numero Role,Origem,Pino Entrada,Timestamp');
      
      // Dados dos eventos
      for (final evento in eventos) {
        csv.writeln('${evento.id},${evento.dispositivoId},${evento.estado},${evento.numeroRele},${evento.origem},${evento.pinoEntrada},${evento.timestamp}');
      }

      // Download do arquivo
      _downloadFile(csv.toString(), 'eventos_export.csv', 'text/csv');
    } catch (e) {
      print('Erro ao exportar eventos para CSV: $e');
      throw Exception('Erro ao exportar eventos para CSV: $e');
    }
  }

  static Future<void> exportarEventosPorPeriodo({
    required DateTime dataInicio,
    required DateTime dataFim,
    required String formato, // 'json' ou 'csv'
  }) async {
    try {
      // Buscar eventos por período
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .where('timestamp', isGreaterThanOrEqualTo: dataInicio.toIso8601String())
          .where('timestamp', isLessThanOrEqualTo: dataFim.toIso8601String())
          .orderBy('timestamp', descending: false)
          .get();

      final List<EventoModel> eventos = snapshot.docs
          .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      if (eventos.isEmpty) {
        throw Exception('Nenhum evento encontrado no período selecionado');
      }

      final String dataInicioStr = _formatarDataParaArquivo(dataInicio);
      final String dataFimStr = _formatarDataParaArquivo(dataFim);

      if (formato.toLowerCase() == 'json') {
        final List<Map<String, dynamic>> eventosJson = eventos
            .map((evento) => {
                  'id': evento.id,
                  'dispositivoId': evento.dispositivoId,
                  'estado': evento.estado,
                  'numeroRele': evento.numeroRele,
                  'origem': evento.origem,
                  'pinoEntrada': evento.pinoEntrada,
                  'timestamp': evento.timestamp,
                })
            .toList();

        final String jsonString = const JsonEncoder.withIndent('  ').convert({
          'eventos': eventosJson,
          'totalEventos': eventos.length,
          'periodoInicio': dataInicio.toIso8601String(),
          'periodoFim': dataFim.toIso8601String(),
          'exportadoEm': DateTime.now().toIso8601String(),
        });

        _downloadFile(jsonString, 'eventos_${dataInicioStr}_${dataFimStr}.json', 'application/json');
      } else {
        final StringBuffer csv = StringBuffer();
        csv.writeln('ID,Dispositivo ID,Estado,Numero Role,Origem,Pino Entrada,Timestamp');
        
        for (final evento in eventos) {
          csv.writeln('${evento.id},${evento.dispositivoId},${evento.estado},${evento.numeroRele},${evento.origem},${evento.pinoEntrada},${evento.timestamp}');
        }

        _downloadFile(csv.toString(), 'eventos_${dataInicioStr}_${dataFimStr}.csv', 'text/csv');
      }
    } catch (e) {
      print('Erro ao exportar eventos por período: $e');
      throw Exception('Erro ao exportar eventos por período: $e');
    }
  }

  static Future<void> exportarEventosPorDispositivo({
    required String dispositivoId,
    required String formato, // 'json' ou 'csv'
  }) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .where('dispositivoId', isEqualTo: dispositivoId)
          .orderBy('timestamp', descending: false)
          .get();

      final List<EventoModel> eventos = snapshot.docs
          .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      if (eventos.isEmpty) {
        throw Exception('Nenhum evento encontrado para o dispositivo $dispositivoId');
      }

      if (formato.toLowerCase() == 'json') {
        final List<Map<String, dynamic>> eventosJson = eventos
            .map((evento) => {
                  'id': evento.id,
                  'dispositivoId': evento.dispositivoId,
                  'estado': evento.estado,
                  'numeroRele': evento.numeroRele,
                  'origem': evento.origem,
                  'pinoEntrada': evento.pinoEntrada,
                  'timestamp': evento.timestamp,
                })
            .toList();

        final String jsonString = const JsonEncoder.withIndent('  ').convert({
          'eventos': eventosJson,
          'totalEventos': eventos.length,
          'dispositivoId': dispositivoId,
          'exportadoEm': DateTime.now().toIso8601String(),
        });

        _downloadFile(jsonString, 'eventos_dispositivo_${dispositivoId}.json', 'application/json');
      } else {
        final StringBuffer csv = StringBuffer();
        csv.writeln('ID,Dispositivo ID,Estado,Numero Role,Origem,Pino Entrada,Timestamp');
        
        for (final evento in eventos) {
          csv.writeln('${evento.id},${evento.dispositivoId},${evento.estado},${evento.numeroRele},${evento.origem},${evento.pinoEntrada},${evento.timestamp}');
        }

        _downloadFile(csv.toString(), 'eventos_dispositivo_${dispositivoId}.csv', 'text/csv');
      }
    } catch (e) {
      print('Erro ao exportar eventos por dispositivo: $e');
      throw Exception('Erro ao exportar eventos por dispositivo: $e');
    }
  }

  static Future<Map<String, dynamic>> getEstatisticasEventos() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('eventos')
          .get();

      final List<EventoModel> eventos = snapshot.docs
          .map((doc) => EventoModel.fromFirestore(doc.id, doc.data() as Map<String, dynamic>))
          .toList();

      // Estatísticas gerais
      final Map<String, int> estadoCount = {};
      final Map<String, int> origemCount = {};
      final Map<String, int> dispositivoCount = {};

      for (final evento in eventos) {
        // Contar por estado
        estadoCount[evento.estado] = (estadoCount[evento.estado] ?? 0) + 1;
        
        // Contar por origem
        origemCount[evento.origem] = (origemCount[evento.origem] ?? 0) + 1;
        
        // Contar por dispositivo
        dispositivoCount[evento.dispositivoId] = (dispositivoCount[evento.dispositivoId] ?? 0) + 1;
      }

      // Evento mais recente - com tratamento de erro para datas
      EventoModel? eventoMaisRecente;
      if (eventos.isNotEmpty) {
        try {
          eventoMaisRecente = eventos.reduce((a, b) {
            try {
              final dateA = _parseTimestamp(a.timestamp);
              final dateB = _parseTimestamp(b.timestamp);
              return dateA.isAfter(dateB) ? a : b;
            } catch (e) {
              // Se não conseguir parsear as datas, retorna o primeiro
              return a;
            }
          });
        } catch (e) {
          // Se der erro, pega o primeiro evento
          eventoMaisRecente = eventos.first;
        }
      }

      return {
        'totalEventos': eventos.length,
        'eventosPorEstado': estadoCount,
        'eventosPorOrigem': origemCount,
        'eventosPorDispositivo': dispositivoCount,
        'eventoMaisRecente': eventoMaisRecente?.toMap(),
        'dispositivosUnicos': dispositivoCount.keys.length,
        'origensUnicas': origemCount.keys.length,
        'estadosUnicos': estadoCount.keys.length,
      };
    } catch (e) {
      print('Erro ao obter estatísticas: $e');
      throw Exception('Erro ao obter estatísticas: $e');
    }
  }

  // Função auxiliar para parsear timestamp com diferentes formatos
  static DateTime _parseTimestamp(String timestamp) {
    if (timestamp.isEmpty) return DateTime.now();
    
    try {
      // Tenta formato ISO primeiro
      return DateTime.parse(timestamp);
    } catch (e) {
      try {
        // Tenta formato brasileiro DD/MM/YYYY HH:MM:SS
        if (timestamp.contains('/')) {
          final parts = timestamp.split(' ');
          if (parts.length >= 2) {
            final dateParts = parts[0].split('/');
            final timeParts = parts[1].split(':');
            
            if (dateParts.length == 3 && timeParts.length >= 2) {
              final day = int.parse(dateParts[0]);
              final month = int.parse(dateParts[1]);
              final year = int.parse(dateParts[2]);
              final hour = int.parse(timeParts[0]);
              final minute = int.parse(timeParts[1]);
              final second = timeParts.length > 2 ? int.parse(timeParts[2]) : 0;
              
              return DateTime(year, month, day, hour, minute, second);
            }
          }
        }
        
        // Tenta formato YYYY-MM-DD HH:MM
        if (timestamp.contains('-') && timestamp.contains(':')) {
          final parts = timestamp.split(' ');
          if (parts.length >= 2) {
            final dateParts = parts[0].split('-');
            final timeParts = parts[1].split(':');
            
            if (dateParts.length == 3 && timeParts.length >= 2) {
              final year = int.parse(dateParts[0]);
              final month = int.parse(dateParts[1]);
              final day = int.parse(dateParts[2]);
              final hour = int.parse(timeParts[0]);
              final minute = int.parse(timeParts[1]);
              
              return DateTime(year, month, day, hour, minute);
            }
          }
        }
        
        // Se não conseguir parsear, retorna data atual
        return DateTime.now();
      } catch (e) {
        return DateTime.now();
      }
    }
  }

  static String _formatarDataParaArquivo(DateTime data) {
    return '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
  }

  static void _downloadFile(String content, String filename, String mimeType) {
    if (kIsWeb) {
      // Para web
      final bytes = utf8.encode(content);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = filename;
      html.document.body!.children.add(anchor);
      anchor.click();
      html.document.body!.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    } else {
      // Para mobile/desktop seria necessário usar path_provider e outras dependências
      print('Download não suportado nesta plataforma');
    }
  }
}