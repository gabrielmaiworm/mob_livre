import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'viagens_model.dart';
export 'viagens_model.dart';

class ViagensWidget extends StatefulWidget {
  const ViagensWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detailUser;

  @override
  _ViagensWidgetState createState() => _ViagensWidgetState();
}

class _ViagensWidgetState extends State<ViagensWidget> {
  late ViagensModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViagensModel());
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
    final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
            child: Text(
              'Viagens',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: UsuarioGroup.historicoViagemCall.call(
                    documento: FFAppState().documento,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    final columnHistoricoViagemResponse = snapshot.data!;
                    return (columnHistoricoViagemResponse.statusCode != 500) 
                              ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: Text(
                                    'Anteriores',
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF586269),
                                          fontSize: 16,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: 
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 245,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              'https://i.stack.imgur.com/1XPRz.png',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '${getJsonField(
                                            columnHistoricoViagemResponse
                                                .jsonBody,
                                            r'''$..[0].parceiro.nome_fantasia''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF1D4F9A),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          (getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].data_solicitacao''') != null && getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].data_devolucao''') != null) 
                                          ? "${functions.formatDateTimeCompleto(getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].data_solicitacao''').toString())} - ${functions.formatDateTimeHorario(getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].data_devolucao''').toString())}"
                                          : "Sem data",
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF1D4F9A),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].total_pago''') != null 
                                            ? formatador.format(getJsonField(columnHistoricoViagemResponse.jsonBody, r'''$..[0].total_pago'''))
                                            : 'Valor Indisponível',
                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1D4F9A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final viagemItem = getJsonField(
                                  columnHistoricoViagemResponse.jsonBody,
                                  r'''$..results''',
                                )?.toList();  // Usando o operador ?. para tratar possíveis nulos

                                if (viagemItem == null || viagemItem.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'Não há viagens feitas ainda.',
                                      style: TextStyle(
                                        // Estilize conforme necessário
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                };
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: viagemItem.length,
                                  itemBuilder: (context, viagemItemIndex) {
                                    final viagemItemItem =
                                        viagemItem[viagemItemIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'ViagensDetalhes',
                                          queryParams: {
                                            'detalhesViagem': serializeParam(
                                              getJsonField(
                                                viagemItemItem,
                                                r'''$''',
                                              ),
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Card(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 0,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      5, 5, 5, 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          child: Image.asset(
                                                            'assets/images/Cadeirante_azul.png',
                                                            width: 75,
                                                            height: 75,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(10,
                                                                        0, 0, 0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${getJsonField(
                                                                    viagemItemItem,
                                                                    r'''$..parceiro.nome_fantasia''',
                                                                  ).toString()}'
                                                                      .maybeHandleOverflow(
                                                                          maxChars:
                                                                              25),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(
                                                                                context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (getJsonField(viagemItemItem, r'''$..data_solicitacao''') != null && getJsonField(viagemItemItem, r'''$..data_devolucao''') != null) 
                                                                    ? "${functions.formatDateTimeCompleto(getJsonField(viagemItemItem, r'''$..data_solicitacao''').toString())} - ${functions.formatDateTimeHorario(getJsonField(viagemItemItem, r'''$..data_devolucao''').toString())}"
                                                                    : "Sem data",
                                                                  style: FlutterFlowTheme.of(context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily: 'Poppins',
                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(viagemItemItem, r'''$..total_pago''') != null 
                                                                    ? formatador.format(getJsonField(viagemItemItem, r'''$..total_pago'''))
                                                                    : 'Valor Indisponível',
                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                    fontFamily: 'Poppins',
                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 20, 0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .chevronRight,
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                      size: 26,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              indent: 90,
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ) : Center(
                                    child: Text(
                                      'Histórico de viagens vazio.',
                                      style: TextStyle(
                                        // Estilize conforme necessário
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
