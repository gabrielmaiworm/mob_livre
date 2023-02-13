import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroSenhaWidget extends StatefulWidget {
  const CadastroSenhaWidget({Key? key}) : super(key: key);

  @override
  _CadastroSenhaWidgetState createState() => _CadastroSenhaWidgetState();
}

class _CadastroSenhaWidgetState extends State<CadastroSenhaWidget> {
  TextEditingController? confirmaSenhaController;
  late bool confirmaSenhaVisibility;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  bool? switchValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    confirmaSenhaController = TextEditingController();
    confirmaSenhaVisibility = false;
    senhaController = TextEditingController();
    senhaVisibility = false;
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    confirmaSenhaController?.dispose();
    senhaController?.dispose();
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
          'Cadastrar senha',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 50, 15, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SelectionArea(
                                child: Text(
                              'Para seguir para a próxima etapa, insira sua senha.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: senhaController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'senhaController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                obscureText: !senhaVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Crie uma senha',
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
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => senhaVisibility = !senhaVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      senhaVisibility
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Senha obrigatória';
                                  }

                                  if (val.length < 8) {
                                    return 'A senha deve ter mais de 8 digítos';
                                  }

                                  if (!RegExp('').hasMatch(val)) {
                                    return 'Invalid text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: confirmaSenhaController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'confirmaSenhaController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                obscureText: !confirmaSenhaVisibility,
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
                                      EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => confirmaSenhaVisibility =
                                          !confirmaSenhaVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      confirmaSenhaVisibility
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions
                                      .validaMinLength(senhaController!.text))
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
                                      .validaMinLength(senhaController!.text))
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions
                                      .validaUpperCase(senhaController!.text))
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
                                      .validaUpperCase(senhaController!.text))
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions
                                      .validaLowerCase(senhaController!.text))
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
                                      .validaLowerCase(senhaController!.text))
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaSpecialCharecters(
                                      senhaController!.text))
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
                                      senhaController!.text))
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions
                                      .validaNumeros(senhaController!.text))
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
                                      .validaNumeros(senhaController!.text))
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!functions.validaPasswordMatch(
                                      senhaController!.text,
                                      confirmaSenhaController!.text))
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
                                      senhaController!.text,
                                      confirmaSenhaController!.text))
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Switch.adaptive(
                            value: switchValue ??= false,
                            onChanged: (newValue) async {
                              setState(() => switchValue = newValue!);
                            },
                          ),
                          SelectionArea(
                              child: Text(
                            'Aceito receber e-mails informativos',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Marque a opção para seguir com seu cadastro',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                          )),
                        ],
                      ),
                    ),
                    if (functions.validaNumeros(senhaController!.text) &&
                        functions.validaUpperCase(senhaController!.text) &&
                        functions.validaLowerCase(senhaController!.text) &&
                        functions
                            .validaSpecialCharecters(senhaController!.text) &&
                        functions.validaMinLength(senhaController!.text) &&
                        switchValue!)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            FFAppState().update(() {
                              FFAppState().senhaCadastro =
                                  senhaController!.text;
                              FFAppState().receberEmail =
                                  FFAppState().receberEmail;
                            });

                            context.pushNamed('CadastroDados');
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: 210,
                            height: 40,
                            color: Color(0xFF1D4F9A),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                    if (!(functions.validaNumeros(senhaController!.text) &&
                        functions.validaUpperCase(senhaController!.text) &&
                        functions.validaLowerCase(senhaController!.text) &&
                        functions
                            .validaSpecialCharecters(senhaController!.text) &&
                        functions.validaMinLength(senhaController!.text) &&
                        switchValue!))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 40),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: 210,
                            height: 40,
                            color: Color(0xFFA39F9F),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }
}
