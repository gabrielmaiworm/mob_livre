import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import 'adicionar_saldo_model.dart';
export 'adicionar_saldo_model.dart';

class AdicionarSaldoWidget extends StatefulWidget {
  const AdicionarSaldoWidget({
    Key? key,
    this.detailUser,
  }) : super(key: key);

  final dynamic detailUser;

  @override
  _AdicionarSaldoWidgetState createState() => _AdicionarSaldoWidgetState();
}

class _AdicionarSaldoWidgetState extends State<AdicionarSaldoWidget> {
  late AdicionarSaldoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarSaldoModel());

    _model.saldoController ??= TextEditingController();
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
      height: MediaQuery.of(context).size.height * 0.35,
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
                    'Digite o valor da recarga',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF1D4F9A),
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _model.saldoController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Valor',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
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
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1D4F9A),
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
                  Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                      setState(() {
                        FFAppState().saldo =
                            double.parse(_model.saldoController!.text);
                      });
                      _model.apiResult7v10 =
                          await UsuarioGroup.criarPixCall.call(
                        email: FFAppState().emailPersist,
                        transactionAmount: FFAppState().saldo,
                        documento: FFAppState().documento,
                        nome: FFAppState().nome,
                        sobrenome: FFAppState().sobrenome,
                      );
                      if ((_model.apiResult7v10?.succeeded ?? true)) {
                        setState(() {
                          FFAppState().idPix = getJsonField(
                            (_model.apiResult7v10?.jsonBody ?? ''),
                            r'''$..id''',
                          ).toString();
                          FFAppState().urlPagamento = getJsonField(
                          (_model.apiResult7v10?.jsonBody ?? ''),
                          r'''$..ticket_url''',
                        ).toString();
                        });

                        context.pushNamed('MercadoPago');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Erro inexperado.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFFFD6C72),
                          ),
                        );
                      }

                      setState(() {});
                    },
                                    text: 'Pagar com Pix',
                                    options: FFButtonOptions(
                                      width: 250,
                                      height: 45,
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
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      borderSide: BorderSide(
                                        color: Color(0xFF1D4F9A),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'O sistema só aceita pagamento via pix.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF1D4F9A),
                          fontSize: 14,
                        ),
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
