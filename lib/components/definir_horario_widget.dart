import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'definir_horario_model.dart';
export 'definir_horario_model.dart';

class DefinirHorarioWidget extends StatefulWidget {
  const DefinirHorarioWidget({
    Key? key,
    this.dadosUser,
  }) : super(key: key);

  final dynamic dadosUser;

  @override
  _DefinirHorarioWidgetState createState() => _DefinirHorarioWidgetState();
}

class _DefinirHorarioWidgetState extends State<DefinirHorarioWidget> {
  late DefinirHorarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefinirHorarioModel());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    'Tempo de reserva',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF1D4F9A),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Você terá seu equipamento reservado até: ',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    
                                    Text(
                                       "${dateTimeFormat('Hm', DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 1800000))} ",
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 15, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await EquipamentoGroup.pOSTReservaCall
                                          .call(
                                        kit: FFAppState().kit,
                                        documento: FFAppState().documento,
                                      );
                                      FFAppState().update(() {
                                        FFAppState().reservado = true;
                                        FFAppState().horaMs = DateTime.now().millisecondsSinceEpoch;
                                      });

                                      context.goNamed('MapaReservado');
                                    },
                                    child: Text(
                                      'Confirmar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1D4F9A),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancelar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 17,
                                          ),
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
