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
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/uploaded_file.dart';

class EditarPerfilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Buscar usuario por email)] action in EditarPerfil widget.
  ApiCallResponse? apiResultff1;
  // State field(s) for Nome widget.
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  String? _nomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for Sobrenome widget.
  TextEditingController? sobrenomeController;
  String? Function(BuildContext, String?)? sobrenomeControllerValidator;
  String? _sobrenomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for CPF widget.
  TextEditingController? cpfController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfControllerValidator;
  String? _cpfControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Custom Action - validadorCpf] action in CPF widget.
  bool? validacaoCPF;
  // State field(s) for DataNascimento widget.
  TextEditingController? dataNascimentoController;
  final dataNascimentoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataNascimentoControllerValidator;
  // State field(s) for Celular widget.
  TextEditingController? celularController;
  final celularMask = MaskTextInputFormatter(mask: '+55 (##) # ####-####');
  String? Function(BuildContext, String?)? celularControllerValidator;
  String? _celularControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for DropDownLesao widget.
  String? dropDownLesaoValue;
  // State field(s) for RadioButtonSituacao widget.
  String? radioButtonSituacaoValue;
  // State field(s) for DetalheLesao widget.
  TextEditingController? detalheLesaoController;
  String? Function(BuildContext, String?)? detalheLesaoControllerValidator;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Estado widget.
  TextEditingController? estadoController;
  String? Function(BuildContext, String?)? estadoControllerValidator;
  // State field(s) for Cidade widget.
  TextEditingController? cidadeController;
  String? Function(BuildContext, String?)? cidadeControllerValidator;
  // State field(s) for Bairro widget.
  TextEditingController? bairroController;
  String? Function(BuildContext, String?)? bairroControllerValidator;
  // State field(s) for CEP widget.
  TextEditingController? cepController;
  String? Function(BuildContext, String?)? cepControllerValidator;
  // State field(s) for Logradouro widget.
  TextEditingController? logradouroController;
  String? Function(BuildContext, String?)? logradouroControllerValidator;
  // State field(s) for Numero widget.
  TextEditingController? numeroController;
  String? Function(BuildContext, String?)? numeroControllerValidator;
  // State field(s) for Complemento widget.
  TextEditingController? complementoController;
  String? Function(BuildContext, String?)? complementoControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (Editar Usuario)] action in Button widget.
  ApiCallResponse? apiCallOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nomeControllerValidator = _nomeControllerValidator;
    sobrenomeControllerValidator = _sobrenomeControllerValidator;
    cpfControllerValidator = _cpfControllerValidator;
    celularControllerValidator = _celularControllerValidator;
  }

  void dispose() {
    nomeController?.dispose();
    sobrenomeController?.dispose();
    cpfController?.dispose();
    dataNascimentoController?.dispose();
    celularController?.dispose();
    detalheLesaoController?.dispose();
    estadoController?.dispose();
    cidadeController?.dispose();
    bairroController?.dispose();
    cepController?.dispose();
    logradouroController?.dispose();
    numeroController?.dispose();
    complementoController?.dispose();
  }

  /// Additional helper methods are added here.

}
