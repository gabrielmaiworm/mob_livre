import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _emailLogado = prefs.getString('ff_emailLogado') ?? _emailLogado;
    _nome = prefs.getString('ff_nome') ?? _nome;
    _emailPersist = prefs.getString('ff_emailPersist') ?? _emailPersist;
    _sobrenome = prefs.getString('ff_sobrenome') ?? _sobrenome;
    _documento = prefs.getString('ff_documento') ?? _documento;
    _nascimento = prefs.getString('ff_nascimento') ?? _nascimento;
    _celular = prefs.getString('ff_celular') ?? _celular;
    _tipoLesao = prefs.getString('ff_tipoLesao') ?? _tipoLesao;
    _situacaoLesao = prefs.getString('ff_situacaoLesao') ?? _situacaoLesao;
    _detalhesLesao = prefs.getString('ff_detalhesLesao') ?? _detalhesLesao;
    _fotoPerfil = prefs.getString('ff_fotoPerfil') ?? _fotoPerfil;
    _fotoDocumento = prefs.getString('ff_fotoDocumento') ?? _fotoDocumento;
    _estado = prefs.getString('ff_estado') ?? _estado;
    _cidade = prefs.getString('ff_cidade') ?? _cidade;
    _bairro = prefs.getString('ff_bairro') ?? _bairro;
    _cep = prefs.getString('ff_cep') ?? _cep;
    _logradouro = prefs.getString('ff_logradouro') ?? _logradouro;
    _numero = prefs.getString('ff_numero') ?? _numero;
    _complemento = prefs.getString('ff_complemento') ?? _complemento;
    _logado = prefs.getBool('ff_logado') ?? _logado;
    _reservado = prefs.getBool('ff_reservado') ?? _reservado;
    _userController = prefs.getBool('ff_userController') ?? _userController;
    _kit = prefs.getInt('ff_kit') ?? _kit;
    _kitS = prefs.getString('ff_kitS') ?? _kitS;
    _horaMs = prefs.getInt('ff_horaMs') ?? _horaMs;
    _credito = prefs.getDouble('ff_credito') ?? _credito;
    if (prefs.containsKey('ff_dadosEquipamento')) {
      try {
        _dadosEquipamento =
            jsonDecode(prefs.getString('ff_dadosEquipamento') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _emailCadastro = '';
  String get emailCadastro => _emailCadastro;
  set emailCadastro(String _value) {
    _emailCadastro = _value;
  }

  String _senhaCadastro = '';
  String get senhaCadastro => _senhaCadastro;
  set senhaCadastro(String _value) {
    _senhaCadastro = _value;
  }
   String _urlPagamento = '';
  String get urlPagamento => _urlPagamento;
  set urlPagamento(String _value) {
    _urlPagamento = _value;
  }

  bool _receberEmail = false;
  bool get receberEmail => _receberEmail;
  set receberEmail(bool _value) {
    _receberEmail = _value;
  }

  String _emailEsqueciSenha = '';
  String get emailEsqueciSenha => _emailEsqueciSenha;
  set emailEsqueciSenha(String _value) {
    _emailEsqueciSenha = _value;
  }

  String _emailLogado = '';
  String get emailLogado => _emailLogado;
  set emailLogado(String _value) {
    _emailLogado = _value;
    prefs.setString('ff_emailLogado', _value);
  }

  String _nome = '';
  String get nome => _nome;
  set nome(String _value) {
    _nome = _value;
    prefs.setString('ff_nome', _value);
  }

  String _emailPersist = 'nenhum';
  String get emailPersist => _emailPersist;
  set emailPersist(String _value) {
    _emailPersist = _value;
    prefs.setString('ff_emailPersist', _value);
  }

  DateTime? _horaReserva = DateTime.fromMillisecondsSinceEpoch(1677590340000);
  DateTime? get horaReserva => _horaReserva;
  set horaReserva(DateTime? _value) {
    _horaReserva = _value;
  }

  String _sobrenome = '';
  String get sobrenome => _sobrenome;
  set sobrenome(String _value) {
    _sobrenome = _value;
    prefs.setString('ff_sobrenome', _value);
  }

  String _documento = '';
  String get documento => _documento;
  set documento(String _value) {
    _documento = _value;
    prefs.setString('ff_documento', _value);
  }

  String _nascimento = '';
  String get nascimento => _nascimento;
  set nascimento(String _value) {
    _nascimento = _value;
    prefs.setString('ff_nascimento', _value);
  }

  String _celular = '';
  String get celular => _celular;
  set celular(String _value) {
    _celular = _value;
    prefs.setString('ff_celular', _value);
  }

  String _tipoLesao = '';
  String get tipoLesao => _tipoLesao;
  set tipoLesao(String _value) {
    _tipoLesao = _value;
    prefs.setString('ff_tipoLesao', _value);
  }

  String _situacaoLesao = '';
  String get situacaoLesao => _situacaoLesao;
  set situacaoLesao(String _value) {
    _situacaoLesao = _value;
    prefs.setString('ff_situacaoLesao', _value);
  }

  double _credito = 0;
  double get credito => _credito;
  set credito(double _value) {
    _credito = _value;
    prefs.setDouble('ff_credito', _value);
  }

  int _taxaMinuto = 0;
  int get taxaMinuto => _taxaMinuto;
  set taxaMinuto(int _value) {
    _taxaMinuto = _value;
    prefs.setInt('ff_taxaMinuto', _value);
  }

  String _detalhesLesao = '';
  String get detalhesLesao => _detalhesLesao;
  set detalhesLesao(String _value) {
    _detalhesLesao = _value;
    prefs.setString('ff_detalhesLesao', _value);
  }

  String _fotoPerfil = '';
  String get fotoPerfil => _fotoPerfil;
  set fotoPerfil(String _value) {
    _fotoPerfil = _value;
    prefs.setString('ff_fotoPerfil', _value);
  }

  String _fotoDocumento = '';
  String get fotoDocumento => _fotoDocumento;
  set fotoDocumento(String _value) {
    _fotoDocumento = _value;
    prefs.setString('ff_fotoDocumento', _value);
  }

  String _estado = '';
  String get estado => _estado;
  set estado(String _value) {
    _estado = _value;
    prefs.setString('ff_estado', _value);
  }

  String _cidade = '';
  String get cidade => _cidade;
  set cidade(String _value) {
    _cidade = _value;
    prefs.setString('ff_cidade', _value);
  }

  String _bairro = '';
  String get bairro => _bairro;
  set bairro(String _value) {
    _bairro = _value;
    prefs.setString('ff_bairro', _value);
  }

  String _cep = '';
  String get cep => _cep;
  set cep(String _value) {
    _cep = _value;
    prefs.setString('ff_cep', _value);
  }

  String _logradouro = '';
  String get logradouro => _logradouro;
  set logradouro(String _value) {
    _logradouro = _value;
    prefs.setString('ff_logradouro', _value);
  }

  String _numero = '';
  String get numero => _numero;
  set numero(String _value) {
    _numero = _value;
    prefs.setString('ff_numero', _value);
  }

  String _complemento = '';
  String get complemento => _complemento;
  set complemento(String _value) {
    _complemento = _value;
    prefs.setString('ff_complemento', _value);
  }

  int _kit = 0;
  int get kit => _kit;
  set kit(int _value) {
    _kit = _value;
    prefs.setInt('ff_kit', _value);
  }

  String _numeroSEquip = '';
  String get numeroSEquip => _numeroSEquip;
  set numeroSEquip(String _value) {
    _numeroSEquip = _value;
    prefs.setString('ff_numeroSEquip', _value);
  }

  String _kitS = '';
  String get kitS  => _kitS ;
  set kitS (String _value) {
    _kitS = _value;
    prefs.setString('ff_kitS', _value);
  }

  int _horaMs = 0;
  int get horaMs => _horaMs;
  set horaMs(int _value) {
    _horaMs = _value;
    prefs.setInt('ff_horaMs', _value);
  }

  bool _logado = false;
  bool get logado => _logado;
  set logado(bool _value) {
    _logado = _value;
    prefs.setBool('ff_logado', _value);
  }

  bool _reservado = false;
  bool get reservado => _reservado;
  set reservado(bool _value) {
    _reservado = _value;
    prefs.setBool('ff_reservado', _value);
  }

  bool _userController = false;
  bool get userController => _userController;
  set userController(bool _value) {
    _userController = _value;
    prefs.setBool('ff_userController', _value);
  }

  bool _maisOpcoes = false;
  bool get maisOpcoes => _maisOpcoes;
  set maisOpcoes(bool _value) {
    _maisOpcoes = _value;
  }

  bool _reservando = false;
  bool get reservando => _reservando;
  set reservando(bool _value) {
    _reservando = _value;
  }

  String _numeroEquipamento = '';
  String get numeroEquipamento => _numeroEquipamento;
  set numeroEquipamento(String _value) {
    _numeroEquipamento = _value;
  }

  double _saldo = 0.0;
  double get saldo => _saldo;
  set saldo(double _value) {
    _saldo = _value;
  }
  int _relogio = 0;
  int get relogio => _relogio;
  set relogio(int _value) {
    _relogio = _value;
  }

  double _plano = 0.0;
  double get plano => _plano;
  set plano(double _value) {
    _plano = _value;
  }

  String _idPix = '';
  String get idPix => _idPix;
  set idPix(String _value) {
    _idPix = _value;
  }

  bool _emergencia = false;
  bool get emergencia => _emergencia;
  set emergencia(bool _value) {
    _emergencia = _value;
  }

  dynamic _dadosEquipamento;
  dynamic get dadosEquipamento => _dadosEquipamento;
  set dadosEquipamento(dynamic _value) {
    _dadosEquipamento = _value;
    prefs.setString('ff_dadosEquipamento', jsonEncode(_value));
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
