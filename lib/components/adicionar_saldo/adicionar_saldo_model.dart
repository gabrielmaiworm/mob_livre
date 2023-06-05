import '../../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdicionarSaldoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Saldo widget.
  TextEditingController? saldoController;
  String? Function(BuildContext, String?)? saldoControllerValidator;
  // Stores action output result for [Backend Call - API (Criar pix)] action in IconButton widget.
  ApiCallResponse? apiResult7v10;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    saldoController?.dispose();
  }

  /// Additional helper methods are added here.

}
