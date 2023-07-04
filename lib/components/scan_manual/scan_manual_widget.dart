import '../../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'scan_manual_model.dart';
export 'scan_manual_model.dart';

class ScanManualWidget extends StatefulWidget {
  const ScanManualWidget({
    Key? key,
    this.detailUser,
  }) : super(key: key);

  final dynamic detailUser;

  @override
  _ScanManualWidgetState createState() => _ScanManualWidgetState();
}

class _ScanManualWidgetState extends State<ScanManualWidget> {
  late ScanManualModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanManualModel());

    _model.numeroSerieController ??= TextEditingController();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
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
                    'Digite o número de série do equipamento ou escaneie o QRcode',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _model.numeroSerieController,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF00000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF00000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1D4F9A),
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 45,
                    fillColor: Color(0xFF1D4F9A),
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      _model.resultTextApi = await EquipamentoGroup
                          .gETDetalhesEquipamentoCall
                          .call(
                        numeroSerieEquipamento: _model.numeroSerieController!.text);
                        setState(() {
                          FFAppState().kit = getJsonField(
                            (_model.resultTextApi?.jsonBody ?? ''),
                            r'''$..kit''',
                          );
                        });
                      _model.resultApi = await EquipamentoGroup
                          .gETTaxaEquipamentoCall
                          .call(
                        numeroSerieEquipamento: FFAppState().kit); 
                        setState(() {
                          FFAppState().taxaMinuto = getJsonField(
                            (_model.resultApi?.jsonBody ?? ''),
                            r'''$..taxaMinuto''',
                          );
                          FFAppState().dadosEquipamento =
                              (_model.resultTextApi?.jsonBody ?? '');
                        }
                        );
                      if ((_model.resultTextApi?.succeeded ?? true)) {
                        context.pushNamed(
                          'DetalheEquipamentoRetirar',
                          queryParams: {
                            'detalhesEquip': serializeParam(
                              (_model.resultTextApi?.jsonBody ?? ''),
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
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Atenção'),
                              content: Text('Equipamento não encontrado!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      setState(() {});
                    },
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
                    _model.qrCode = await FlutterBarcodeScanner.scanBarcode(
                      '#C62828', // scanning line color
                      'Cancelar', // cancel button text
                      true, // whether to show the flash icon
                      ScanMode.QR,
                    );
                    if (_model.qrCode != null && _model.qrCode != '') {
                       
                      _model.apiResult4dt = await EquipamentoGroup
                          .gETDetalhesEquipamentoCall
                          .call(
                        numeroSerieEquipamento: _model.qrCode,
                      );
                      setState(() {
                        FFAppState().kit = getJsonField(
                          (_model.apiResult4dt?.jsonBody ?? ''),
                          r'''$..kit''',
                        );
                      });
                      _model.resultApi = await EquipamentoGroup
                          .gETTaxaEquipamentoCall
                          .call(
                        numeroSerieEquipamento: FFAppState().kit);
                      setState(() {
                        FFAppState().taxaMinuto = getJsonField(
                            (_model.resultApi?.jsonBody ?? ''),
                            r'''$..taxaMinuto''',
                          );
                        FFAppState().dadosEquipamento =
                            (_model.apiResult4dt?.jsonBody ?? '');
                      });
                      if ((_model.apiResult4dt?.succeeded ?? true)) {
                        context.pushNamed(
                          'DetalheEquipamentoRetirar',
                          queryParams: {
                            'detalhesEquip': serializeParam(
                              (_model.apiResult4dt?.jsonBody ?? ''),
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
                              'Equipamento não encontrado!',
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
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Falha ao scanear qrcode.',
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
                  text: 'ScanQR',
                  options: FFButtonOptions(
                    width: 150,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF1D4F9A),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
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
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Cancelar',
                  options: FFButtonOptions(
                    width: 150,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF1D4F9A),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
