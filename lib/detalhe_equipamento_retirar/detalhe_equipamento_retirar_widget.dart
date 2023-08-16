import 'package:flutter/scheduler.dart';

import '../components/devolucao_concluida/devolucao_concluida_widget.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'detalhe_equipamento_retirar_model.dart';
export 'detalhe_equipamento_retirar_model.dart';

class DetalheEquipamentoRetirarWidget extends StatefulWidget {
  const DetalheEquipamentoRetirarWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detailUser;

  @override
  _DetalheEquipamentoRetirarWidgetState createState() =>
      _DetalheEquipamentoRetirarWidgetState();
}

class _DetalheEquipamentoRetirarWidgetState
    extends State<DetalheEquipamentoRetirarWidget> {
  late DetalheEquipamentoRetirarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalheEquipamentoRetirarModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
    _model.apiResultki5 =
              await UsuarioGroup.pOSTSaldoUserCall.call(
            documento: FFAppState().documento,
          );
    setState(() {
          FFAppState().credito = double.parse(getJsonField(
                              (_model.apiResultki5?.jsonBody ?? ''),
                              r'''$..saldo''',
          ));
        });
      _model.apiResultki56 =
          await EquipamentoGroup.gETTaxaEquipamentoCall.call(
        numeroSerieEquipamento: FFAppState().kit.toString(),
      );
      if ((_model.apiResultki56?.succeeded ?? true)) {
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    setState(() {
      FFAppState().numeroSEquip = getJsonField(
      widget.detalhesEquip,
      r'''$..numero_serie_equipamento''',
      ).toString();
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          title: SelectionArea(
              child: Text(
            'Detalhes do Conjunto',
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
          top: true,
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
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      widget.detalhesEquip,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 40, 5, 0),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Selecione o tempo que deseja alugar:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF1D4F9A),
                                  fontSize: 15,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saldo:',
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
                                    formatador.format(FFAppState().credito),
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    inactiveColor: Color(0xFFA5A5A5),
                    min: 0,
                    max: FFAppState().credito <= 0 ? 0 : double.parse(((FFAppState().credito - 0.2) / FFAppState().taxaMinuto).toStringAsFixed(2)),
                    value: (_model.sliderValue ??= 0),
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(2));
                      setState(() => _model.sliderValue = newValue);
                    },
                  ),
                ),
                Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Taxa por minuto',
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
                                    formatador.format(FFAppState().taxaMinuto),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Minutos disponíveis',
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
                                    '${_model.sliderValue ?? 0} min',
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 10, 25, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Valor total:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Expanded(
                                  child: Text(
                                    formatador.format((_model.sliderValue ?? 0) * FFAppState().taxaMinuto),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 30),
                  child: FFButtonWidget(
                    onPressed: () async {
                     _model.apiResultnsu =
                        await EquipamentoGroup.pOSTSolicitacaoCall.call(
                      documento: FFAppState().documento,
                      numeroSerieEquipamento: FFAppState().numeroSEquip,
                      valor: double.parse((_model.sliderValue! * FFAppState().taxaMinuto).toStringAsFixed(2)),
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
                              widget.detailUser,
                              r'''$''',
                            ),
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                        
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Você retirou o conjunto com sucesso!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              Color(0xFF5DEA5C),
                        ),
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
                    text: 'Confirmar',
                    options: FFButtonOptions(
                      width: 250,
                      height: 45,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF1D4F9A),
                      textStyle:
                          FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      elevation: 2,
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
