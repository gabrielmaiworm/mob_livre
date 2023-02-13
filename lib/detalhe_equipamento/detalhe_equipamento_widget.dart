import 'package:mob_livree/components/logar_widget.dart';

import '../backend/api_requests/api_calls.dart';
import '../components/definir_horario_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalheEquipamentoWidget extends StatefulWidget {
  const DetalheEquipamentoWidget({
    Key? key,
    this.detalhesEquip,
  }) : super(key: key);

  final dynamic detalhesEquip;

  @override
  _DetalheEquipamentoWidgetState createState() =>
      _DetalheEquipamentoWidgetState();
}

class _DetalheEquipamentoWidgetState extends State<DetalheEquipamentoWidget> {
  ApiCallResponse? apiResultnsu;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
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
    'Equipamento',
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
              Image.network(
                'https://tix.life/wp-content/uploads/2019/08/KIT-LIVRE-CHIVAS-3.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionArea(
                        child: Text(
                      getJsonField(
                        widget.detalhesEquip,
                        r'''$..nome_equipamento''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                          ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectionArea(
                        child: Text(
                      'Nº de série',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                    SelectionArea(
                        child: Text(
                      getJsonField(
                        widget.detalhesEquip,
                        r'''$..numero_serie_equipamento''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectionArea(
                        child: Text(
                      'Bateria',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                    SelectionArea(
                        child: Text(
                      '${getJsonField(
                        widget.detalhesEquip,
                        r'''$..carga''',
                      ).toString()} %',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                  ],
                ),
              ),
              if (FFAppState().horaReserva != null)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectionArea(
                        child: Text(
                      'Horário Reserva',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                    SelectionArea(
                        child: Text(
                      dateTimeFormat('Hm', FFAppState().horaReserva),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    )),
                  ],
                ),
              ),
              
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional(0, 0.25),
                  children: [
                    if (FFAppState().horaReserva != null)
                    FFButtonWidget(
                      onPressed: () async {
                        apiResultnsu = await UsuarioGroup.buscarUsuarioPorEmailCall.call(
                          email: FFAppState().emailPersist,
                        );
                        if ((apiResultnsu?.succeeded ?? true)) {
                          context.pushNamed('Pagamento');
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
                                  height: MediaQuery.of(context).size.height * 0.70,
                                  child: LogarWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        }
                        setState(() {});
                      },
                      text: 'Efetuar Pagamento',
                      options: FFButtonOptions(
                        width: 250,
                        height: 45,
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
                    Align(
                      alignment: AlignmentDirectional(-0.35, -0.2),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: DefinirHorarioWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: 'Definir Horário de Retirada',
                            options: FFButtonOptions(
                              width: 250,
                              height: 45,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
