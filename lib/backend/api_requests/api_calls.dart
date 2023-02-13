import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Usuario Group Code

class UsuarioGroup {
  static String baseUrl = 'http://177.70.102.109:3005/';
  static Map<String, String> headers = {};
  static RedefinirSenhaCall redefinirSenhaCall = RedefinirSenhaCall();
  static LoginCall loginCall = LoginCall();
  static BuscarUsuarioPorEmailCall buscarUsuarioPorEmailCall =
      BuscarUsuarioPorEmailCall();
  static BuscaUsuarioPorCpfCall buscaUsuarioPorCpfCall =
      BuscaUsuarioPorCpfCall();
  static DetalhesDoUsuarioCall detalhesDoUsuarioCall = DetalhesDoUsuarioCall();
  static CadastrarUsuarioCall cadastrarUsuarioCall = CadastrarUsuarioCall();
  static EditarUsuarioCall editarUsuarioCall = EditarUsuarioCall();
}

class RedefinirSenhaCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    final body = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Redefinir Senha',
      apiUrl: '${UsuarioGroup.baseUrl}usuario-senha',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${UsuarioGroup.baseUrl}autenticacao',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioGroup.headers,
        'Authorization': 'Basic ${email}:${senha}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscarUsuarioPorEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    final body = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar usuario por email',
      apiUrl: '${UsuarioGroup.baseUrl}usuario-email',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BuscaUsuarioPorCpfCall {
  Future<ApiCallResponse> call({
    String? documento = '',
  }) {
    final body = '''
{
  "documento": "${documento}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Busca usuario por cpf',
      apiUrl: '${UsuarioGroup.baseUrl}usuario',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DetalhesDoUsuarioCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Detalhes do usuario',
      apiUrl: '${UsuarioGroup.baseUrl}usuario',
      callType: ApiCallType.GET,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CadastrarUsuarioCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? email = '',
    String? sobrenome = '',
    String? dataDeNascicmento = '',
    String? documento = '',
    String? telefoneFixo = '',
    String? telefoneCelular = '',
    String? cep = '',
    String? logradouro = '',
    String? numero = '',
    String? complemento = '',
    String? bairro = '',
    String? cidade = '',
    String? estado = '',
    String? situacaoLesao = '',
    String? nivelLesao = '',
    String? detalheLesao = '',
    String? fotoDocumento64 = '',
    String? fotoComDocumento64 = '',
    int? nivel,
    String? senha = '',
    String? telefone = '',
    String? tipoUsuario = 'USUÁRIO',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "email": "${email}",
  "data_de_nascicmento": "${dataDeNascicmento}",
  "documento": "${documento}",
  "telefone_fixo": "${telefoneFixo}",
  "telefone_celular": "${telefoneCelular}",
  "cep": "${cep}",
  "logradouro": "${logradouro}",
  "numero": "${numero}",
  "complemento": "${complemento}",
  "bairro": "${bairro}",
  "cidade": "${cidade}",
  "estado": "${estado}",
  "situacao_lesao": "${situacaoLesao}",
  "nivel_lesao": "${nivelLesao}",
  "detalhe_lesao": "${detalheLesao}",
  "foto_documento64": "${fotoDocumento64}",
  "foto_com_documento64": "${fotoComDocumento64}",
  "nivel": 1,
  "senha": "${senha}",
  "telefone": "${telefone}",
  "sobrenome": "${sobrenome}",
  "ativo": true,
  "tipo_usuario": "USUÁRIO"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cadastrar Usuario',
      apiUrl: '${UsuarioGroup.baseUrl}usuario',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditarUsuarioCall {
  Future<ApiCallResponse> call({
    String? nome = '',
    String? email = '',
    String? sobrenome = '',
    String? dataDeNascicmento = '',
    String? documento = '',
    String? telefoneFixo = '',
    String? telefoneCelular = '',
    String? cep = '',
    String? logradouro = '',
    String? numero = '',
    String? complemento = '',
    String? bairro = '',
    String? cidade = '',
    String? estado = '',
    String? situacaoLesao = '',
    String? nivelLesao = '',
    String? detalheLesao = '',
    String? fotoDocumento64 = '',
    String? fotoComDocumento64 = '',
    int? nivel,
    String? senha = '',
    String? telefone = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "email": "${email}",
  "data_de_nascicmento": "${dataDeNascicmento}",
  "documento": "${documento}",
  "telefone_fixo": "${telefoneFixo}",
  "telefone_celular": "${telefoneCelular}",
  "cep": "${cep}",
  "logradouro": "${logradouro}",
  "numero": "${numero}",
  "complemento": "${complemento}",
  "bairro": "${bairro}",
  "cidade": "${cidade}",
  "estado": "${estado}",
  "situacao_lesao": "${situacaoLesao}",
  "nivel_lesao": "${nivelLesao}",
  "detalhe_lesao": "${detalheLesao}",
  "foto_documento64": "${fotoDocumento64}",
  "foto_com_documento64": "${fotoComDocumento64}",
  "nivel": 1,
  "senha": "${senha}",
  "telefone": "${telefone}",
  "sobrenome": "${sobrenome}",
  "ativo": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Editar Usuario',
      apiUrl: '${UsuarioGroup.baseUrl}usuario',
      callType: ApiCallType.PUT,
      headers: {
        ...UsuarioGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Usuario Group Code

/// Start Parceiro Group Code

class ParceiroGroup {
  static String baseUrl = 'http://177.70.102.109:3005/';
  static Map<String, String> headers = {};
  static GETParceirosCall gETParceirosCall = GETParceirosCall();
  static GETDetalhesParceiroCall gETDetalhesParceiroCall =
      GETDetalhesParceiroCall();
}

class GETParceirosCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Parceiros',
      apiUrl: '${ParceiroGroup.baseUrl}parceiro',
      callType: ApiCallType.GET,
      headers: {
        ...ParceiroGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GETDetalhesParceiroCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Detalhes Parceiro',
      apiUrl: '${ParceiroGroup.baseUrl}parceiro-email/${email}',
      callType: ApiCallType.GET,
      headers: {
        ...ParceiroGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Parceiro Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
