import 'package:mob_livree/selecionar_plano/selecinar_plano_model.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelecionarPlanoWidget extends StatefulWidget {
  const SelecionarPlanoWidget({
    Key? key,
    this.detalhesUser,
    required this.detalhesEquip,
  }) : super(key: key);

  final dynamic detalhesUser;
  final dynamic detalhesEquip;

  @override
  _SelecionarPlanoWidgetState createState() => _SelecionarPlanoWidgetState();
}

class _SelecionarPlanoWidgetState extends State<SelecionarPlanoWidget> {
  late SelecionarPlanoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecionarPlanoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultki5 =
          await EquipamentoGroup.gETTaxaEquipamentoCall.call(
        numeroSerieEquipamento: FFAppState().kit.toString(),
      );
      if ((_model.apiResultki5?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Taxas carregadas com sucesso.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xFF5DEA5C),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Falha ao carregar taxas.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).alternate,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: SelectionArea(
              child: Text(
            'Selecionar plano',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF1D4F9A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          )),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              scrollDirection: Axis.vertical,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().plano = 10.0;
                    });
                    _model.apiResultnsu =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: FFAppState().numeroSEquip,
                      valor: FFAppState().plano,
                    );
                    if ((_model.apiResultnsu?.succeeded ?? true)) {
                      context.goNamed(
                        'MapaAlugado',
                        queryParams: {
                          'detalhesEquip': serializeParam(
                            getJsonField(
                              widget.detalhesEquip,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                          'detailUser': serializeParam(
                            getJsonField(
                              widget.detalhesUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.apiResultnsu?.jsonBody ?? ''),
                              r'''$..error''',
                            ).toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '10',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 52,
                                  ),
                            ),
                            Text(
                              'Créditos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '${(10 * 10).toString()} min',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().plano = 15.0;
                    });
                    _model.apiResultnsu2 =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: FFAppState().numeroSEquip,
                      valor: FFAppState().plano,
                    );
                    if ((_model.apiResultnsu?.succeeded ?? true)) {
                      context.goNamed(
                        'MapaAlugado',
                        queryParams: {
                          'detalhesEquip': serializeParam(
                            getJsonField(
                              widget.detalhesEquip,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                          'detailUser': serializeParam(
                            getJsonField(
                              widget.detalhesUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.apiResultnsu?.jsonBody ?? ''),
                              r'''$..error''',
                            ).toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '15',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 52,
                                  ),
                            ),
                            Text(
                              'Créditos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '${(10 * 15).toString()} min',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().plano = 20.0;
                    });
                    _model.apiResultnsu3 =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: FFAppState().numeroSEquip,
                      valor: FFAppState().plano,
                    );
                    if ((_model.apiResultnsu?.succeeded ?? true)) {
                      context.goNamed(
                        'MapaAlugado',
                        queryParams: {
                          'detalhesEquip': serializeParam(
                            getJsonField(
                              widget.detalhesEquip,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                          'detailUser': serializeParam(
                            getJsonField(
                              widget.detalhesUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.apiResultnsu?.jsonBody ?? ''),
                              r'''$..error''',
                            ).toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '20',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 52,
                                  ),
                            ),
                            Text(
                              'Créditos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                             '${(10 * 15).toString()} min',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().plano = 50.0;
                    });
                    _model.apiResultnsu =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: FFAppState().numeroSEquip,
                      valor: FFAppState().plano,
                    );
                    if ((_model.apiResultnsu4?.succeeded ?? true)) {
                      context.goNamed(
                        'MapaAlugado',
                        queryParams: {
                          'detalhesEquip': serializeParam(
                            getJsonField(
                              widget.detalhesEquip,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                          'detailUser': serializeParam(
                            getJsonField(
                              widget.detalhesUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.apiResultnsu?.jsonBody ?? ''),
                              r'''$..error''',
                            ).toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '50',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 52,
                                  ),
                            ),
                            Text(
                              'Créditos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '${(10 * 15).toString()} min',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
