import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'email_enviado_copy_model.dart';
export 'email_enviado_copy_model.dart';

class EmailEnviadoCopyWidget extends StatefulWidget {
  const EmailEnviadoCopyWidget({
    Key? key,
    this.detailUser,
  }) : super(key: key);

  final dynamic detailUser;

  @override
  _EmailEnviadoCopyWidgetState createState() => _EmailEnviadoCopyWidgetState();
}

class _EmailEnviadoCopyWidgetState extends State<EmailEnviadoCopyWidget> {
  late EmailEnviadoCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailEnviadoCopyModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SelectionArea(
                                    child: Text(
                                  'Deseja devolvar seu equipamento?',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF1D4F9A),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Sugestões..',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Generated code for this Button Widget...
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.apiResult = await EquipamentoGroup.pUTDevolucaoCall.call(
                                      documento: FFAppState().documento,
                                      dataDevolucao: dateTimeFormat('d/M H:mm', getCurrentTimestamp),
                                      status: 'EM MANUTENÇÃO',
                                      sugestao: _model.textController!.text,
                                    );
                                    if ((_model.apiResult?.succeeded ?? true)) {
                                      context.pushNamed('MapaLogado');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Equipamento devolvido!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF70BB73),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Erro inesperado!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration: Duration(milliseconds: 4000),
                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                        ),
                                      );
                                    }
                                    setState(() {});
                                  },
                                  text: 'Sim',
                                  options: FFButtonOptions(
                                    width: 210,
                                    height: 40,
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
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: 'Não',
                                  options: FFButtonOptions(
                                    width: 210,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: Color(0xFF1D4F9A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
