import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSenhaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Senha widget.
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? apiResultw03;
  // Stores action output result for [Backend Call - API (Usuario Solicitacao)] action in Button widget.
  ApiCallResponse? apiResult7vn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  void dispose() {
    senhaController?.dispose();
  }

  /// Additional helper methods are added here.

}
