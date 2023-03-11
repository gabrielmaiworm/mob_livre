import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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

    return Scaffold(
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
            color: Color(0xFF1D4F9A),
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: SelectionArea(
            child: Text(
          'Viagens',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF1D4F9A),
                fontSize: 20,
              ),
        )),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(UsuarioGroup.historicoSolicitacoesCall
                                  .call()))
                        .future,
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
                      final listViewHistoricoSolicitacoesResponse =
                          snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final detailHistorico = getJsonField(
                            listViewHistoricoSolicitacoesResponse.jsonBody,
                            r'''$''',
                          ).toList();
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleter();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: detailHistorico.length,
                              itemBuilder: (context, detailHistoricoIndex) {
                                final detailHistoricoItem =
                                    detailHistorico[detailHistoricoIndex];
                                return Visibility(
                                  visible: FFAppState().documento ==
                                      getJsonField(
                                        detailHistoricoItem,
                                        r'''$..documento''',
                                      ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      functions.formatDateTime(
                                                          getJsonField(
                                                        detailHistoricoItem,
                                                        r'''$..data_solicitacao''',
                                                      ).toString()),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 5, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    detailHistoricoItem,
                                                                    r'''$..foto''',
                                                                  ),
                                                                  'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500',
                                                                ),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  detailHistoricoItem,
                                                                  r'''$..foto''',
                                                                ),
                                                                'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500' +
                                                                    '$detailHistoricoIndex',
                                                              ),
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: valueOrDefault<
                                                            String>(
                                                          getJsonField(
                                                            detailHistoricoItem,
                                                            r'''$..foto''',
                                                          ),
                                                          'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500' +
                                                              '$detailHistoricoIndex',
                                                        ),
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                detailHistoricoItem,
                                                                r'''$..foto''',
                                                              ),
                                                              'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'N° equipamento: ${getJsonField(
                                                        detailHistoricoItem,
                                                        r'''$..numero_serie_equipamento''',
                                                      ).toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if(getJsonField(
                                                          detailHistoricoItem,
                                                          r'''$..sugestao''',
                                                        ).toString() != null)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 5, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 0),
                                                    child: Icon(
                                                      Icons.textsms,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Sugestão: ${valueOrDefault<String>(
                                                        getJsonField(
                                                          detailHistoricoItem,
                                                          r'''$..sugestao''',
                                                        ).toString(),
                                                        'N/A',
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
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
