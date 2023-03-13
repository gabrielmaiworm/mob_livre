import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/custom_functions.dart' as functions;

import 'login_senha_model.dart';
export 'login_senha_model.dart';

class LoginSenhaWidget extends StatefulWidget {
  const LoginSenhaWidget({Key? key}) : super(key: key);

  @override
  _LoginSenhaWidgetState createState() => _LoginSenhaWidgetState();
}

class _LoginSenhaWidgetState extends State<LoginSenhaWidget> {
  late LoginSenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSenhaModel());

    _model.senhaController = TextEditingController();
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
          'Acessar Conta',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 50, 15, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SelectionArea(
                            child: Text(
                          'E-mail já cadastrado,  insira sua senha para continuar.',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
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
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _model.senhaController,
                            obscureText: !_model.senhaVisibility,
                            decoration: InputDecoration(
                              labelText: 'Senha',
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('RecuperarSenha');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectionArea(
                            child: Text(
                          'Esqueceu sua senha? ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )),
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('RecuperarSenha');
                          },
                          text: 'Recuperar',
                          options: FFButtonOptions(
                            width: 120,
                            height: 25,
                            color: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                    ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Generated code for this Button Widget...
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
  child: FFButtonWidget(
    onPressed: () async {
      _model.apiResultw03 = await UsuarioGroup.loginCall.call(
        email: FFAppState().emailCadastro,
        senha: _model.senhaController!.text,
      );
      if ((_model.apiResultw03?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().emailLogado = FFAppState().emailCadastro;
          FFAppState().emailPersist = FFAppState().emailCadastro;
          FFAppState().sobrenome = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..sobrenome''',
          ).toString();
          FFAppState().nome = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$['nome']''',
          ).toString();
          FFAppState().documento = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$['documento']''',
          ).toString();
          FFAppState().nascimento = functions.formatDateTime(getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..data_de_nascicmento''',
          ).toString());
          FFAppState().celular = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..telefone''',
          ).toString();
          FFAppState().tipoLesao = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..nivel_lesao''',
          ).toString();
          FFAppState().situacaoLesao = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..situacao_lesao''',
          ).toString();
          FFAppState().detalhesLesao = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..detalhe_lesao''',
          ).toString();
          FFAppState().estado = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..estado''',
          ).toString();
          FFAppState().cidade = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..cidade''',
          ).toString();
          FFAppState().bairro = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..bairro''',
          ).toString();
          FFAppState().cep = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..cep''',
          ).toString();
          FFAppState().logradouro = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..logradouro''',
          ).toString();
          FFAppState().numero = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..numero''',
          ).toString();
          FFAppState().complemento = getJsonField(
            (_model.apiResultw03?.jsonBody ?? ''),
            r'''$..complemento''',
          ).toString();
          FFAppState().logado = true;
          FFAppState().senhaCadastro = _model.senhaController!.text;
          FFAppState().kit = valueOrDefault<int>(
            getJsonField(
              (_model.apiResultw03?.jsonBody ?? ''),
              r'''$..kit''',
            ),
            0,
          );
        });
        _model.apiResult7vn = await UsuarioGroup.usuarioSolicitacaoCall.call(
          documento: FFAppState().documento,
        );
        if ((_model.apiResult7vn?.succeeded ?? true)) {
          setState(() {
            FFAppState().dadosEquipamento = getJsonField(
              (_model.apiResult7vn?.jsonBody ?? ''),
              r'''$''',
            );
          });
          context.goNamed(
            'MapaAlugado',
            queryParams: {
              'detalhesEquip': serializeParam(
                getJsonField(
                  (_model.apiResult7vn?.jsonBody ?? ''),
                  r'''$''',
                ),
                ParamType.JSON,
              ),
            }.withoutNulls,
          );
        } else {
          context.goNamed(
            'MapaLogado',
            queryParams: {
              'dadosUser': serializeParam(
                (_model.apiResultw03?.jsonBody ?? ''),
                ParamType.JSON,
              ),
            }.withoutNulls,
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiResultw03?.jsonBody ?? ''),
                r'''$..error''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0xFFC15C5C),
          ),
        );
      }
      setState(() {});
    },
    text: 'Continuar',
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
)
,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
