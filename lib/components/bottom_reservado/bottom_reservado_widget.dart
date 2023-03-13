import '../../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottom_reservado_model.dart';
import 'bottom_reservado_model.dart';
export 'bottom_reservado_model.dart';

class BottomReservadoWidget extends StatefulWidget {
  const BottomReservadoWidget({Key? key}) : super(key: key);

  @override
  _BottomReservadoWidgetState createState() => _BottomReservadoWidgetState();
}

class _BottomReservadoWidgetState extends State<BottomReservadoWidget> {
  late BottomReservadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomReservadoModel());
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
            color: Color(0xFF1D4F9A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(1),
              topRight: Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SelectionArea(
                          child: Text(
                        'Você reservou um conjunto!\nVeja os detalhes na aba lateral.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
