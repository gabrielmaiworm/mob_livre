import '../backend/api_requests/api_manager.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NovaSenhaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
 ApiCallResponse? apiCallOutput;
  final formKey = GlobalKey<FormState>();
  // State field(s) for CPF widget.
  TextEditingController? cpfController;
  String? Function(BuildContext, String?)? cpfControllerValidator;
  // State field(s) for Senha widget.
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // State field(s) for ConfirmaSenha widget.
  TextEditingController? confirmaSenhaController;
  late bool confirmaSenhaVisibility;
  String? Function(BuildContext, String?)? confirmaSenhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
    confirmaSenhaVisibility = false;
  }

  void dispose() {
    cpfController?.dispose();
    senhaController?.dispose();
    confirmaSenhaController?.dispose();
  }

  /// Additional helper methods are added here.

}
