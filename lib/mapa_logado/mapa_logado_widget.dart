import 'package:mob_livree/components/sair/sair_widget.dart';
import '../components/scan_manual/scan_manual_widget.dart';
import '../flutter_flow/flutter_flow_model.dart';
import 'package:mob_livree/mapa/parceiro_panel.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:dio/dio.dart';

import 'mapa_logado_model.dart';
export 'mapa_logado_model.dart';


FlutterFlowMarker? marker;
List<FlutterFlowMarker> docLatAndLong = [];

class MapaLogadoWidget extends StatefulWidget {
  const MapaLogadoWidget({
    Key? key,
    this.dadosUser,
  }) : super(key: key);

  final dynamic dadosUser;

  @override
  _MapaLogadoWidgetState createState() => _MapaLogadoWidgetState();
}

class _MapaLogadoWidgetState extends State<MapaLogadoWidget> {
  late MapaLogadoModel _model;

  void setSelectedParceiro(dynamic parceiro) => setState(() => selectedParceiro = parceiro);
  PanelController panelController = PanelController();
  dynamic selectedParceiro;
  List<dynamic> parceiros = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;
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
    _model = createModel(context, () => MapaLogadoModel());
    getLatAndLong();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

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
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      if (scaffoldKey
                                              .currentState!.isDrawerOpen ||
                                          scaffoldKey
                                              .currentState!.isEndDrawerOpen) {
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
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child: FlutterFlowExpandedImageView(
                                                image: Image.network(
                                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: 'circleImageTag',
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: 'circleImageTag',
                                          transitionOnUserGestures: true,
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0, 0, 0, 20),
                                              child: SelectionArea(
                                                  child: Text(
                                                FFAppState().nome,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xC9363636),
                                                        ),
                                              )),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'MeuPerfil',
                                                  queryParams: {
                                                    'detalhesUser':
                                                        serializeParam(
                                                      widget.dadosUser,
                                                      ParamType.JSON,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: 'Meu Perfil',
                                              options: FFButtonOptions(
                                                width: 110,
                                                height: 25,
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF1D4F9A),
                                                      fontSize: 14,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: Color(0xFF1D4F9A),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
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
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            child: Image.asset(
                                              'assets/images/Cadeirante_azul.png',
                                              width: 35,
                                              height: 35,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery.of(context).viewInsets,
                                                      child: Container(
                                                        height: MediaQuery.of(context).size.height * 0.45,
                                                        child: ScanManualWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => setState(() {}));
                                              },
                                              text: 'Retirar Conjunto',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
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
                                ),
                              ],
                            ),
                            //BOTÃO DE NOTIFICAÇÕES
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       Expanded(
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           height: MediaQuery.of(context).size.height * 0.06,
                            //           decoration: BoxDecoration(
                            //             color: FlutterFlowTheme.of(context).secondaryBackground,
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           child: Padding(
                            //             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            //             child: Row(
                            //               mainAxisSize: MainAxisSize.max,
                            //               children: [
                            //                 Icon(
                            //                   Icons.notifications_none,
                            //                   color: FlutterFlowTheme.of(context).primaryColor,
                            //                   size: 35,
                            //                 ),
                            //                 Expanded(
                            //                   child: FFButtonWidget(
                            //                     onPressed: () {
                            //                       print('Button pressed ...');
                            //                     },
                            //                     text: 'Notificações',
                            //                     options: FFButtonOptions(
                            //                       width: 130,
                            //                       height: 40,
                            //                       padding:
                            //                           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //                       iconPadding:
                            //                           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //                       color: Colors.white,
                            //                       textStyle: FlutterFlowTheme.of(context)
                            //                           .subtitle2
                            //                           .override(
                            //                             fontFamily: 'Poppins',
                            //                             color: FlutterFlowTheme.of(context)
                            //                                 .primaryColor,
                            //                             fontWeight: FontWeight.bold,
                            //                           ),
                            //                       elevation: 0,
                            //                       borderSide: BorderSide(
                            //                         color: Colors.transparent,
                            //                         width: 1,
                            //                       ),
                            //                       borderRadius: BorderRadius.circular(8),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.06,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.navigation_outlined,
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                              size: 35,
                                            ),
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed('Viagens');
                                                },
                                                text: 'Viagens',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  padding:
                                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme.of(context)
                                                            .primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
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
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height * 0.06,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.local_grocery_store_outlined,
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                              size: 35,
                                            ),
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchURL('http://www.kitlivre.com/');
                                                },
                                                text: 'Acessar loja',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  padding:
                                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme.of(context)
                                                            .primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
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
                                  ),
                                ],
                              ),
                            ),
                            // BOTÃO DE AJUDA
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.max,
                            //     children: [
                            //       Expanded(
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           height: MediaQuery.of(context).size.height * 0.06,
                            //           decoration: BoxDecoration(
                            //             color: FlutterFlowTheme.of(context).secondaryBackground,
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           child: Padding(
                            //             padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            //             child: Row(
                            //               mainAxisSize: MainAxisSize.max,
                            //               children: [
                            //                 Icon(
                            //                   Icons.help_outline,
                            //                   color: FlutterFlowTheme.of(context).primaryColor,
                            //                   size: 35,
                            //                 ),
                            //                 Expanded(
                            //                   child: FFButtonWidget(
                            //                     onPressed: () {
                            //                       print('Button pressed ...');
                            //                     },
                            //                     text: 'Ajuda',
                            //                     options: FFButtonOptions(
                            //                       width: 130,
                            //                       height: 40,
                            //                       padding:
                            //                           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //                       iconPadding:
                            //                           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //                       color: Colors.white,
                            //                       textStyle: FlutterFlowTheme.of(context)
                            //                           .subtitle2
                            //                           .override(
                            //                             fontFamily: 'Poppins',
                            //                             color: FlutterFlowTheme.of(context)
                            //                                 .primaryColor,
                            //                             fontWeight: FontWeight.bold,
                            //                           ),
                            //                       elevation: 0,
                            //                       borderSide: BorderSide(
                            //                         color: Colors.transparent,
                            //                         width: 1,
                            //                       ),
                            //                       borderRadius: BorderRadius.circular(8),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ), 
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Color(0xFF042D6A),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 10, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            'Sair',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                          )),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: MediaQuery.of(context).viewInsets,
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height * 0.7,
                                                    child: SairWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Icon(
                                            Icons.exit_to_app,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                            final googleMapGETParceirosResponse = snapshot.data!;
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
                                  onCameraIdle: (latLng) => googleMapsCenter = latLng,
                                  initialLocation: googleMapsCenter ??= currentUserLocationValue,
                                  markerColor: GoogleMarkerColor.violet,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
