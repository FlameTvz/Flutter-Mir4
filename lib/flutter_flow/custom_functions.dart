import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

String? convertAndCompare(int? response) {
  if (response == 0) {
    return "Manter Ligado";
  } else if (response == 1) {
    return "Pulso";
  } else {
    return "Desligar ao Soltar";
  }
}

bool verificarESPJaExiste(
  dynamic lista,
  String? id,
) {
  if (lista == null || id == null) {
    return false;
  }

  try {
    // Verificar se lista é realmente uma lista
    if (lista is! List) {
      return false;
    }

    // Verificar se existe um item com o ID correspondente
    for (var item in lista) {
      if (item is Map &&
          item.containsKey('id') &&
          item['id'].toString() == id.toString()) {
        return true;
      }
    }

    // Se chegou aqui, não encontrou o item
    return false;
  } catch (e) {
    // Em caso de erro, retornar false em vez de null
    print('Erro ao verificar ESP: $e');
    return false;
  }
}

bool isValidTime(String input) {
  final regex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$');
  return regex.hasMatch(input);
}

String formatSaidasList(List<int> saidas) {
  return saidas.join(',');
}

List<String> getTopLevelKeys(String jsonString) {
  try {
    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return decoded.keys.toList();
  } catch (e) {
    return [];
  }
}
