import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PagamentoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for numeroCartao widget.
  TextEditingController? numeroCartaoController;
  String? Function(BuildContext, String?)? numeroCartaoControllerValidator;
  // State field(s) for validade widget.
  TextEditingController? validadeController;
  String? Function(BuildContext, String?)? validadeControllerValidator;
  // State field(s) for codSeguranca widget.
  TextEditingController? codSegurancaController;
  String? Function(BuildContext, String?)? codSegurancaControllerValidator;
  // State field(s) for pais widget.
  TextEditingController? paisController;
  String? Function(BuildContext, String?)? paisControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    numeroCartaoController?.dispose();
    validadeController?.dispose();
    codSegurancaController?.dispose();
    paisController?.dispose();
  }

  /// Additional helper methods are added here.

}
