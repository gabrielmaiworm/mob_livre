import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detalhe_equipamento_retirar_model.dart';
export 'detalhe_equipamento_retirar_model.dart';

class DetalheEquipamentoRetirarWidget extends StatefulWidget {
  const DetalheEquipamentoRetirarWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
    this.detalhesParceiro,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detalhesParceiro;
  final dynamic detailUser;

  @override
  _DetalheEquipamentoRetirarWidgetState createState() =>
      _DetalheEquipamentoRetirarWidgetState();
}

class _DetalheEquipamentoRetirarWidgetState
    extends State<DetalheEquipamentoRetirarWidget> {
  late DetalheEquipamentoRetirarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalheEquipamentoRetirarModel());
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
                                  widget.detalhesEquip,
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
                                    widget.detalhesEquip,
                                    r'''$..rebocado''',
                                  ).toString() != null)
                              Text(
                                  getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..rebocado''',
                                  ).toString(),     
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
                                    widget.detalhesEquip,
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
                                  '${getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..carga''',
                                  ).toString()}%',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tempo de uso (h)',
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
                                  '10:00',
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
                              if (getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..razao_social''',
                                  ).toString() == 'null')
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.detalhesParceiro,
                                    r'''$..nome_fantasia''',
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
                              if (getJsonField(
                                    widget.detalhesEquip,
                                    r'''$..razao_social''',
                                  ).toString() != 'null')
                              Expanded(
                                child: Text(
                                  getJsonField(
                                    widget.detalhesEquip,
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
                        'Clique no botão abaixo e aguarde o conjunto ser destravado da estação.',
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.apiResultnsu =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: getJsonField(
                        widget.detalhesEquip,
                        r'''$..numero_serie_equipamento''',
                      ).toString(),
                    );
                    if ((_model.apiResultnsu?.succeeded ?? true)) {
                      FFAppState().reservado = false;
                      FFAppState().horaReserva = DateTime.now(); 
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
                              widget.detailUser,
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
                  text: 'Retirar agora',
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
