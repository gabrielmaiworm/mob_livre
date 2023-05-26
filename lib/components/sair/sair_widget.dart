import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sair_model.dart';
export 'sair_model.dart';

class SairWidget extends StatefulWidget {
  const SairWidget({
    Key? key,
    this.detailUser,
  }) : super(key: key);

  final dynamic detailUser;

  @override
  _SairWidgetState createState() => _SairWidgetState();
}

class _SairWidgetState extends State<SairWidget> {
  late SairModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SairModel());
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Deseja realmente sair?',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                              
                                FFAppState().update(() {
                                  FFAppState().reservado = false;
                                  FFAppState().reservando = false;
                                  FFAppState().emailCadastro = 'null';
                                  FFAppState().senhaCadastro = '';
                                  FFAppState().receberEmail = false;
                                  FFAppState().emailEsqueciSenha = 'null';
                                  FFAppState().emailLogado = 'null';
                                  FFAppState().nome = '';
                                  FFAppState().emailPersist = 'null';
                                  FFAppState().documento = '';
                                  FFAppState().sobrenome = '';
                                  FFAppState().nascimento = '';
                                  FFAppState().celular = '';
                                  FFAppState().tipoLesao = '';
                                  FFAppState().situacaoLesao = '';
                                  FFAppState().detalhesLesao = ''; 
                                  FFAppState().fotoPerfil = '';
                                  FFAppState().fotoDocumento = '';
                                  FFAppState().estado = '';
                                  FFAppState().cidade = '';
                                  FFAppState().bairro = '';
                                  FFAppState().cep = '';
                                  FFAppState().logradouro = '';
                                  FFAppState().numero = '';
                                  FFAppState().complemento = '';
                                  FFAppState().kit = 0;
                                  FFAppState().kitS = '';
                                  FFAppState().horaMs = 0;
                                  FFAppState().maisOpcoes = false;
                                  FFAppState().numeroEquipamento = '';
                                  FFAppState().emergencia = false;
                                  FFAppState().dadosEquipamento = 'null';
                                  FFAppState().logado = false;
                                  FFAppState().cep = '';
                                  
                                });

                                context.goNamed('MapaDeslogado');

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Você foi desconectado.',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0xFF606060),
                                  ),
                                );
                              },
                              text: 'Sim',
                              options: FFButtonOptions(
                                width: 150,
                                height: 40,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFF1D4F9A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Não',
                              options: FFButtonOptions(
                                width: 150,
                                height: 40,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFF1D4F9A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
