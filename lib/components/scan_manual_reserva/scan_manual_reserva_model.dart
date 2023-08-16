import '../../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanManualReservaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NumeroSerie widget.
  TextEditingController? numeroSerieController;
  String? Function(BuildContext, String?)? numeroSerieControllerValidator;
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in IconButton widget.
  ApiCallResponse? resultTextApi;
  var qrCode = '';
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in Button widget.
  ApiCallResponse? apiResult4dt;
  ApiCallResponse? resultApi;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    numeroSerieController?.dispose();
  }

  /// Additional helper methods are added here.

}
