import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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

  String _emailPersist = '';
  String get emailPersist => _emailPersist;
  set emailPersist(String _value) {
    _emailPersist = _value;
    prefs.setString('ff_emailPersist', _value);
  }
  DateTime? _horaReserva;
  DateTime? get horaReserva => _horaReserva;
  set horaReserva(DateTime? _value) {
    _horaReserva = _value;
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
