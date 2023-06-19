import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelecionarPlanoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in SelecionarPlano widget.
  ApiCallResponse? apiResultki5;
  // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Container widget.
  ApiCallResponse? apiResultnsu;
  // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Container widget.
  ApiCallResponse? apiResultnsu2;
  // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Container widget.
  ApiCallResponse? apiResultnsu3;
  // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Container widget.
  ApiCallResponse? apiResultnsu4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
