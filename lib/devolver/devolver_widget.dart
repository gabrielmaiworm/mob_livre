import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'devolver_model.dart';
export 'devolver_model.dart';

class DevolverWidget extends StatefulWidget {
  const DevolverWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detailUser;

  @override
  _DevolverWidgetState createState() => _DevolverWidgetState();
}

class _DevolverWidgetState extends State<DevolverWidget> {
  late DevolverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevolverModel());
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
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
        ),
        title: SelectionArea(
            child: Text(
          'Devolver conjunto',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF1D4F9A),
                fontSize: 20,
              ),
        )),
        actions: [],
        centerTitle: true,
        elevation: 3,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.network(
                          'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500',
                        ).image,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFFEFEFE),
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                   getJsonField(
                                    FFAppState().dadosEquipamento,
                                    r'''$..nome_equipamento''',
                                  ).toString(),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 if (getJsonField(
                                      FFAppState().dadosEquipamento,
                                      r'''$..rebocado''',
                                    ).toString() != "null" && getJsonField(
                                      FFAppState().dadosEquipamento,
                                      r'''$..rebocado''',
                                    ).toString() != null)
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      FFAppState().dadosEquipamento,
                                      r'''$..rebocado''',
                                    ).toString(),
                                    'Rebocado',
                                      ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 40, 5, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ID Conjunto',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      FFAppState().dadosEquipamento,
                                      r'''$..kit''',
                                    ).toString(),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         'Carga da bateria',
                          //         style: FlutterFlowTheme.of(context)
                          //             .bodyText1
                          //             .override(
                          //               fontFamily: 'Poppins',
                          //               color: FlutterFlowTheme.of(context)
                          //                   .primaryColor,
                          //             ),
                          //       ),
                          //       Expanded(
                          //         child: Text(
                          //           '${getJsonField(
                          //             FFAppState().dadosEquipamento,
                          //             r'''$..carga''',
                          //           ).toString()}%',
                          //           textAlign: TextAlign.end,
                          //           style: FlutterFlowTheme.of(context)
                          //               .bodyText1
                          //               .override(
                          //                 fontFamily: 'Poppins',
                          //                 color: FlutterFlowTheme.of(context)
                          //                     .primaryColor,
                          //               ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Parceiro',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                                Expanded(
                                  child: Text(
                                    getJsonField(
                                      FFAppState().dadosEquipamento,
                                      r'''$..razao_social''',
                                    ).toString(),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35, 30, 35, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Primeiro, trave o conjunto na estação e clique no botão abaixo para continuar a devolução.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1D4F9A),
                                fontSize: 15,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'DevolverAvaliacao',
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
                              widget.detailUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Continuar',
                    options: FFButtonOptions(
                      width: 250,
                      height: 45,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF1D4F9A),
                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
