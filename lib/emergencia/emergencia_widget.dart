import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'emergencia_model.dart';
export 'emergencia_model.dart';

class EmergenciaWidget extends StatefulWidget {
  const EmergenciaWidget({
    Key? key,
    this.detalhesApp,
  }) : super(key: key);

  final dynamic detalhesApp;

  @override
  _EmergenciaWidgetState createState() => _EmergenciaWidgetState();
}

class _EmergenciaWidgetState extends State<EmergenciaWidget> {
  late EmergenciaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergenciaModel());

    _model.textController ??= TextEditingController();
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
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: SelectionArea(
            child: Text(
          'Emergência',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 20,
              ),
        )),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  'https://img.freepik.com/premium-vector/emergency-siren-icon-comic-style-police-alarm-vector-cartoon-illustration-white-isolated-background-medical-alert-business-concept-splash-effect_157943-6732.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Você acionou a emergência!\nJá recebemos o seu chamado, estamos te localizando para enviar ajuda.  ',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Descreva o que houve em poucas palavras:',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Motivos da emergência..',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(1, 207, 9, 9),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(1, 221, 0, 0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 40),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.apiResultmdy = await EquipamentoGroup.pUTEmergenciaCall.call(
                        kit: FFAppState().kit,
                        motivoEmergencia: _model.textController!.text,
                      );
                      if ((_model.apiResultmdy?.succeeded ?? true)) {
                        context.pushNamed('EmergenciaAlerta');
                        setState(() {FFAppState().emergencia = true;});
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
                    text: 'Enviar',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
