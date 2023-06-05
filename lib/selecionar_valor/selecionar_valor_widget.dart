import 'package:mob_livree/selecionar_valor/selecinar_valor_model.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/adicionar_saldo/adicionar_saldo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelecionarValorWidget extends StatefulWidget {
  const SelecionarValorWidget({
    Key? key,
    this.detalhesUser,
  }) : super(key: key);

  final dynamic detalhesUser;

  @override
  _SelecionarValorWidgetState createState() => _SelecionarValorWidgetState();
}

class _SelecionarValorWidgetState extends State<SelecionarValorWidget> {
  late SelecionarValorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecionarValorModel());
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
            'Selecionar valor',
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
                      FFAppState().saldo = 10.0;
                    });
                    _model.apiResult7v5 = await UsuarioGroup.criarPixCall.call(
                      email: FFAppState().emailPersist,
                      transactionAmount: FFAppState().saldo,
                    );
                    if ((_model.apiResult7v5?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().idPix = getJsonField(
                          (_model.apiResult7v5?.jsonBody ?? ''),
                          r'''$..id''',
                        ).toString();
                        FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v5?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                      });

                      context.pushNamed('MercadoPago');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro inexperado.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFFD6C72),
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
                              '+10',
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
                      FFAppState().saldo = 15.0;
                    });
                    _model.apiResult7v9 = await UsuarioGroup.criarPixCall.call(
                      email: FFAppState().emailPersist,
                      transactionAmount: FFAppState().saldo,
                    );
                    if ((_model.apiResult7v9?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().idPix = getJsonField(
                          (_model.apiResult7v9?.jsonBody ?? ''),
                          r'''$..id''',
                        ).toString();
                        FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v9?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                      });

                      context.pushNamed('MercadoPago');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro inexperado.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFFD6C72),
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
                              '+15',
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
                      FFAppState().saldo = 20.0;
                    });
                    _model.apiResult7v7 = await UsuarioGroup.criarPixCall.call(
                      email: FFAppState().emailPersist,
                      transactionAmount: FFAppState().saldo,
                    );
                    if ((_model.apiResult7v7?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().idPix = getJsonField(
                          (_model.apiResult7v7?.jsonBody ?? ''),
                          r'''$.id''',
                        ).toString();
                        FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v7?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                      });

                      context.pushNamed('MercadoPago');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro inexperado.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFFD6C72),
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
                              '+20',
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
                      FFAppState().saldo = 50.0;
                    });
                    _model.apiResult7v8 = await UsuarioGroup.criarPixCall.call(
                      email: FFAppState().emailPersist,
                      transactionAmount: FFAppState().saldo,
                    );
                    if ((_model.apiResult7v8?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().idPix = getJsonField(
                          (_model.apiResult7v8?.jsonBody ?? ''),
                          r'''$..id''',
                        ).toString();
                        FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v8?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                      });

                      context.pushNamed('MercadoPago');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro inexperado.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFFD6C72),
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
                              '+50',
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
                      FFAppState().saldo = 100.0;
                    });
                    _model.apiResult7v6 = await UsuarioGroup.criarPixCall.call(
                      email: FFAppState().emailPersist,
                      transactionAmount: FFAppState().saldo,
                    );
                    if ((_model.apiResult7v6?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().idPix = getJsonField(
                          (_model.apiResult7v6?.jsonBody ?? ''),
                          r'''$..id''',
                        ).toString();
                        FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v6?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                      });

                      context.pushNamed('MercadoPago');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Erro inexperado.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFFD6C72),
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
                              '+100',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
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
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (bottomSheetContext) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Padding(
                            padding:
                                MediaQuery.of(bottomSheetContext).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: AdicionarSaldoWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
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
                              'Outros valores',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    fontSize: 32,
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
