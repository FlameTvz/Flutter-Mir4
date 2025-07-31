import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Rele One Group Code

class ReleOneGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/';
  static Map<String, String> headers = {};
  static ReleOnCall releOnCall = ReleOnCall();
  static ReleOffCall releOffCall = ReleOffCall();
  static SwitchCall switchCall = SwitchCall();
  static SwitchOffCall switchOffCall = SwitchOffCall();
  static HoraAtivacaoCall horaAtivacaoCall = HoraAtivacaoCall();
  static HoraDesativacaoCall horaDesativacaoCall = HoraDesativacaoCall();
  static TempoPulsoCall tempoPulsoCall = TempoPulsoCall();
  static TempoDebouncingCall tempoDebouncingCall = TempoDebouncingCall();
  static ModoAcionamentoCall modoAcionamentoCall = ModoAcionamentoCall();
  static ModoAcionamentoDoisCall modoAcionamentoDoisCall =
      ModoAcionamentoDoisCall();
  static ModoAcionamentotresCall modoAcionamentotresCall =
      ModoAcionamentotresCall();
  static PegarStatusCall pegarStatusCall = PegarStatusCall();
  static PegarHoraAtivacaoCall pegarHoraAtivacaoCall = PegarHoraAtivacaoCall();
  static PegarHoraDesativacaoCall pegarHoraDesativacaoCall =
      PegarHoraDesativacaoCall();
  static PegarModoCall pegarModoCall = PegarModoCall();
  static MudarNomeRELECall mudarNomeRELECall = MudarNomeRELECall();
  static PegarNomeReleCall pegarNomeReleCall = PegarNomeReleCall();
}

class ReleOnCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele on',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleOffCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele off',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tipoBotao": "switch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchOffCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tipoBotao": "Desativado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch off',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hora Ativacao',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HoraDesativacao',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoPulsoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoPulso": ${tempoPulso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoPulso',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoDebouncingCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoDebouncing": ${tempoDebouncing}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoDebouncing',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamentoDois',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentotresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamentotres',
      apiUrl: '${baseUrl}/rele1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarStatusCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarStatus',
      apiUrl: '${baseUrl}/rele1/status.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraAtivacaoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraAtivacao',
      apiUrl: '${baseUrl}/rele1/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraDesativacaoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraDesativacao',
      apiUrl: '${baseUrl}/rele1/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarModoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarModo',
      apiUrl: '${baseUrl}/rele1/modoAcionamento.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudarNomeRELECall {
  Future<ApiCallResponse> call({
    String? nomeRele = '',
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    final ffApiRequestBody = '''
{
"nome": "${escapeStringForJson(nomeRele)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mudarNomeRELE',
      apiUrl: '${baseUrl}/rele1/nome.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarNomeReleCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? horarioAtivacao4 = '',
    String? token = '',
  }) async {
    final baseUrl = ReleOneGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      horarioAtivacao4: horarioAtivacao4,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegar nome rele',
      apiUrl: '${baseUrl}/rele1/nome?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Rele One Group Code

/// Start Rele Two Group Code

class ReleTwoGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/';
  static Map<String, String> headers = {};
  static ReleOnCopyCall releOnCopyCall = ReleOnCopyCall();
  static ReleOffCopyCall releOffCopyCall = ReleOffCopyCall();
  static SwitchCopyCall switchCopyCall = SwitchCopyCall();
  static SwitchOffCopyCall switchOffCopyCall = SwitchOffCopyCall();
  static HoraAtivacaoCopyCall horaAtivacaoCopyCall = HoraAtivacaoCopyCall();
  static HoraDesativacaoCopyCall horaDesativacaoCopyCall =
      HoraDesativacaoCopyCall();
  static TempoPulsoCopyCall tempoPulsoCopyCall = TempoPulsoCopyCall();
  static TempoDebouncingCopyCall tempoDebouncingCopyCall =
      TempoDebouncingCopyCall();
  static ModoAcionamentoCopyCall modoAcionamentoCopyCall =
      ModoAcionamentoCopyCall();
  static ModoAcionamentoCopyDoisCall modoAcionamentoCopyDoisCall =
      ModoAcionamentoCopyDoisCall();
  static ModoAcionamentoCopyTresCall modoAcionamentoCopyTresCall =
      ModoAcionamentoCopyTresCall();
  static PegarStatusDoisCall pegarStatusDoisCall = PegarStatusDoisCall();
  static PegarHoraAtivacaoDoisCall pegarHoraAtivacaoDoisCall =
      PegarHoraAtivacaoDoisCall();
  static PegarHoraDesativacaoDoisCall pegarHoraDesativacaoDoisCall =
      PegarHoraDesativacaoDoisCall();
  static PegarModoDoisCall pegarModoDoisCall = PegarModoDoisCall();
  static MudarNomeReleCall mudarNomeReleCall = MudarNomeReleCall();
}

class ReleOnCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele on Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleOffCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele off Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tipoBotao": "switch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchOffCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tipoBotao": "Desativado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch off Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hora Ativacao Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HoraDesativacao Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoPulsoCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoPulso": ${tempoPulso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoPulso Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoDebouncingCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoDebouncing": ${tempoDebouncing}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoDebouncing Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Dois',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Tres',
      apiUrl: '${baseUrl}/rele2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarStatusDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarStatusDois',
      apiUrl: '${baseUrl}/rele2/status.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraAtivacaoDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraAtivacao Dois',
      apiUrl: '${baseUrl}/rele2/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraDesativacaoDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraDesativacao Dois',
      apiUrl: '${baseUrl}/rele2/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarModoDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarModoDois',
      apiUrl: '${baseUrl}/rele2/modoAcionamento.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudarNomeReleCall {
  Future<ApiCallResponse> call({
    String? nomeRele2 = '',
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleTwoGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"nome": "${escapeStringForJson(nomeRele2)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mudarNomeRele',
      apiUrl: '${baseUrl}/rele2/nome.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Rele Two Group Code

/// Start Rele Three Group Code

class ReleThreeGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/';
  static Map<String, String> headers = {};
  static ReleOnCopyCopyCall releOnCopyCopyCall = ReleOnCopyCopyCall();
  static ReleOffCopyCopyCall releOffCopyCopyCall = ReleOffCopyCopyCall();
  static SwitchCopyCopyCall switchCopyCopyCall = SwitchCopyCopyCall();
  static SwitchOffCopyCopyCall switchOffCopyCopyCall = SwitchOffCopyCopyCall();
  static HoraAtivacaoCopyCopyCall horaAtivacaoCopyCopyCall =
      HoraAtivacaoCopyCopyCall();
  static HoraDesativacaoCopyCopyCall horaDesativacaoCopyCopyCall =
      HoraDesativacaoCopyCopyCall();
  static TempoPulsoCopyCopyCall tempoPulsoCopyCopyCall =
      TempoPulsoCopyCopyCall();
  static TempoDebouncingCopyCopyCall tempoDebouncingCopyCopyCall =
      TempoDebouncingCopyCopyCall();
  static ModoAcionamentoCopyCopyCall modoAcionamentoCopyCopyCall =
      ModoAcionamentoCopyCopyCall();
  static ModoAcionamentoCopyCopyDoisCall modoAcionamentoCopyCopyDoisCall =
      ModoAcionamentoCopyCopyDoisCall();
  static ModoAcionamentoCopyCopyTresCall modoAcionamentoCopyCopyTresCall =
      ModoAcionamentoCopyCopyTresCall();
  static PegarStatusTresCall pegarStatusTresCall = PegarStatusTresCall();
  static PegarHoraAtivacaoTresCall pegarHoraAtivacaoTresCall =
      PegarHoraAtivacaoTresCall();
  static PegarHoraDesativacaoTresCall pegarHoraDesativacaoTresCall =
      PegarHoraDesativacaoTresCall();
  static PegarModoTresCall pegarModoTresCall = PegarModoTresCall();
  static MudarNomeCall mudarNomeCall = MudarNomeCall();
}

class ReleOnCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele on Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele off Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tipoBotao": "switch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tipoBotao": "Desativado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch off Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hora Ativacao Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HoraDesativacao Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoPulsoCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoPulso": ${tempoPulso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoPulso Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoDebouncingCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoDebouncing": ${tempoDebouncing}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoDebouncing Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Dois',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Tres',
      apiUrl: '${baseUrl}/rele3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarStatusTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarStatusTres',
      apiUrl: '${baseUrl}/rele3/status.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraAtivacaoTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraAtivacao Tres',
      apiUrl: '${baseUrl}/rele3/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraDesativacaoTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraDesativacao Tres',
      apiUrl: '${baseUrl}/rele3/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarModoTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarModoTres',
      apiUrl: '${baseUrl}/rele3/modoAcionamento.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudarNomeCall {
  Future<ApiCallResponse> call({
    String? nomeRele = '',
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleThreeGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"nome": "${escapeStringForJson(nomeRele)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mudarNome',
      apiUrl: '${baseUrl}/rele3/nome.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Rele Three Group Code

/// Start Rele Four Group Code

class ReleFourGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/';
  static Map<String, String> headers = {};
  static ReleOnCopyCopyCopyCall releOnCopyCopyCopyCall =
      ReleOnCopyCopyCopyCall();
  static ReleOffCopyCopyCopyCall releOffCopyCopyCopyCall =
      ReleOffCopyCopyCopyCall();
  static SwitchCopyCopyCopyCall switchCopyCopyCopyCall =
      SwitchCopyCopyCopyCall();
  static SwitchOffCopyCopyCopyCall switchOffCopyCopyCopyCall =
      SwitchOffCopyCopyCopyCall();
  static HoraAtivacaoCopyCopyCopyCall horaAtivacaoCopyCopyCopyCall =
      HoraAtivacaoCopyCopyCopyCall();
  static HoraDesativacaoCopyCopyCopyCall horaDesativacaoCopyCopyCopyCall =
      HoraDesativacaoCopyCopyCopyCall();
  static TempoPulsoCopyCopyCopyCall tempoPulsoCopyCopyCopyCall =
      TempoPulsoCopyCopyCopyCall();
  static TempoDebouncingCopyCopyCopyCall tempoDebouncingCopyCopyCopyCall =
      TempoDebouncingCopyCopyCopyCall();
  static ModoAcionamentoCopyCopyCopyCall modoAcionamentoCopyCopyCopyCall =
      ModoAcionamentoCopyCopyCopyCall();
  static ModoAcionamentoCopyCopyCopyDoisCall
      modoAcionamentoCopyCopyCopyDoisCall =
      ModoAcionamentoCopyCopyCopyDoisCall();
  static ModoAcionamentoCopyCopyCopyTresCall
      modoAcionamentoCopyCopyCopyTresCall =
      ModoAcionamentoCopyCopyCopyTresCall();
  static PegarStatusQuatroCall pegarStatusQuatroCall = PegarStatusQuatroCall();
  static PegarHoraAtivacaoQuatroCall pegarHoraAtivacaoQuatroCall =
      PegarHoraAtivacaoQuatroCall();
  static PegarHoraDesativacaoQuatroCall pegarHoraDesativacaoQuatroCall =
      PegarHoraDesativacaoQuatroCall();
  static PegarModoQuatroCall pegarModoQuatroCall = PegarModoQuatroCall();
  static MudaNomeReleCall mudaNomeReleCall = MudaNomeReleCall();
}

class ReleOnCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele on Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele off Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tipoBotao": "switch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tipoBotao": "Desativado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch off Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hora Ativacao Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HoraDesativacao Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoPulsoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoPulso": ${tempoPulso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoPulso Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoDebouncingCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoDebouncing": ${tempoDebouncing}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoDebouncing Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy Dois',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy Tres',
      apiUrl: '${baseUrl}/rele4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarStatusQuatroCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarStatusQuatro',
      apiUrl: '${baseUrl}/rele4/status.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraAtivacaoQuatroCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraAtivacao Quatro',
      apiUrl: '${baseUrl}/rele4/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraDesativacaoQuatroCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraDesativacao Quatro',
      apiUrl: '${baseUrl}/rele4/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarModoQuatroCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarModoQuatro',
      apiUrl: '${baseUrl}/rele4/modoAcionamento.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudaNomeReleCall {
  Future<ApiCallResponse> call({
    String? nomeRele = '',
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFourGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"nome": "${escapeStringForJson(nomeRele)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mudaNomeRele',
      apiUrl: '${baseUrl}/rele4/nome.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Rele Four Group Code

/// Start Rele Five Group Code

class ReleFiveGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/';
  static Map<String, String> headers = {};
  static ReleOnCopyCopyCopyCopyCall releOnCopyCopyCopyCopyCall =
      ReleOnCopyCopyCopyCopyCall();
  static ReleOffCopyCopyCopyCopyCall releOffCopyCopyCopyCopyCall =
      ReleOffCopyCopyCopyCopyCall();
  static SwitchCopyCopyCopyCopyCall switchCopyCopyCopyCopyCall =
      SwitchCopyCopyCopyCopyCall();
  static SwitchOffCopyCopyCopyCopyCall switchOffCopyCopyCopyCopyCall =
      SwitchOffCopyCopyCopyCopyCall();
  static HoraAtivacaoCopyCopyCopyCopyCall horaAtivacaoCopyCopyCopyCopyCall =
      HoraAtivacaoCopyCopyCopyCopyCall();
  static HoraDesativacaoCopyCopyCopyCopyCall
      horaDesativacaoCopyCopyCopyCopyCall =
      HoraDesativacaoCopyCopyCopyCopyCall();
  static TempoPulsoCopyCopyCopyCopyCall tempoPulsoCopyCopyCopyCopyCall =
      TempoPulsoCopyCopyCopyCopyCall();
  static TempoDebouncingCopyCopyCopyCopyCall
      tempoDebouncingCopyCopyCopyCopyCall =
      TempoDebouncingCopyCopyCopyCopyCall();
  static ModoAcionamentoCopyCopyCopyCopyCall
      modoAcionamentoCopyCopyCopyCopyCall =
      ModoAcionamentoCopyCopyCopyCopyCall();
  static ModoAcionamentoCopyCopyCopyCopyDoisCall
      modoAcionamentoCopyCopyCopyCopyDoisCall =
      ModoAcionamentoCopyCopyCopyCopyDoisCall();
  static ModoAcionamentoCopyCopyCopyCopyTresCall
      modoAcionamentoCopyCopyCopyCopyTresCall =
      ModoAcionamentoCopyCopyCopyCopyTresCall();
  static PegarStatusCincoCall pegarStatusCincoCall = PegarStatusCincoCall();
  static PegarHoraAtivacaoCincoCall pegarHoraAtivacaoCincoCall =
      PegarHoraAtivacaoCincoCall();
  static PegarHoraDesativacaoCincoCall pegarHoraDesativacaoCincoCall =
      PegarHoraDesativacaoCincoCall();
  static PegarModoCincoCall pegarModoCincoCall = PegarModoCincoCall();
  static MudarnomeReleCall mudarnomeReleCall = MudarnomeReleCall();
}

class ReleOnCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele on Copy Copy Copy Copy',
      apiUrl: '${baseUrl}rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReleOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"status": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rele off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "tipoBotao": "switch"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SwitchOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tipoBotao": "Desativado"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'switch off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Hora Ativacao Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HoraDesativacao Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoPulsoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoPulso": ${tempoPulso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoPulso Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TempoDebouncingCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"tempoDebouncing": ${tempoDebouncing}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'tempoDebouncing Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyCopyDoisCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy Copy Dois',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAcionamentoCopyCopyCopyCopyTresCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"modoAcionamento": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAcionamento Copy Copy Copy Copy Tres',
      apiUrl: '${baseUrl}/rele5.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarStatusCincoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarStatusCinco',
      apiUrl: '${baseUrl}/rele5/status.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraAtivacaoCincoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraAtivacao Cinco',
      apiUrl: '${baseUrl}/rele5/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarHoraDesativacaoCincoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarHoraDesativacao Cinco',
      apiUrl: '${baseUrl}/rele5/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarModoCincoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarModoCinco',
      apiUrl: '${baseUrl}/rele5/modoAcionamento.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MudarnomeReleCall {
  Future<ApiCallResponse> call({
    String? nomeRele = '',
    String? idesp = '',
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    int? tempoPulso,
    int? tempoDebouncing,
    int? modoAcionamento,
    String? token = '',
  }) async {
    final baseUrl = ReleFiveGroup.getBaseUrl(
      idesp: idesp,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      tempoPulso: tempoPulso,
      tempoDebouncing: tempoDebouncing,
      modoAcionamento: modoAcionamento,
      token: token,
    );

    final ffApiRequestBody = '''
{
"nome": "${escapeStringForJson(nomeRele)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mudarnomeRele',
      apiUrl: '${baseUrl}/rele5/nome.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Rele Five Group Code

/// Start agendamentos Group Code

class AgendamentosGroup {
  static String getBaseUrl({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/Agendamentos/.json';
  static Map<String, String> headers = {};
  static SegundaCall segundaCall = SegundaCall();
  static TercaCall tercaCall = TercaCall();
  static QuartaCall quartaCall = QuartaCall();
  static QuintaCall quintaCall = QuintaCall();
  static SextaCall sextaCall = SextaCall();
  static SabadoCall sabadoCall = SabadoCall();
  static DomingoCall domingoCall = DomingoCall();
  static AtivoCall ativoCall = AtivoCall();
  static HoraAtivacaoAgendamentosCall horaAtivacaoAgendamentosCall =
      HoraAtivacaoAgendamentosCall();
  static HoraDesativacaoAgendamentosCall horaDesativacaoAgendamentosCall =
      HoraDesativacaoAgendamentosCall();
  static AgendamentossCall agendamentossCall = AgendamentossCall();
}

class SegundaCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"segunda": ${segunda}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'segunda',
      apiUrl: '${baseUrl}/dias/segunda.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TercaCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"terca": ${terca}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'terca',
      apiUrl: '${baseUrl}/dias/terca.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QuartaCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"quarta": ${quarta}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'quarta',
      apiUrl: '${baseUrl}/dias/quarta.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QuintaCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"quinta": ${quinta}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'quinta',
      apiUrl: '${baseUrl}/dias/quinta.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SextaCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"sexta": ${sexta}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sexta',
      apiUrl: '${baseUrl}/dias/sexta.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SabadoCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"sabado": ${sabado}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sabado',
      apiUrl: '${baseUrl}/dias/sabado.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DomingoCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"domingo": ${domingo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'domingo',
      apiUrl: '${baseUrl}/dias/domingo.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AtivoCall {
  Future<ApiCallResponse> call({
    bool? ativo,
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"ativo": ${ativo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ativo',
      apiUrl: '${baseUrl}/ativo.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraAtivacaoAgendamentosCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"horaAtivacao": "${escapeStringForJson(horaAtivacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'horaAtivacao agendamentos',
      apiUrl: '${baseUrl}/horaAtivacao.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HoraDesativacaoAgendamentosCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"horaDesativacao": "${escapeStringForJson(horaDesativacao)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'horaDesativacao agendamentos',
      apiUrl: '${baseUrl}/horaDesativacao.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgendamentossCall {
  Future<ApiCallResponse> call({
    String? agendamento = '',
    bool? segunda,
    bool? terca,
    bool? quarta,
    bool? quinta,
    bool? sexta,
    bool? sabado,
    bool? domingo,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = AgendamentosGroup.getBaseUrl(
      agendamento: agendamento,
      segunda: segunda,
      terca: terca,
      quarta: quarta,
      quinta: quinta,
      sexta: sexta,
      sabado: sabado,
      domingo: domingo,
      horaAtivacao: horaAtivacao,
      horaDesativacao: horaDesativacao,
      token: token,
      idesp: idesp,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'agendamentoss',
      apiUrl: '${baseUrl}teste',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End agendamentos Group Code

/// Start entradas zero Group Code

class EntradasZeroGroup {
  static String getBaseUrl({
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas/';
  static Map<String, String> headers = {};
  static EntradazerobordaCall entradazerobordaCall = EntradazerobordaCall();
  static EntradazeroreleumCall entradazeroreleumCall = EntradazeroreleumCall();
  static EntradazeroreleumOffCall entradazeroreleumOffCall =
      EntradazeroreleumOffCall();
  static EntradazeroreledoisCall entradazeroreledoisCall =
      EntradazeroreledoisCall();
  static EntradazeroreledoisOffCall entradazeroreledoisOffCall =
      EntradazeroreledoisOffCall();
  static EntradazeroreletresOffCall entradazeroreletresOffCall =
      EntradazeroreletresOffCall();
  static EntradazeroreletresCall entradazeroreletresCall =
      EntradazeroreletresCall();
  static EntradazerorelequatroCall entradazerorelequatroCall =
      EntradazerorelequatroCall();
  static EntradazerorelequatroOffCall entradazerorelequatroOffCall =
      EntradazerorelequatroOffCall();
  static EntradazerorelecincoCall entradazerorelecincoCall =
      EntradazerorelecincoCall();
  static EntradazerorelecincoOffCall entradazerorelecincoOffCall =
      EntradazerorelecincoOffCall();
  static EntradazeropinoCall entradazeropinoCall = EntradazeropinoCall();
  static SaidasCall saidasCall = SaidasCall();
}

class EntradazerobordaCall {
  Future<ApiCallResponse> call({
    int? borda,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
  "tipoBorda": ${borda}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroborda',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumOffCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum off',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisOffCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois off',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresOffCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres off',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroOffCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro off',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoOffCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco off',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeropinoCall {
  Future<ApiCallResponse> call({
    int? pino,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"pino": 34
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeropino',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaidasCall {
  Future<ApiCallResponse> call({
    String? saidas = '',
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasZeroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saidas": "${escapeStringForJson(saidas)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saidas',
      apiUrl: '${baseUrl}/entrada0.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End entradas zero Group Code

/// Start entradas um Group Code

class EntradasUmGroup {
  static String getBaseUrl({
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas/';
  static Map<String, String> headers = {};
  static EntradazerobordaCopyCall entradazerobordaCopyCall =
      EntradazerobordaCopyCall();
  static EntradazeroreleumCopyCall entradazeroreleumCopyCall =
      EntradazeroreleumCopyCall();
  static EntradazeroreleumOffCopyCall entradazeroreleumOffCopyCall =
      EntradazeroreleumOffCopyCall();
  static EntradazeroreledoisCopyCall entradazeroreledoisCopyCall =
      EntradazeroreledoisCopyCall();
  static EntradazeroreledoisOffCopyCall entradazeroreledoisOffCopyCall =
      EntradazeroreledoisOffCopyCall();
  static EntradazeroreletresOffCopyCall entradazeroreletresOffCopyCall =
      EntradazeroreletresOffCopyCall();
  static EntradazeroreletresCopyCall entradazeroreletresCopyCall =
      EntradazeroreletresCopyCall();
  static EntradazerorelequatroCopyCall entradazerorelequatroCopyCall =
      EntradazerorelequatroCopyCall();
  static EntradazerorelequatroOffCopyCall entradazerorelequatroOffCopyCall =
      EntradazerorelequatroOffCopyCall();
  static EntradazerorelecincoCopyCall entradazerorelecincoCopyCall =
      EntradazerorelecincoCopyCall();
  static EntradazerorelecincoOffCopyCall entradazerorelecincoOffCopyCall =
      EntradazerorelecincoOffCopyCall();
  static EntradazeropinoCopyCall entradazeropinoCopyCall =
      EntradazeropinoCopyCall();
}

class EntradazerobordaCopyCall {
  Future<ApiCallResponse> call({
    int? borda,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"tipoBorda": ${borda} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroborda Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumOffCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum off Copy ',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisOffCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois off Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresOffCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres off Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroOffCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro off Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoOffCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco off Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeropinoCopyCall {
  Future<ApiCallResponse> call({
    int? pino,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasUmGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"pino": ${pino}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeropino Copy',
      apiUrl: '${baseUrl}/entrada1.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End entradas um Group Code

/// Start entradas dois Group Code

class EntradasDoisGroup {
  static String getBaseUrl({
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas/';
  static Map<String, String> headers = {};
  static EntradazerobordaCopyCopyCall entradazerobordaCopyCopyCall =
      EntradazerobordaCopyCopyCall();
  static EntradazeroreleumCopyCopyCall entradazeroreleumCopyCopyCall =
      EntradazeroreleumCopyCopyCall();
  static EntradazeroreleumOffCopyCopyCall entradazeroreleumOffCopyCopyCall =
      EntradazeroreleumOffCopyCopyCall();
  static EntradazeroreledoisCopyCopyCall entradazeroreledoisCopyCopyCall =
      EntradazeroreledoisCopyCopyCall();
  static EntradazeroreledoisOffCopyCopyCall entradazeroreledoisOffCopyCopyCall =
      EntradazeroreledoisOffCopyCopyCall();
  static EntradazeroreletresOffCopyCopyCall entradazeroreletresOffCopyCopyCall =
      EntradazeroreletresOffCopyCopyCall();
  static EntradazeroreletresCopyCopyCall entradazeroreletresCopyCopyCall =
      EntradazeroreletresCopyCopyCall();
  static EntradazerorelequatroCopyCopyCall entradazerorelequatroCopyCopyCall =
      EntradazerorelequatroCopyCopyCall();
  static EntradazerorelequatroOffCopyCopyCall
      entradazerorelequatroOffCopyCopyCall =
      EntradazerorelequatroOffCopyCopyCall();
  static EntradazerorelecincoCopyCopyCall entradazerorelecincoCopyCopyCall =
      EntradazerorelecincoCopyCopyCall();
  static EntradazerorelecincoOffCopyCopyCall
      entradazerorelecincoOffCopyCopyCall =
      EntradazerorelecincoOffCopyCopyCall();
  static EntradazeropinoCopyCopyCall entradazeropinoCopyCopyCall =
      EntradazeropinoCopyCopyCall();
}

class EntradazerobordaCopyCopyCall {
  Future<ApiCallResponse> call({
    int? borda,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"tipoBorda": ${borda} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroborda Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum off Copy Copy ',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois off Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres off Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro off Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoOffCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco off Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeropinoCopyCopyCall {
  Future<ApiCallResponse> call({
    int? pino,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasDoisGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"pino": 34
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeropino Copy Copy',
      apiUrl: '${baseUrl}/entrada2.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End entradas dois Group Code

/// Start entradas tres Group Code

class EntradasTresGroup {
  static String getBaseUrl({
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas/';
  static Map<String, String> headers = {};
  static EntradazerobordaCopyCopyCopyCall entradazerobordaCopyCopyCopyCall =
      EntradazerobordaCopyCopyCopyCall();
  static EntradazeroreleumCopyCopyCopyCall entradazeroreleumCopyCopyCopyCall =
      EntradazeroreleumCopyCopyCopyCall();
  static EntradazeroreleumOffCopyCopyCopyCall
      entradazeroreleumOffCopyCopyCopyCall =
      EntradazeroreleumOffCopyCopyCopyCall();
  static EntradazeroreledoisCopyCopyCopyCall
      entradazeroreledoisCopyCopyCopyCall =
      EntradazeroreledoisCopyCopyCopyCall();
  static EntradazeroreledoisOffCopyCopyCopyCall
      entradazeroreledoisOffCopyCopyCopyCall =
      EntradazeroreledoisOffCopyCopyCopyCall();
  static EntradazeroreletresOffCopyCopyCopyCall
      entradazeroreletresOffCopyCopyCopyCall =
      EntradazeroreletresOffCopyCopyCopyCall();
  static EntradazeroreletresCopyCopyCopyCall
      entradazeroreletresCopyCopyCopyCall =
      EntradazeroreletresCopyCopyCopyCall();
  static EntradazerorelequatroCopyCopyCopyCall
      entradazerorelequatroCopyCopyCopyCall =
      EntradazerorelequatroCopyCopyCopyCall();
  static EntradazerorelequatroOffCopyCopyCopyCall
      entradazerorelequatroOffCopyCopyCopyCall =
      EntradazerorelequatroOffCopyCopyCopyCall();
  static EntradazerorelecincoCopyCopyCopyCall
      entradazerorelecincoCopyCopyCopyCall =
      EntradazerorelecincoCopyCopyCopyCall();
  static EntradazerorelecincoOffCopyCopyCopyCall
      entradazerorelecincoOffCopyCopyCopyCall =
      EntradazerorelecincoOffCopyCopyCopyCall();
  static EntradazeropinoCopyCopyCopyCall entradazeropinoCopyCopyCopyCall =
      EntradazeropinoCopyCopyCopyCall();
}

class EntradazerobordaCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    int? borda,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"tipoBorda": ${borda} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroborda Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum off  Copy Copy Copy ',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois off Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres off Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro off Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoOffCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco off Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeropinoCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    int? pino,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasTresGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"pino": ${pino}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeropino Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada3.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End entradas tres Group Code

/// Start entradas quatro Group Code

class EntradasQuatroGroup {
  static String getBaseUrl({
    String? token = '',
    String? idesp = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas/';
  static Map<String, String> headers = {};
  static EntradazerobordaCopyCopyCopyCopyCall
      entradazerobordaCopyCopyCopyCopyCall =
      EntradazerobordaCopyCopyCopyCopyCall();
  static EntradazeroreleumCopyCopyCopyCopyCall
      entradazeroreleumCopyCopyCopyCopyCall =
      EntradazeroreleumCopyCopyCopyCopyCall();
  static EntradazeroreleumOffCopyCopyCopyCopyCall
      entradazeroreleumOffCopyCopyCopyCopyCall =
      EntradazeroreleumOffCopyCopyCopyCopyCall();
  static EntradazeroreledoisCopyCopyCopyCopyCall
      entradazeroreledoisCopyCopyCopyCopyCall =
      EntradazeroreledoisCopyCopyCopyCopyCall();
  static EntradazeroreledoisOffCopyCopyCopyCopyCall
      entradazeroreledoisOffCopyCopyCopyCopyCall =
      EntradazeroreledoisOffCopyCopyCopyCopyCall();
  static EntradazeroreletresOffCopyCopyCopyCopyCall
      entradazeroreletresOffCopyCopyCopyCopyCall =
      EntradazeroreletresOffCopyCopyCopyCopyCall();
  static EntradazeroreletresCopyCopyCopyCopyCall
      entradazeroreletresCopyCopyCopyCopyCall =
      EntradazeroreletresCopyCopyCopyCopyCall();
  static EntradazerorelequatroCopyCopyCopyCopyCall
      entradazerorelequatroCopyCopyCopyCopyCall =
      EntradazerorelequatroCopyCopyCopyCopyCall();
  static EntradazerorelequatroOffCopyCopyCopyCopyCall
      entradazerorelequatroOffCopyCopyCopyCopyCall =
      EntradazerorelequatroOffCopyCopyCopyCopyCall();
  static EntradazerorelecincoCopyCopyCopyCopyCall
      entradazerorelecincoCopyCopyCopyCopyCall =
      EntradazerorelecincoCopyCopyCopyCopyCall();
  static EntradazerorelecincoOffCopyCopyCopyCopyCall
      entradazerorelecincoOffCopyCopyCopyCopyCall =
      EntradazerorelecincoOffCopyCopyCopyCopyCall();
  static EntradazeropinoCopyCopyCopyCopyCall
      entradazeropinoCopyCopyCopyCopyCall =
      EntradazeropinoCopyCopyCopyCopyCall();
}

class EntradazerobordaCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    int? borda,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"tipoBorda": ${borda} 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroborda Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreleumOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida0": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreleum off Copy Copy Copy Copy ',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreledoisOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida1": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreledois off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeroreletresCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida2": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeroreletres Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelequatroOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida3": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelequatro off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazerorelecincoOffCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"saida4": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazerorelecinco off Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EntradazeropinoCopyCopyCopyCopyCall {
  Future<ApiCallResponse> call({
    int? pino,
    String? token = '',
    String? idesp = '',
  }) async {
    final baseUrl = EntradasQuatroGroup.getBaseUrl(
      token: token,
      idesp: idesp,
    );

    final ffApiRequestBody = '''
{
"pino": ${pino}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'entradazeropino Copy Copy Copy Copy',
      apiUrl: '${baseUrl}/entrada4.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End entradas quatro Group Code

class UsersCall {
  static Future<ApiCallResponse> call({
    String? emailId = '',
    String? userId = '',
    String? userAuthId = '',
    String? eSPs = '',
    String? token = '',
    String? emailId2 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(emailId)}",
  "uid": "${escapeStringForJson(userId)}",
  "token": "${escapeStringForJson(eSPs)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Users',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/Users/${userId}/dados.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VincularESPCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? idesp = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
"userID": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VincularESP',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/owner.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LestUserCall {
  static Future<ApiCallResponse> call({
    String? idEsp = '',
    String? userId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
"userID": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'lestUser',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idEsp}/lastUser.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarEspsAutorizadosCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pegar Esps Autorizados',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/Users/${userId}/allowESPs.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdicionarQuaisEspsUsuarioTemCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? token = '',
    String? idesp = '',
    String? nomeESP = '',
  }) async {
    final ffApiRequestBody = '''
{
  "nome": "${escapeStringForJson(nomeESP)}",
  "id": "${escapeStringForJson(idesp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adicionar quais esps usuario tem',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/Users/${userId}/allowESPs/${idesp}.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AtualizarNomeDoESPsCall {
  static Future<ApiCallResponse> call({
    String? nomeESP = '',
    String? userId = '',
    String? idesp = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "nome": "${escapeStringForJson(nomeESP)}",
  "id": "${escapeStringForJson(idesp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'atualizar Nome do ESPs',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/Users/${userId}/allowESPs/${idesp}.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletarESPCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? idesp = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deletarESP',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/Users/${userId}/allowESPs/${idesp}.json?auth=${token}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgendamentoCall {
  static Future<ApiCallResponse> call({
    String? agendamentoId = '',
    bool? domingo = true,
    bool? segunda = true,
    bool? terca = true,
    bool? quarta = true,
    bool? quinta = true,
    bool? sexta = true,
    bool? sabado = true,
    String? horaAtivacao = '',
    String? horaDesativacao = '',
    bool? ativo = true,
    String? token = '',
    String? saidas = '',
    String? idesp = '',
  }) async {
    final ffApiRequestBody = '''
{
  "${escapeStringForJson(agendamentoId)}": {
    "horaAtivacao": "${escapeStringForJson(horaAtivacao)}",
    "horaDesativacao": "${escapeStringForJson(horaDesativacao)}",
    "ativo": ${ativo},
    "dias": {
      "Domingo": ${domingo},
      "Segunda": ${segunda},
      "Terca": ${terca},
      "Quarta": ${quarta},
      "Quinta": ${quinta},
      "Sexta": ${sexta},
      "Sabado": ${sabado}
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'agendamento',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/Agendamentos.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RelacionarRelesCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? relacionamentoId = '',
    String? agendamento = '',
    String? rele = '',
    bool? ativo,
  }) async {
    final ffApiRequestBody = '''
{
  "agendamentoId": "${escapeStringForJson(agendamento)}",
  "releId": ${escapeStringForJson(rele)},
  "ativo": ${ativo}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'relacionar Reles',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${id}/agendamentosReles/${relacionamentoId}.json',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarAgendamentosCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? idesp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pegar Agendamentos',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/Agendamentos/.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarEntradasCall {
  static Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pegar Entradas',
      apiUrl:
          'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/mapeamento/entradas.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}


class ControlesGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/Controles';
  static Map<String, String> headers = {};

  static ModoAprendizadoCall modoAprendizadoCall = ModoAprendizadoCall();
  static PegarControlesCall pegarControlesCall = PegarControlesCall();
  static DeletarControleCall deletarControleCall = DeletarControleCall();
  static GetControlesCall getControlesCall = GetControlesCall();
  static AddControleCall addControleCall = AddControleCall();
}

 class DeletarControleCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? idcontrole = '',
    String? token = '',
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );
    return ApiManager.instance.makeApiCall(
      callName: 'deletarControle',
      apiUrl: '${baseUrl}/${idcontrole}.json?auth=${token}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModoAprendizadoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "modoAprendizado": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'modoAprendizado',
      apiUrl: '${baseUrl}/modoAprendizado.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PegarControlesCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'pegarControles',
      apiUrl: '${baseUrl}.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdicionarControleCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
    String? idcontrole = '',
    String? index,
    String? serial,
    String? nome,
    String? apartamento,
    String? placa,
    String? bateria,
    bool? clonagem,
    int? id,
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );
    // Corpo do JSON foi simplificado para remover os campos desnecessários
    final ffApiRequestBody = '''
{
  "index": "${escapeStringForJson(index)}",
  "serial": "${escapeStringForJson(serial)}",
  "nome": "${escapeStringForJson(nome)}",
  "apartamento": "${escapeStringForJson(apartamento)}",
  "placa": "${escapeStringForJson(placa)}",
  "bateria": "${escapeStringForJson(bateria)}",
  "clonagem": $clonagem,
  "id": $id
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'adicionarControle',
      apiUrl: '${baseUrl}/controle_${idcontrole}.json?auth=${token}',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetControlesCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getControles',
      apiUrl: '${baseUrl}.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddControleCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
    int? idcontrole,
    String? serial,
    bool? bateria,
    bool? clonagem,
    String? nome,
    String? placa,
    String? apto,
  }) async {
    final baseUrl = ControlesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );

    final ffApiRequestBody = '''
    {
      "bateria": ${bateria},
      "clonagem": ${clonagem},
      "id": ${idcontrole},
      "serial": "${escapeStringForJson(serial)}",
      "nome": "${escapeStringForJson(nome)}",
      "placa": "${escapeStringForJson(placa)}",
      "apto": "${escapeStringForJson(apto)}"
    }
    ''';
    return ApiManager.instance.makeApiCall(
      callName: 'addControle',
      apiUrl: '${baseUrl}/controle_${idcontrole}.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificacoesGroup {
  static String getBaseUrl({
    String? idesp = '',
    String? token = '',
  }) =>
      'https://poised-bot-443613-p6-default-rtdb.firebaseio.com/MIR/ESPS/${idesp}/notificacao';
  static Map<String, String> headers = {};
  
  // Instância da nova chamada adicionada ao grupo
  static PegarNotificacoesCall pegarNotificacoesCall = PegarNotificacoesCall();

  static AtualizarNotificacaoCall atualizarNotificacaoCall =
      AtualizarNotificacaoCall();
}

// Nova classe para buscar as configurações de notificação
class PegarNotificacoesCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
  }) async {
    final baseUrl = NotificacoesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );
    return ApiManager.instance.makeApiCall(
      callName: 'pegarNotificacoes',
      apiUrl: '${baseUrl}.json?auth=${token}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AtualizarNotificacaoCall {
  Future<ApiCallResponse> call({
    String? idesp = '',
    String? token = '',
    String? notificacaoKey = '',
    bool? status,
  }) async {
    final baseUrl = NotificacoesGroup.getBaseUrl(
      idesp: idesp,
      token: token,
    );
    final ffApiRequestBody = '''
{
  "${escapeStringForJson(notificacaoKey)}": ${status}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'atualizarNotificacao',
      apiUrl: '${baseUrl}.json?auth=${token}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}