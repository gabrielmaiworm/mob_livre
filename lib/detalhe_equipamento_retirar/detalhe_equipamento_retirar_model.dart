// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import '../flutter_flow/flutter_flow_model.dart';

// class DetalheEquipamentoRetirarModel extends FlutterFlowModel {
//   ///  State fields for stateful widgets in this page.

//   // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Button widget.
//   ApiCallResponse? apiResultnsu;

//   /// Initialization and disposal methods.

//   void initState(BuildContext context) {}

//   void dispose() {}

//   /// Additional helper methods are added here.

// }


import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalheEquipamentoRetirarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Backend Call - API (POST Solicitacao)] action in Button widget.
  ApiCallResponse? apiResultnsu;
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in Button widget.
  ApiCallResponse? apiResultki5;

  ApiCallResponse? apiResultki56;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
