import '../flutter_flow/flutter_flow_model.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/bottom_reservado/bottom_reservado_widget.dart';
import '/components/reserva_cancelada/reserva_cancelada_widger.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapaReservadoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for bottomReservado component.
  late BottomReservadoModel bottomReservadoModel;
  // State field(s) for Timer widget.
  int timerMilliseconds = 1800000 ;
  String timerValue = StopWatchTimer.getDisplayTime(1800000 , milliSecond: false);
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  var qrCode = '';
  // Stores action output result for [Backend Call - API (GET Detalhes Equipamento)] action in Button widget.
  ApiCallResponse? apiResult4dt;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomReservadoModel = createModel(context, () => BottomReservadoModel());
  }

  void dispose() {
    bottomReservadoModel.dispose();
    timerController.dispose();
  }

  /// Additional helper methods are added here.

}
