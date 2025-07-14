import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _idsESP = prefs.getString('ff_idsESP') ?? _idsESP;
    });
    _safeInit(() {
      _StatusRele = prefs.getString('ff_StatusRele') ?? _StatusRele;
    });
    _safeInit(() {
      _isRelOn2 = prefs.getBool('ff_isRelOn2') ?? _isRelOn2;
    });
    _safeInit(() {
      _isReleOn3 = prefs.getBool('ff_isReleOn3') ?? _isReleOn3;
    });
    _safeInit(() {
      _isRele4 = prefs.getBool('ff_isRele4') ?? _isRele4;
    });
    _safeInit(() {
      _isRele5 = prefs.getBool('ff_isRele5') ?? _isRele5;
    });
    _safeInit(() {
      _espIndex = prefs.getInt('ff_espIndex') ?? _espIndex;
    });
    _safeInit(() {
      _allowESPsList =
          prefs.getStringList('ff_allowESPsList') ?? _allowESPsList;
    });
    _safeInit(() {
      _nomeRele = prefs.getString('ff_nomeRele') ?? _nomeRele;
    });
    _safeInit(() {
      _nomeRele2 = prefs.getString('ff_nomeRele2') ?? _nomeRele2;
    });
    _safeInit(() {
      _nomeRele3 = prefs.getString('ff_nomeRele3') ?? _nomeRele3;
    });
    _safeInit(() {
      _nomeRele4 = prefs.getString('ff_nomeRele4') ?? _nomeRele4;
    });
    _safeInit(() {
      _nomeRele5 = prefs.getString('ff_nomeRele5') ?? _nomeRele5;
    });
    _safeInit(() {
      _nomeEntrada1 = prefs.getString('ff_nomeEntrada1') ?? _nomeEntrada1;
    });
    _safeInit(() {
      _nomeEntrada2 = prefs.getString('ff_nomeEntrada2') ?? _nomeEntrada2;
    });
    _safeInit(() {
      _nomeEntrada3 = prefs.getString('ff_nomeEntrada3') ?? _nomeEntrada3;
    });
    _safeInit(() {
      _nomeEntrada4 = prefs.getString('ff_nomeEntrada4') ?? _nomeEntrada4;
    });
    _safeInit(() {
      _nomeEntrada5 = prefs.getString('ff_nomeEntrada5') ?? _nomeEntrada5;
    });
    _safeInit(() {
      _saida1 = prefs.getInt('ff_saida1') ?? _saida1;
    });
    _safeInit(() {
      _saida2 = prefs.getInt('ff_saida2') ?? _saida2;
    });
    _safeInit(() {
      _saida3 = prefs.getInt('ff_saida3') ?? _saida3;
    });
    _safeInit(() {
      _saida4 = prefs.getInt('ff_saida4') ?? _saida4;
    });
    _safeInit(() {
      _saida5 = prefs.getInt('ff_saida5') ?? _saida5;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _horaAtivacao = 'horaAtivacao';
  String get horaAtivacao => _horaAtivacao;
  set horaAtivacao(String value) {
    _horaAtivacao = value;
  }

  String _idsESP = '';
  String get idsESP => _idsESP;
  set idsESP(String value) {
    _idsESP = value;
    prefs.setString('ff_idsESP', value);
  }

  List<dynamic> _listaDeESPS = [];
  List<dynamic> get listaDeESPS => _listaDeESPS;
  set listaDeESPS(List<dynamic> value) {
    _listaDeESPS = value;
  }

  void addToListaDeESPS(dynamic value) {
    listaDeESPS.add(value);
  }

  void removeFromListaDeESPS(dynamic value) {
    listaDeESPS.remove(value);
  }

  void removeAtIndexFromListaDeESPS(int index) {
    listaDeESPS.removeAt(index);
  }

  void updateListaDeESPSAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listaDeESPS[index] = updateFn(_listaDeESPS[index]);
  }

  void insertAtIndexInListaDeESPS(int index, dynamic value) {
    listaDeESPS.insert(index, value);
  }

  String _StatusRele = '';
  String get StatusRele => _StatusRele;
  set StatusRele(String value) {
    _StatusRele = value;
    prefs.setString('ff_StatusRele', value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  String _emailId = '';
  String get emailId => _emailId;
  set emailId(String value) {
    _emailId = value;
  }

  String _ScanId = '';
  String get ScanId => _ScanId;
  set ScanId(String value) {
    _ScanId = value;
  }

  bool _isReleOn1 = false;
  bool get isReleOn1 => _isReleOn1;
  set isReleOn1(bool value) {
    _isReleOn1 = value;
  }

  bool _isRelOn2 = false;
  bool get isRelOn2 => _isRelOn2;
  set isRelOn2(bool value) {
    _isRelOn2 = value;
    prefs.setBool('ff_isRelOn2', value);
  }

  bool _isReleOn3 = false;
  bool get isReleOn3 => _isReleOn3;
  set isReleOn3(bool value) {
    _isReleOn3 = value;
    prefs.setBool('ff_isReleOn3', value);
  }

  bool _isRele4 = false;
  bool get isRele4 => _isRele4;
  set isRele4(bool value) {
    _isRele4 = value;
    prefs.setBool('ff_isRele4', value);
  }

  bool _isRele5 = false;
  bool get isRele5 => _isRele5;
  set isRele5(bool value) {
    _isRele5 = value;
    prefs.setBool('ff_isRele5', value);
  }

  int _espIndex = 0;
  int get espIndex => _espIndex;
  set espIndex(int value) {
    _espIndex = value;
    prefs.setInt('ff_espIndex', value);
  }

  int _indexAtual = 0;
  int get indexAtual => _indexAtual;
  set indexAtual(int value) {
    _indexAtual = value;
  }

  int _qualRele = 0;
  int get qualRele => _qualRele;
  set qualRele(int value) {
    _qualRele = value;
  }

  bool _confirmDelete = false;
  bool get confirmDelete => _confirmDelete;
  set confirmDelete(bool value) {
    _confirmDelete = value;
  }

  List<String> _allowESPsList = [];
  List<String> get allowESPsList => _allowESPsList;
  set allowESPsList(List<String> value) {
    _allowESPsList = value;
    prefs.setStringList('ff_allowESPsList', value);
  }

  void addToAllowESPsList(String value) {
    allowESPsList.add(value);
    prefs.setStringList('ff_allowESPsList', _allowESPsList);
  }

  void removeFromAllowESPsList(String value) {
    allowESPsList.remove(value);
    prefs.setStringList('ff_allowESPsList', _allowESPsList);
  }

  void removeAtIndexFromAllowESPsList(int index) {
    allowESPsList.removeAt(index);
    prefs.setStringList('ff_allowESPsList', _allowESPsList);
  }

  void updateAllowESPsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    allowESPsList[index] = updateFn(_allowESPsList[index]);
    prefs.setStringList('ff_allowESPsList', _allowESPsList);
  }

  void insertAtIndexInAllowESPsList(int index, String value) {
    allowESPsList.insert(index, value);
    prefs.setStringList('ff_allowESPsList', _allowESPsList);
  }

  String _testepegaresp = '';
  String get testepegaresp => _testepegaresp;
  set testepegaresp(String value) {
    _testepegaresp = value;
  }

  dynamic _bhjk;
  dynamic get bhjk => _bhjk;
  set bhjk(dynamic value) {
    _bhjk = value;
  }

  dynamic _espIndice;
  dynamic get espIndice => _espIndice;
  set espIndice(dynamic value) {
    _espIndice = value;
  }

  dynamic _verificarDoisESPs;
  dynamic get verificarDoisESPs => _verificarDoisESPs;
  set verificarDoisESPs(dynamic value) {
    _verificarDoisESPs = value;
  }

  dynamic _mudarNome;
  dynamic get mudarNome => _mudarNome;
  set mudarNome(dynamic value) {
    _mudarNome = value;
  }

  String _nomeRele = 'Rele 1';
  String get nomeRele => _nomeRele;
  set nomeRele(String value) {
    _nomeRele = value;
    prefs.setString('ff_nomeRele', value);
  }

  String _nomeRele2 = 'Rele 2';
  String get nomeRele2 => _nomeRele2;
  set nomeRele2(String value) {
    _nomeRele2 = value;
    prefs.setString('ff_nomeRele2', value);
  }

  String _nomeRele3 = 'Rele 3';
  String get nomeRele3 => _nomeRele3;
  set nomeRele3(String value) {
    _nomeRele3 = value;
    prefs.setString('ff_nomeRele3', value);
  }

  String _nomeRele4 = 'Rele 4';
  String get nomeRele4 => _nomeRele4;
  set nomeRele4(String value) {
    _nomeRele4 = value;
    prefs.setString('ff_nomeRele4', value);
  }

  String _nomeRele5 = 'Rele 5';
  String get nomeRele5 => _nomeRele5;
  set nomeRele5(String value) {
    _nomeRele5 = value;
    prefs.setString('ff_nomeRele5', value);
  }

  String _attpag = '';
  String get attpag => _attpag;
  set attpag(String value) {
    _attpag = value;
  }

  String _ReleStatus1 = '';
  String get ReleStatus1 => _ReleStatus1;
  set ReleStatus1(String value) {
    _ReleStatus1 = value;
  }

  bool _segunda = false;
  bool get segunda => _segunda;
  set segunda(bool value) {
    _segunda = value;
  }

  bool _terca = false;
  bool get terca => _terca;
  set terca(bool value) {
    _terca = value;
  }

  bool _quarta = false;
  bool get quarta => _quarta;
  set quarta(bool value) {
    _quarta = value;
  }

  bool _quinta = false;
  bool get quinta => _quinta;
  set quinta(bool value) {
    _quinta = value;
  }

  bool _sexta = false;
  bool get sexta => _sexta;
  set sexta(bool value) {
    _sexta = value;
  }

  bool _sabado = false;
  bool get sabado => _sabado;
  set sabado(bool value) {
    _sabado = value;
  }

  bool _domingo = false;
  bool get domingo => _domingo;
  set domingo(bool value) {
    _domingo = value;
  }

  List<String> _dias = [
    'segunda',
    'terca',
    'quarta',
    'quinta',
    'sexta',
    'sabado',
    'domingo'
  ];
  List<String> get dias => _dias;
  set dias(List<String> value) {
    _dias = value;
  }

  void addToDias(String value) {
    dias.add(value);
  }

  void removeFromDias(String value) {
    dias.remove(value);
  }

  void removeAtIndexFromDias(int index) {
    dias.removeAt(index);
  }

  void updateDiasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dias[index] = updateFn(_dias[index]);
  }

  void insertAtIndexInDias(int index, String value) {
    dias.insert(index, value);
  }

  bool _TempSucesso = false;
  bool get TempSucesso => _TempSucesso;
  set TempSucesso(bool value) {
    _TempSucesso = value;
  }

  dynamic _listaEntrada;
  dynamic get listaEntrada => _listaEntrada;
  set listaEntrada(dynamic value) {
    _listaEntrada = value;
  }

  String _nomeEntrada1 = '';
  String get nomeEntrada1 => _nomeEntrada1;
  set nomeEntrada1(String value) {
    _nomeEntrada1 = value;
    prefs.setString('ff_nomeEntrada1', value);
  }

  String _nomeEntrada2 = '';
  String get nomeEntrada2 => _nomeEntrada2;
  set nomeEntrada2(String value) {
    _nomeEntrada2 = value;
    prefs.setString('ff_nomeEntrada2', value);
  }

  String _nomeEntrada3 = '';
  String get nomeEntrada3 => _nomeEntrada3;
  set nomeEntrada3(String value) {
    _nomeEntrada3 = value;
    prefs.setString('ff_nomeEntrada3', value);
  }

  String _nomeEntrada4 = '';
  String get nomeEntrada4 => _nomeEntrada4;
  set nomeEntrada4(String value) {
    _nomeEntrada4 = value;
    prefs.setString('ff_nomeEntrada4', value);
  }

  String _nomeEntrada5 = '';
  String get nomeEntrada5 => _nomeEntrada5;
  set nomeEntrada5(String value) {
    _nomeEntrada5 = value;
    prefs.setString('ff_nomeEntrada5', value);
  }

  bool _entrada0On = false;
  bool get entrada0On => _entrada0On;
  set entrada0On(bool value) {
    _entrada0On = value;
  }

  bool _entrada1on = false;
  bool get entrada1on => _entrada1on;
  set entrada1on(bool value) {
    _entrada1on = value;
  }

  bool _entrada2on = false;
  bool get entrada2on => _entrada2on;
  set entrada2on(bool value) {
    _entrada2on = value;
  }

  bool _entrada3on = false;
  bool get entrada3on => _entrada3on;
  set entrada3on(bool value) {
    _entrada3on = value;
  }

  bool _entrada4on = false;
  bool get entrada4on => _entrada4on;
  set entrada4on(bool value) {
    _entrada4on = value;
  }

  bool _entrada11 = false;
  bool get entrada11 => _entrada11;
  set entrada11(bool value) {
    _entrada11 = value;
  }

  bool _entrada12 = false;
  bool get entrada12 => _entrada12;
  set entrada12(bool value) {
    _entrada12 = value;
  }

  bool _entrada10 = false;
  bool get entrada10 => _entrada10;
  set entrada10(bool value) {
    _entrada10 = value;
  }

  bool _entrada13 = false;
  bool get entrada13 => _entrada13;
  set entrada13(bool value) {
    _entrada13 = value;
  }

  bool _entrada14 = false;
  bool get entrada14 => _entrada14;
  set entrada14(bool value) {
    _entrada14 = value;
  }

  bool _entrada20 = false;
  bool get entrada20 => _entrada20;
  set entrada20(bool value) {
    _entrada20 = value;
  }

  bool _entrada21 = false;
  bool get entrada21 => _entrada21;
  set entrada21(bool value) {
    _entrada21 = value;
  }

  bool _entrada23 = false;
  bool get entrada23 => _entrada23;
  set entrada23(bool value) {
    _entrada23 = value;
  }

  bool _entrada24 = false;
  bool get entrada24 => _entrada24;
  set entrada24(bool value) {
    _entrada24 = value;
  }

  bool _entrada22 = false;
  bool get entrada22 => _entrada22;
  set entrada22(bool value) {
    _entrada22 = value;
  }

  bool _entrada30 = false;
  bool get entrada30 => _entrada30;
  set entrada30(bool value) {
    _entrada30 = value;
  }

  bool _entrada31 = false;
  bool get entrada31 => _entrada31;
  set entrada31(bool value) {
    _entrada31 = value;
  }

  bool _entrada32 = false;
  bool get entrada32 => _entrada32;
  set entrada32(bool value) {
    _entrada32 = value;
  }

  bool _entrada33 = false;
  bool get entrada33 => _entrada33;
  set entrada33(bool value) {
    _entrada33 = value;
  }

  bool _entrada34 = false;
  bool get entrada34 => _entrada34;
  set entrada34(bool value) {
    _entrada34 = value;
  }

  bool _entrada40 = false;
  bool get entrada40 => _entrada40;
  set entrada40(bool value) {
    _entrada40 = value;
  }

  bool _entrada41 = false;
  bool get entrada41 => _entrada41;
  set entrada41(bool value) {
    _entrada41 = value;
  }

  bool _entrada42 = false;
  bool get entrada42 => _entrada42;
  set entrada42(bool value) {
    _entrada42 = value;
  }

  bool _entrada43 = false;
  bool get entrada43 => _entrada43;
  set entrada43(bool value) {
    _entrada43 = value;
  }

  bool _entrada44 = false;
  bool get entrada44 => _entrada44;
  set entrada44(bool value) {
    _entrada44 = value;
  }

  dynamic _listaProg;
  dynamic get listaProg => _listaProg;
  set listaProg(dynamic value) {
    _listaProg = value;
  }

  List<int> _selectSaida = [];
  List<int> get selectSaida => _selectSaida;
  set selectSaida(List<int> value) {
    _selectSaida = value;
  }

  void addToSelectSaida(int value) {
    selectSaida.add(value);
  }

  void removeFromSelectSaida(int value) {
    selectSaida.remove(value);
  }

  void removeAtIndexFromSelectSaida(int index) {
    selectSaida.removeAt(index);
  }

  void updateSelectSaidaAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    selectSaida[index] = updateFn(_selectSaida[index]);
  }

  void insertAtIndexInSelectSaida(int index, int value) {
    selectSaida.insert(index, value);
  }

  int _saida1 = 1;
  int get saida1 => _saida1;
  set saida1(int value) {
    _saida1 = value;
    prefs.setInt('ff_saida1', value);
  }

  int _saida2 = 2;
  int get saida2 => _saida2;
  set saida2(int value) {
    _saida2 = value;
    prefs.setInt('ff_saida2', value);
  }

  int _saida3 = 3;
  int get saida3 => _saida3;
  set saida3(int value) {
    _saida3 = value;
    prefs.setInt('ff_saida3', value);
  }

  int _saida4 = 4;
  int get saida4 => _saida4;
  set saida4(int value) {
    _saida4 = value;
    prefs.setInt('ff_saida4', value);
  }

  /// oii
  int _saida5 = 5;
  int get saida5 => _saida5;
  set saida5(int value) {
    _saida5 = value;
    prefs.setInt('ff_saida5', value);
  }

  List<String> _listaEntradaAPI = [];
  List<String> get listaEntradaAPI => _listaEntradaAPI;
  set listaEntradaAPI(List<String> value) {
    _listaEntradaAPI = value;
  }

  void addToListaEntradaAPI(String value) {
    listaEntradaAPI.add(value);
  }

  void removeFromListaEntradaAPI(String value) {
    listaEntradaAPI.remove(value);
  }

  void removeAtIndexFromListaEntradaAPI(int index) {
    listaEntradaAPI.removeAt(index);
  }

  void updateListaEntradaAPIAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaEntradaAPI[index] = updateFn(_listaEntradaAPI[index]);
  }

  void insertAtIndexInListaEntradaAPI(int index, String value) {
    listaEntradaAPI.insert(index, value);
  }

  String _tokenfcm = '';
  String get tokenfcm => _tokenfcm;
  set tokenfcm(String value) {
    _tokenfcm = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
