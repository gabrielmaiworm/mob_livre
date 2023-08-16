import '../components/definir_horario_widget.dart';
import '../components/logar_widget.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detalhe_equipamento_model.dart';
export 'detalhe_equipamento_model.dart';

class DetalheEquipamentoWidget extends StatefulWidget {
  const DetalheEquipamentoWidget({
    Key? key,
    this.detalhesEquip,
    this.detalhesParceiro,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detalhesParceiro;
  final dynamic detailUser;

  @override
  _DetalheEquipamentoWidgetState createState() =>
      _DetalheEquipamentoWidgetState();
}

class _DetalheEquipamentoWidgetState extends State<DetalheEquipamentoWidget> {
  late DetalheEquipamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalheEquipamentoModel());
    if(FFAppState().kit == 0) {
      FFAppState().kit = getJsonField(
      widget.detalhesEquip,
      r'''$..kit''',
      );
    }
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
        title: SelectionArea(
            child: Text(
          'Conjunto',
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
                                 (() {
                                    final nomeEquipamento = getJsonField(widget.detalhesEquip, r'''$..nome_equipamento''');
                                    return nomeEquipamento != null ? nomeEquipamento.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..nome_equipamento''').toString();
                                  })(),
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
                              Text(
                                valueOrDefault<String>(
                                   (() {
                                    final rebocado = getJsonField(widget.detalhesEquip, r'''$..rebocado''');
                                    return rebocado != null ? rebocado.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..rebocado''').toString();
                                  })(),
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
                                  (() {
                                    final kit = getJsonField(widget.detalhesEquip, r'''$..kit''');
                                    return kit != null ? kit.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..kit''').toString();
                                  })(),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Carga da bateria',
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
                                  '${ (() {
                                    final carga = getJsonField(widget.detalhesEquip, r'''$..carga''');
                                    return carga != null ? carga.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..carga''').toString();
                                  })()}%',
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
                        //         'Parceiro',
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
                        //            (() {
                        //             final nomeFantasia = getJsonField(widget.detalhesEquip, r'''$..nome_fantasia''');
                        //             return nomeFantasia != null ? nomeFantasia.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..nome_fantasia''').toString();
                        //           })(),
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
                        //       Expanded(
                        //         child: Text(
                        //            (() {
                        //             final razaoSocial = getJsonField(widget.detalhesEquip, r'''$..razao_social''');
                        //             return razaoSocial != null ? razaoSocial.toString() : getJsonField(FFAppState().dadosEquipamento, r'''$..razao_social''').toString();
                        //           })(),
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
                      ],
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: 
                FFButtonWidget(
                  onPressed: () async {
                    _model.apiResultnsu = await UsuarioGroup.buscarUsuarioPorEmailCall.call(
                      email: FFAppState().emailPersist,
                    );
                    if ((_model.apiResultnsu?.succeeded ?? true)) {
                      _model.resultadoApiCall =
                          await UsuarioGroup.detalhesDoUsuarioCall.call(
                        email: FFAppState().emailPersist,
                      );
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: DefinirHorarioWidget(
                                dadosUser: getJsonField(
                                  (_model.resultadoApiCall?.jsonBody ?? ''),
                                  r'''$''',
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                      FFAppState().kit = getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..kit''',
                                  );
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: LogarWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }
                    setState(() {                
                      FFAppState().horaMs = DateTime.now().millisecondsSinceEpoch;
                      FFAppState().numeroEquipamento = getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..kit''',
                                  );
                     
                    });
                  },
                  text: 'Reservar conjunto',
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
    );
  }
}
