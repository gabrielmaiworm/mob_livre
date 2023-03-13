import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'permissao_model.dart';
export 'permissao_model.dart';

class PermissaoWidget extends StatefulWidget {
  const PermissaoWidget({Key? key}) : super(key: key);

  @override
  _PermissaoWidgetState createState() => _PermissaoWidgetState();
}

class _PermissaoWidgetState extends State<PermissaoWidget> {
  late PermissaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PermissaoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -0.82),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/Group_9.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, -0.26),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/image.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.52),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SelectionArea(
                                        child: Text(
                                      'Dessa forma, fica mais fácil buscar estações próximas de você!',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xCA363636),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.19),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  'Ative sua localização',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF1D4F9A),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.33),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SelectionArea(
                                        child: Text(
                                      'Para que nosso aplicativo possa funcionar, permita o uso da sua localização.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xCA363636),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.85),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await requestPermission(locationPermission);
                                      _model.apiResultipv = await UsuarioGroup.buscaCpfCall.call(
                                        documentoo: FFAppState().documento,
                                      );
                                      if ((_model.apiResultipv?.succeeded ?? true)) {
                                        _model.apiResult7vn = await UsuarioGroup.usuarioSolicitacaoCall.call(
                                          documento: FFAppState().documento,
                                        );
                                        if ((_model.apiResult7vn?.succeeded ?? true)) {
                                          setState(() {
                                            FFAppState().kit = getJsonField(
                                              (_model.apiResult7vn?.jsonBody ?? ''),
                                              r'''$..kit''',
                                            );
                                            FFAppState().dadosEquipamento = getJsonField(
                                              (_model.apiResult7vn?.jsonBody ?? ''),
                                              r'''$''',
                                            );
                                            FFAppState().emailPersist = getJsonField(
                                              (_model.apiResultipv?.jsonBody ?? ''),
                                              r'''$..email''',
                                            ).toString();
                                          });
                                          context.pushNamed(
                                            'MapaAlugado',
                                            queryParams: {
                                              'detalhesEquip': serializeParam(
                                                getJsonField(
                                                  FFAppState().dadosEquipamento,
                                                  r'''$''',
                                                ),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          context.pushNamed(
                                            'MapaLogado',
                                            queryParams: {
                                              'dadosUser': serializeParam(
                                                (_model.apiResultipv?.jsonBody ?? ''),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      } else {
                                        context.pushNamed('MapaDeslogado');
                                      }
                                      setState(() {});
                                    },
                                    text: 'Continuar',
                                    options: FFButtonOptions(
                                      width: 190,
                                      height: 45,
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                      color: Color(0xFF1D4F9A),
                                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
