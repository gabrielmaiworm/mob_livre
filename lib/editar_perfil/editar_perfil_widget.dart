import '../backend/api_requests/api_calls.dart';
import '../backend/supabase/supabase.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/uploaded_file.dart';
import 'editar_perfil_model.dart';
export 'editar_perfil_model.dart';

class EditarPerfilWidget extends StatefulWidget {
  const EditarPerfilWidget({
    Key? key,
    this.dadosUser,
  }) : super(key: key);

  final dynamic dadosUser;

  @override
  _EditarPerfilWidgetState createState() => _EditarPerfilWidgetState();
}

class _EditarPerfilWidgetState extends State<EditarPerfilWidget> {
  late EditarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarPerfilModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultff1 = await UsuarioGroup.buscarUsuarioPorEmailCall.call(
        email: FFAppState().emailPersist,
      );
    });

    _model.nomeController = TextEditingController(text: FFAppState().nome);
    _model.sobrenomeController =
        TextEditingController(text: FFAppState().sobrenome);
    _model.cpfController = TextEditingController(text: FFAppState().documento);
    _model.dataNascimentoController =
        TextEditingController(text: FFAppState().nascimento);
    _model.celularController =
        TextEditingController(text: FFAppState().celular);
    _model.detalheLesaoController = TextEditingController(text: FFAppState().detalhesLesao); 
    _model.estadoController = TextEditingController(text: FFAppState().estado);
    _model.cidadeController = TextEditingController(text: FFAppState().cidade);
    _model.bairroController = TextEditingController(text: FFAppState().bairro);
    _model.cepController = TextEditingController(text: FFAppState().cep);
    _model.logradouroController =
        TextEditingController(text: FFAppState().logradouro);
    _model.numeroController = TextEditingController(text: FFAppState().numero);
    _model.complementoController =
        TextEditingController(text: FFAppState().complemento);
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
          'Editar Informações',
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
            key: _model.formKey,
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
                              'Altere seus dados abaixo.',
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: TextFormField(
                              controller: _model.nomeController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nome',
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                    fontWeight: FontWeight.w600,
                                  ),
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
                                controller: _model.sobrenomeController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Sobrenome',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: TextFormField(
                                    controller: _model.cpfController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.cpfController',
                                      Duration(milliseconds: 2500),
                                      () async {
                                        _model.validacaoCPF =
                                            await actions.validadorCpf(
                                          _model.cpfController!.text,
                                        );

                                        setState(() {});
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'CPF',
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
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF1D4F9A),
                                          fontWeight: FontWeight.w600,
                                        ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [_model.cpfMask],
                                  ),
                                ),
                                if (_model.validacaoCPF == false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 5, 15, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'O CPF não é válido',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: TextFormField(
                                    controller: _model.dataNascimentoController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Data de nascimento',
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
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF1D4F9A),
                                          fontWeight: FontWeight.w600,
                                        ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      _model.dataNascimentoMask
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.celularController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Celular',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [_model.celularMask],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              child: FlutterFlowDropDown<String>(
                                initialOption: _model.dropDownLesaoValue ??=
                                    FFAppState().tipoLesao,
                                options: [
                                  'Amputado',
                                  'Mobilidade Reduzida',
                                  'Intelectual/Mental',
                                  'Sem Lesão'
                                ],
                                onChanged: (val) => setState(
                                    () => _model.dropDownLesaoValue = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                    ),
                                hintText: 'Nível de Lesão',
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF1D4F9A),
                                  size: 15,
                                ),
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Color(0xFF1D4F9A),
                                borderWidth: 1,
                                borderRadius: 8,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: SelectionArea(
                                child: Text(
                              'Situação',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                    fontSize: 20,
                                  ),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowRadioButton(
                          options: ['Temporária', 'Permanente'].toList(),
                          onChanged: (val) => setState(
                              () => _model.radioButtonSituacaoValue = val),
                          optionHeight: 25,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor: Color(0xFF1D4F9A),
                          inactiveRadioButtonColor: Color(0x8A000000),
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
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
                                controller: _model.detalheLesaoController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Detalhes da lesão',
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
                                          10, 10, 10, 10),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          final selectedMedia = await selectMediaWithSourceBottomSheet(
                            context: context,
                            storageFolderPath: 'documento',
                            allowPhoto: true,
                            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                            textColor: Colors.white,
                          );
                          if (selectedMedia != null &&
                              selectedMedia
                                  .every((m) => validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isMediaUploading1 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                      ))
                                  .toList();
                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'moblivre',
                                selectedMedia: selectedMedia,
                              );
                            } finally {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              _model.isMediaUploading1 = false;
                            }
                            if (selectedUploadedFiles.length == selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                _model.uploadedFileUrl1 = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(context, 'Failed to upload media');
                              return;
                            }
                          }
                          setState(() {
                            FFAppState().fotoPerfil = _model.uploadedFileUrl1;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().fotoPerfil,
                                        'https://inforpress.cv/wp-content/uploads/2020/05/empty.jpg',
                                      ),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Anexar imagem de perfil',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF989898),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Clique aqui',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF989898),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          final selectedMedia = await selectMediaWithSourceBottomSheet(
                            context: context,
                            storageFolderPath: 'comDocumento',
                            allowPhoto: true,
                            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                            textColor: Colors.white,
                          );
                          if (selectedMedia != null &&
                              selectedMedia
                                  .every((m) => validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isMediaUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                      ))
                                  .toList();
                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'moblivre',
                                selectedMedia: selectedMedia,
                              );
                            } finally {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              _model.isMediaUploading2 = false;
                            }
                            if (selectedUploadedFiles.length == selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                _model.uploadedFileUrl2 = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(context, 'Failed to upload media');
                              return;
                            }
                          }
                          setState(() {
                            FFAppState().fotoDocumento = _model.uploadedFileUrl2;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        FFAppState().fotoDocumento,
                                        'https://inforpress.cv/wp-content/uploads/2020/05/empty.jpg',
                                      ),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Anexar imagem do documento',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF989898),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Clique aqui',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF989898),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: SelectionArea(
                                child: Text(
                              'Endereço',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF1D4F9A),
                                    fontSize: 20,
                                  ),
                            )),
                          ),
                        ],
                      ),
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
                                controller: _model.estadoController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Estado',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.cidadeController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Cidade',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.bairroController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Bairro',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.cepController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CEP',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.logradouroController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Logradouro',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.numeroController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Número',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                controller: _model.complementoController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Complemento',
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Switch.adaptive(
                            value: _model.switchValue ??= true,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue = newValue!);
                            },
                          ),
                          Expanded(
                            child: SelectionArea(
                                child: Text(
                              'Aceito os Termos de uso, Condições gerais e a Política de Privacidade.',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ),
                        ],
                      ),
                    ),
                    if (_model.switchValue ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.radioButtonSituacaoValue == null) {
                              return;
                            }
                            _model.apiCallOutput =
                                await UsuarioGroup.editarUsuarioCall.call(
                              nome: _model.nomeController!.text,
                              email: FFAppState().emailPersist,
                              sobrenome: _model.sobrenomeController!.text,
                              documento: _model.cpfController!.text,
                              dataDeNascicmento:
                                  _model.dataNascimentoController!.text,
                              telefone: _model.celularController!.text,
                              situacaoLesao: _model.radioButtonSituacaoValue,
                              nivelLesao: _model.dropDownLesaoValue,
                              detalheLesao: _model.detalheLesaoController!.text,
                              fotoDocumento64: _model.uploadedFileUrl1,
                              fotoComDocumento64: _model.uploadedFileUrl2,
                              cep: _model.cepController!.text,
                              logradouro: _model.logradouroController!.text,
                              numero: _model.numeroController!.text,
                              bairro: _model.bairroController!.text,
                              cidade: _model.cidadeController!.text,
                              estado: _model.estadoController!.text,
                              complemento: _model.complementoController!.text,
                              telefoneFixo: getJsonField(
                                widget.dadosUser,
                                r'''$..telefone_fixo''',
                              ).toString(),
                              telefoneCelular: getJsonField(
                                widget.dadosUser,
                                r'''$..telefone_celular''',
                              ).toString(),
                              nivel: 1,
                            );
                            if ((_model.apiCallOutput?.succeeded ?? true)) {
                              FFAppState().update(() {
                                FFAppState().receberEmail =
                                    FFAppState().receberEmail;
                                FFAppState().emailLogado =
                                    FFAppState().emailCadastro;
                                FFAppState().nome = _model.nomeController!.text;
                                FFAppState().emailPersist =
                                    FFAppState().emailCadastro;
                                FFAppState().sobrenome =
                                    _model.sobrenomeController!.text;
                                FFAppState().documento =
                                    _model.cpfController!.text;
                                FFAppState().nascimento =
                                    _model.dataNascimentoController!.text;
                                FFAppState().celular =
                                    _model.celularController!.text;
                                FFAppState().tipoLesao =
                                    _model.dropDownLesaoValue!;
                                FFAppState().situacaoLesao =
                                    _model.radioButtonSituacaoValue!;
                                FFAppState().detalhesLesao =
                                    _model.detalheLesaoController!.text;
                                FFAppState().estado =
                                    _model.estadoController!.text;
                                FFAppState().cidade =
                                    _model.cidadeController!.text;
                                FFAppState().bairro =
                                    _model.bairroController!.text;
                                FFAppState().cep = _model.cepController!.text;
                                FFAppState().logradouro =
                                    _model.logradouroController!.text;
                                FFAppState().numero =
                                    _model.numeroController!.text;
                                FFAppState().complemento =
                                    _model.complementoController!.text;
                              });

                              context.pushNamed(
                                'MapaLogado',
                                queryParams: {
                                  'dadosUser': serializeParam(
                                    widget.dadosUser,
                                    ParamType.JSON,
                                  ),
                                }.withoutNulls,
                              );
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
                                  backgroundColor: Color(0xFFE35454),
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: 'Concluir',
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
                    if (!_model.switchValue!)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Concluir',
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
