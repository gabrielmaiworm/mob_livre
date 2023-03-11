import 'package:mob_livree/components/botton_cadastrar_model.dart';

import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '../components/botton_cadastrar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MapaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for bottonCadastrar component.
  late BottonCadastrarModel bottonCadastrarModel;
  var qrCode = '';
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in Row widget.
  ApiCallResponse? apiResult4dt;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottonCadastrarModel = createModel(context, () => BottonCadastrarModel());
  }

  void dispose() {
    bottonCadastrarModel.dispose();
  }

  /// Additional helper methods are added here.

}
