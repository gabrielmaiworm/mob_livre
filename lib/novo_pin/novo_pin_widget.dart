import 'package:easy_debounce/easy_debounce.dart';
import 'package:pinput/pinput.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'novo_pin_model.dart';
export 'novo_pin_model.dart';

class NovoPinWidget extends StatefulWidget {
  const NovoPinWidget({Key? key}) : super(key: key);

  @override
  _NovoPinWidgetState createState() => _NovoPinWidgetState();
}

class _NovoPinWidgetState extends State<NovoPinWidget> {
  late NovoPinModel _model;
  TextEditingController? pinController;


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NovoPinModel());

    _model.cpfController ??= TextEditingController(text: FFAppState().documento);
    pinController = TextEditingController();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(29, 79, 154, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  void dispose() {
    _model.dispose();
    pinController?.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: InkWell(
            onTap: () async {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF1D4F9A),
              size: 30,
            ),
          ),
          title: SelectionArea(
              child: Text(
            'Alterar PIN',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF1D4F9A),
                  fontSize: 20,
                ),
          )),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 50, 15, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Crie um novo PIN',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                          )),
                        ],
                      ),
                    ),         
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: _model.cpfController,
                                autofocus: true,
                                obscureText: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'CPF',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                keyboardType: TextInputType.number,
                                validator: _model.cpfControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),  
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                                'Insira 4 digitos para o PIN',
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1D4F9A),
                                    ),
                              ),
                        ],
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 35),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Pinput(             
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          showCursor: true,
                          controller: pinController,
                          onCompleted: (pin) => print(pinController),
                          ),
                       ],
                     ),
                   ), 
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 60),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          _model.apiCallOutput = await UsuarioGroup.alterarPinCall.call(
                              documento:  FFAppState().documento,
                              pin: pinController!.text,
                            );
                          await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('PIN Atualizado'),
                                          content: Text('O seu PIN foi atualizado com sucesso!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  context.pop(),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                        },
                        text: 'Salvar',
                        options: FFButtonOptions(
                          width: 210,
                          height: 40,
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
        ),
      ),
    );
  }
}
