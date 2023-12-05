import '../backend/api_requests/api_calls.dart';
import '../backend/api_requests/api_manager.dart';
import '../components/botton_cadastrar_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:mob_livree/mapa/parceiro_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:dio/dio.dart';

FlutterFlowMarker? marker;
List<FlutterFlowMarker> docLatAndLong = [];

class MapaDeslogadoWidget extends StatefulWidget {
  const MapaDeslogadoWidget({Key? key}) : super(key: key);

  @override
  _MapaDeslogadoWidgetState createState() => _MapaDeslogadoWidgetState();
}

class _MapaDeslogadoWidgetState extends State<MapaDeslogadoWidget> {

   void setSelectedParceiro(dynamic parceiro) => setState(() => selectedParceiro = parceiro);
  PanelController panelController = PanelController();
  dynamic selectedParceiro;
  List<dynamic> parceiros = [];

  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  Future<List<FlutterFlowMarker>> getLatAndLong() async {
    String url = "http://177.70.102.109:3005/parceiro-equipamento";

    final response = await Dio().get(url);
    final responseBody = response.data;

    List<dynamic> parceirosToAdd = [];
    for (final parceiro in responseBody) {
      LatLng latLng = LatLng(parceiro['latitude'], parceiro['longitude']);
      marker = FlutterFlowMarker(parceiro['documento_empresa'], latLng, () async {
        setSelectedParceiro(parceiro);
        panelController.open();
      });
      docLatAndLong.add(marker!);
      parceirosToAdd.add(parceiro);
    }

    setState(() {
      print(responseBody);
      parceiros = parceirosToAdd;
    });

    return docLatAndLong;
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(23.5558, 46.6396), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    getLatAndLong();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
        child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF1D4F9A),
        drawer: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }
                              },
                              child: FaIcon(
                                FontAwesomeIcons.arrowLeft,
                                color: Color(0xFFD9D9D9),
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Group_9.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D4F9A),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 40),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectionArea(
                                        child: Text(
                                      'Bem vindo  à Mob Livre !',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectionArea(
                                        child: Text(
                                      'Comece criando sua conta.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('CadastroPrimeiro');
                                  },
                                  text: 'Começar',
                                  options: FFButtonOptions(
                                    width: 210,
                                    height: 40,
                                    color: Color(0xFF1D4F9A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: ParceiroGroup.gETParceirosCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: SlidingUpPanel(
                                  controller: panelController,
                                  backdropColor: Colors.black,
                                  backdropOpacity: 0.6,
                                  backdropEnabled: true,
                                  backdropTapClosesPanel: true,
                                  minHeight: 0,
                                  panel: ParceiroPanel(parceiro: selectedParceiro),
                                  body: FlutterFlowGoogleMap(
                                    controller: googleMapsController,
                                    onCameraIdle: (latLng) => currentUserLocationValue = latLng,
                                    initialLocation: currentUserLocationValue,
                                    markerColor: GoogleMarkerColor.blue,
                                    markers: docLatAndLong,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.standard,
                                    initialZoom: 10,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: true,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.88, -0.96),
                          child: InkWell(
                            onTap: () async {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Color(0xFF1D4F9A),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.menu_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                BottonCadastrarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
