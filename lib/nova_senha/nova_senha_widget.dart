import 'package:easy_debounce/easy_debounce.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'nova_senha_model.dart';
export 'nova_senha_model.dart';

class NovaSenhaWidget extends StatefulWidget {
  const NovaSenhaWidget({Key? key}) : super(key: key);

  @override
  _NovaSenhaWidgetState createState() => _NovaSenhaWidgetState();
}

class _NovaSenhaWidgetState extends State<NovaSenhaWidget> {
  late NovaSenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NovaSenhaModel());

    _model.cpfController ??= TextEditingController(text: FFAppState().documento);
    _model.senhaController ??= TextEditingController();
    _model.confirmaSenhaController ??= TextEditingController();
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
            'Alterar senha',
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
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Crie uma nova senha',
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: TextFormField(
                              controller: _model.senhaController,
                              autofocus: true,
                              obscureText: !_model.senhaVisibility,
                              onChanged: (_) => EasyDebounce.debounce(
                                  '_model.senhaController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                              decoration: InputDecoration(
                                labelText: 'Crie uma senha',
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.senhaVisibility =
                                        !_model.senhaVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.senhaVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                    fontWeight: FontWeight.w600,
                                  ),
                              keyboardType: TextInputType.visiblePassword,
                              validator: _model.senhaControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: _model.confirmaSenhaController,
                                autofocus: true,
                                obscureText: !_model.confirmaSenhaVisibility,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.confirmaSenhaController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Repetir senha',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
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
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.confirmaSenhaVisibility =
                                          !_model.confirmaSenhaVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.confirmaSenhaVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                validator: _model.confirmaSenhaControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SelectionArea(
                                child: Text(
                              'Torne sua senha mais segura:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                    fontSize: 18,
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaMinLength(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions.validaMinLength(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Use mais de 8 digitos',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaUpperCase(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions.validaUpperCase(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Uma letra maiúscula',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaLowerCase(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions.validaLowerCase(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Uma letra minúscula',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaSpecialCharecters(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions.validaSpecialCharecters(
                                      _model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Um caractere especial',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions
                                      .validaNumeros(_model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions
                                      .validaNumeros(_model.senhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Ao menos um número',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaPasswordMatch(
                                      _model.senhaController!.text,
                                      _model.confirmaSenhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFB4B4B4),
                                        size: 20,
                                      ),
                                    ),
                                  if (functions.validaPasswordMatch(
                                      _model.senhaController!.text,
                                      _model.confirmaSenhaController!.text))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF2744B2),
                                        size: 20,
                                      ),
                                    ),
                                  SelectionArea(
                                      child: Text(
                                    'Senhas iguais',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 60),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          FFAppState().update(() {
                            FFAppState().senhaCadastro =
                                _model.senhaController!.text;
                            FFAppState().receberEmail = FFAppState().receberEmail;
                          });
                          _model.apiCallOutput = await UsuarioGroup.pUTSenhaCall.call(
                              documento:  FFAppState().documento,
                              senha: _model.senhaController!.text,
                            );
          
                          context.pop();
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
