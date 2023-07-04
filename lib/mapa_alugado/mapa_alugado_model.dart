import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '../components/email_enviado_copy_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapaAlugadoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  var qrCode = '';
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in Button widget.
  ApiCallResponse? apiResult4dt;

  ApiCallResponse? apiResultTempo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
