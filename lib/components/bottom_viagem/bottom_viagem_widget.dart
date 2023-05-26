import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottom_viagem_model.dart';
export 'bottom_viagem_model.dart';
var horaSol;
var horaDev;

class BottomViagemWidget extends StatefulWidget {
  const BottomViagemWidget({
    Key? key,
    this.detalhesViagem,
  }) : super(key: key);

  final dynamic detalhesViagem;

  @override
  _BottomViagemWidgetState createState() => _BottomViagemWidgetState();
}

class _BottomViagemWidgetState extends State<BottomViagemWidget> {
  late BottomViagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomViagemModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        widget.detalhesViagem,
        r'''$..sugestao''',
      ).toString().toString(),
      'Sem sugestões...',
    ));
    horaSol = getJsonField(
      widget.detalhesViagem,
      r'''$..data_solicitacao''',
      ).toString();
    horaDev = getJsonField(
      widget.detalhesViagem,
      r'''$..data_devolucao''',
      ).toString();
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
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 4, 16, 0),
                            child: Text(
                              functions.formatDateTime(getJsonField(
                                widget.detalhesViagem,
                                r'''$..data_solicitacao''',
                              ).toString()),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF14181B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/addImage@2x.png',
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://imgs.casasbahia.com.br/1501531919/1xg.jpg',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://imgs.casasbahia.com.br/1501531919/1xg.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Parceiro: ',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: getJsonField(
                              widget.detalhesViagem,
                              r'''$..nome_fantasia''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Retirada: ',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: functions.formatHour(getJsonField(
                              widget.detalhesViagem,
                              r'''$..data_solicitacao''',
                            ).toString()),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Devolução: ',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: functions.formatHour(getJsonField(
                              widget.detalhesViagem,
                              r'''$..data_devolucao''',
                            ).toString()),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Percorrido: ',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: '11',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                          ),
                          TextSpan(
                            text: ' km',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                    ),
                    
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tempo de uso: ',
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: functions.formatDuration(horaDev, horaSol),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: TextFormField(
                        controller: _model.textController,
                        readOnly: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Sugestões',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).bodyText1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF1D4F9A),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1D4F9A),
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        minLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
