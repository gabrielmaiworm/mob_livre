import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'definir_horario_model.dart';
export 'definir_horario_model.dart';

class DefinirHorarioWidget extends StatefulWidget {
  const DefinirHorarioWidget({Key? key}) : super(key: key);

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
    _model.dispose();

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
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'Selecionar Horário',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 85,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat('d/M H:mm', _model.datePicked),
                                  '00 : 00',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 42,
                                    ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    _model.datePicked = date;
                                  });
                                },
                                currentTime: getCurrentTimestamp,
                                minTime: getCurrentTimestamp,
                              );
                            },
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: Color(0xFF1D4F9A),
                              size: 200,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                child: InkWell(
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().horaReserva =
                                          _model.datePicked;
                                    });
                                    Navigator.pop(context);
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
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
          ],
        ),
      ],
    );
  }
}
