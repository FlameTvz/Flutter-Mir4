class EventoModel {
  final String id;
  final String dispositivoId;
  final String estado;
  final int numeroRele;
  final String origem;
  final int pinoEntrada;
  final String timestamp;

  EventoModel({
    required this.id,
    required this.dispositivoId,
    required this.estado,
    required this.numeroRele,
    required this.origem,
    required this.pinoEntrada,
    required this.timestamp,
  });

  factory EventoModel.fromFirestore(String id, Map<String, dynamic> data) {
    return EventoModel(
      id: id,
      dispositivoId: data['dispositivoId'] ?? '',
      estado: data['estado'] ?? '',
      numeroRele: data['numeroRele'] ?? 0,
      origem: data['origem'] ?? '',
      pinoEntrada: data['pinoEntrada'] ?? 0,
      timestamp: data['timestamp'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dispositivoId': dispositivoId,
      'estado': estado,
      'numeroRele': numeroRele,
      'origem': origem,
      'pinoEntrada': pinoEntrada,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return 'EventoModel(id: $id, dispositivoId: $dispositivoId, estado: $estado, numeroRele: $numeroRele, origem: $origem, pinoEntrada: $pinoEntrada, timestamp: $timestamp)';
  }
}