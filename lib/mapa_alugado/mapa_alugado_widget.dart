import 'package:mob_livree/components/emergencia_cancelada/emergencia_cancelada_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/api_requests/api_calls.dart';
import '../backend/api_requests/api_manager.dart';
import '../components/reserva_cancelada/reserva_cancelada_widger.dart';
import '../components/sair/sair_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_model.dart';
import 'package:mob_livree/mapa/parceiro_panel.dart';
import '/components/email_enviado_copy_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'mapa_alugado_model.dart';
export 'mapa_alugado_model.dart';

FlutterFlowMarker? marker;
List<FlutterFlowMarker> docLatAndLong = [];
 var speedInMps = 0.0;
 var speedInKmh;

class MapaAlugadoWidget extends StatefulWidget {
  const MapaAlugadoWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detailUser;

  @override
  _MapaAlugadoWidgetState createState() => _MapaAlugadoWidgetState();
}

class _MapaAlugadoWidgetState extends State<MapaAlugadoWidget> {
  late MapaAlugadoModel _model;

  void setSelectedParceiro(dynamic parceiro) =>
      setState(() => selectedParceiro = parceiro);
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
      marker =
          FlutterFlowMarker(parceiro['documento_empresa'], latLng, () async {
        setSelectedParceiro(parceiro);
        // panelController.open();
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
    _model = createModel(context, () => MapaAlugadoModel());
    getLatAndLong();
    getCurrentUserLocation(defaultLocation: LatLng(23.5558, 46.6396), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
        Geolocator.getPositionStream()
          .listen((position) {
            speedInMps =
            position.speed;
            speedInKmh = (speedInMps * 1.6);
        });
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
                                                valueOrDefault<String>(
                                                  FFAppState().fotoPerfil,
                                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                                ),
                                                fit: BoxFit.cover,
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
                                                valueOrDefault<String>(
                                                  FFAppState().fotoPerfil,
                                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                          ),
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: SelectionArea(
                                            child: Text(
                                          FFAppState().nome,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xC9363636),
                                              ),
                                        )),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                                context.pushNamed(
                                                  'MeuPerfil',
                                                );
                                              },
                                        text: 'Meu Perfil',
                                        options: FFButtonOptions(
                                          width: 110,
                                          height: 25,
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
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
                        if (FFAppState().maisOpcoes == true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 5, 0),
                                            child: Icon(
                                              Icons.home,
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                              size: 35,
                                            ),
                                          ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().maisOpcoes = false;
                                                });
                                              },
                                              text: 'Início',
                                              options: FFButtonOptions(
                                                width: 100,
                                                height: 40,
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // BOTÃO DE NOTIFICAÇÕES
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height:
                                //         MediaQuery.of(context).size.height * 0.06,
                                //     decoration: BoxDecoration(
                                //       color: FlutterFlowTheme.of(context)
                                //           .secondaryBackground,
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(
                                //           5, 0, 0, 0),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.max,
                                //         mainAxisAlignment: MainAxisAlignment.start,
                                //         children: [
                                //           Image.asset(
                                //             'assets/images/Vector.png',
                                //             width:
                                //                 MediaQuery.of(context).size.width *
                                //                     0.08,
                                //             height:
                                //                 MediaQuery.of(context).size.height *
                                //                     0.04,
                                //             fit: BoxFit.contain,
                                //           ),
                                //           Expanded(
                                //             child: FFButtonWidget(
                                //               onPressed: () {
                                //                 print('Button pressed ...');
                                //               },
                                //               text: 'Notificações',
                                //               options: FFButtonOptions(
                                //                 width: 130,
                                //                 height: 40,
                                //                 padding:
                                //                     EdgeInsetsDirectional.fromSTEB(
                                //                         0, 0, 0, 0),
                                //                 iconPadding:
                                //                     EdgeInsetsDirectional.fromSTEB(
                                //                         0, 0, 0, 0),
                                //                 color: Colors.white,
                                //                 textStyle: FlutterFlowTheme.of(
                                //                         context)
                                //                     .subtitle2
                                //                     .override(
                                //                       fontFamily: 'Poppins',
                                //                       color: FlutterFlowTheme.of(
                                //                               context)
                                //                           .primaryColor,
                                //                       fontWeight: FontWeight.bold,
                                //                     ),
                                //                 elevation: 0,
                                //                 borderSide: BorderSide(
                                //                   color: Colors.transparent,
                                //                   width: 1,
                                //                 ),
                                //                 borderRadius:
                                //                     BorderRadius.circular(8),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/navigator.png',
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.08,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.04,
                                            fit: BoxFit.contain,
                                          ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed('Viagens');
                                              },
                                              text: 'Viagens',
                                              options: FFButtonOptions(
                                                width: 100,
                                                height: 40,
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 0),
                                                iconPadding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 0),
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/loja.png',
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.08,
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.04,
                                            fit: BoxFit.contain,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      10, 0, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchURL(
                                                      'http://www.kitlivre.com/');
                                                },
                                                text: 'Acessar Loja',
                                                options: FFButtonOptions(
                                                  width: 120,
                                                  height: 40,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  iconPadding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // BOTÃO DE AJUDA
                                // Padding(
                                //   padding:
                                //       EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height:
                                //         MediaQuery.of(context).size.height * 0.06,
                                //     decoration: BoxDecoration(
                                //       color: FlutterFlowTheme.of(context)
                                //           .secondaryBackground,
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(
                                //           5, 0, 0, 0),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.max,
                                //         mainAxisAlignment: MainAxisAlignment.start,
                                //         children: [
                                //           Image.asset(
                                //             'assets/images/ajuda.png',
                                //             width:
                                //                 MediaQuery.of(context).size.width *
                                //                     0.08,
                                //             height:
                                //                 MediaQuery.of(context).size.height *
                                //                     0.05,
                                //             fit: BoxFit.contain,
                                //           ),
                                //           Expanded(
                                //             child: FFButtonWidget(
                                //               onPressed: () {
                                //                 print('Button pressed ...');
                                //               },
                                //               text: 'Ajuda',
                                //               options: FFButtonOptions(
                                //                 width: 100,
                                //                 height: 40,
                                //                 padding:
                                //                     EdgeInsetsDirectional.fromSTEB(
                                //                         0, 0, 0, 0),
                                //                 iconPadding:
                                //                     EdgeInsetsDirectional.fromSTEB(
                                //                         0, 0, 0, 0),
                                //                 color: Colors.white,
                                //                 textStyle: FlutterFlowTheme.of(
                                //                         context)
                                //                     .subtitle2
                                //                     .override(
                                //                       fontFamily: 'Poppins',
                                //                       color: FlutterFlowTheme.of(
                                //                               context)
                                //                           .primaryColor,
                                //                       fontWeight: FontWeight.bold,
                                //                     ),
                                //                 elevation: 0,
                                //                 borderSide: BorderSide(
                                //                   color: Colors.transparent,
                                //                   width: 1,
                                //                 ),
                                //                 borderRadius:
                                //                     BorderRadius.circular(8),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        if (FFAppState().maisOpcoes == false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.24,
                                        height: MediaQuery.of(context).size.height *
                                            0.04,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              'assets/images/_icon__wheelchair__(1).png',
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                            SelectionArea(
                                                child: Text(
                                              '00 km',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF1D4F9A),
                                                  ),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.24,
                                        height: MediaQuery.of(context).size.height *
                                            0.04,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.batteryFull,
                                              color: Color(0xFF1D4F9A),
                                              size: 24,
                                            ),
                                            if (getJsonField(
                                                  widget.detalhesEquip,
                                                  r'''$..carga''',
                                                ).toString() !=
                                                "null")
                                              SelectionArea(
                                                  child: Text(
                                                '${valueOrDefault<String>(
                                                  getJsonField(
                                                    widget.detalhesEquip,
                                                    r'''$..[0].carga''',
                                                  ).toString(),
                                                  '100',
                                                )} %',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF1D4F9A),
                                                    ),
                                              )),
                                            if (getJsonField(
                                                  widget.detalhesEquip,
                                                  r'''$..carga''',
                                                ).toString() ==
                                                "null")
                                              SelectionArea(
                                                  child: Text(
                                                "100%",
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF1D4F9A),
                                                    ),
                                              )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 15, 0, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            'ID do conjunto: ${FFAppState().kit}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if(FFAppState().relogio >= 0)
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                                
                                            'Tempo restante:',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if(FFAppState().relogio < 0)
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                                
                                            'Tempo excedido:',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,5,0,0),
                                  child: Center(
                                          child: CountTimer(
                                            seconds: FFAppState().relogio,

                                          ),
                                        ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: SelectionArea(
                                              child: Text(
                                            'Devolva esse conjunto na mesma estação em que você retirou.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: ()  {
                                      context.pushNamed(
                                        'Devolver',
                                        queryParams: {
                                          'detalhesEquip': serializeParam(
                                            getJsonField(
                                              widget.detalhesEquip,
                                              r'''$''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                          'detailUser': serializeParam(
                                            getJsonField(
                                              widget.detailUser,
                                              r'''$''',
                                            ),
                                            ParamType.JSON,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'Devolver Conjunto',
                                    options: FFButtonOptions(
                                      width: 250,
                                      height: 45,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1D4F9A),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                if (!FFAppState().emergencia)
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'Emergencia',
                                          queryParams: {
                                            'detalhesApp': serializeParam(
                                              getJsonField(
                                                widget.detalhesEquip,
                                                r'''$''',
                                              ),
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'Emergência',
                                      options: FFButtonOptions(
                                        width: 250,
                                        height: 45,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF1D4F9A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().emergencia)
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding:
                                                  MediaQuery.of(context).viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7,
                                                child: EmergenciaCanceladaWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'Cancelar Emergência',
                                      options: FFButtonOptions(
                                        width: 250,
                                        height: 45,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        color:
                                            FlutterFlowTheme.of(context).alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().maisOpcoes = true;
                                      });
                                    },
                                    text: 'Mais Opções',
                                    options: FFButtonOptions(
                                      width: 250,
                                      height: 45,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      color: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF1D4F9A),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
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
                                                    padding: MediaQuery.of(context)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.7,
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
                                  onCameraIdle: (latLng) =>
                                      currentUserLocationValue = latLng,
                                  initialLocation: currentUserLocationValue,
                                  markerColor: GoogleMarkerColor.blue,
                                  markers: docLatAndLong,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 14,
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
                            _model.apiResultTempo = await EquipamentoGroup.pOSTTempoUsoCall.call(
                              documento: FFAppState().documento,
                            );
                            final relogio = await getJsonField(_model.apiResultTempo, r'''$..relogio''') ?? 0.0;
                            setState(() {
                              FFAppState().relogio = getJsonField(
                              _model.apiResultTempo!.jsonBody,
                              r'''$..relogio''',
                              );
                            });

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
                      Align(
                        alignment: AlignmentDirectional(-0.88, -0.7),
                        child: Container(
                          width: 65.0,  // Define o diâmetro do círculo
                          height: 65.0, // Define o diâmetro do círculo
                          decoration: BoxDecoration(
                            color: Color(0xFF1D4F9A), // Cor do círculo
                            shape: BoxShape.circle,    // Faz o container ficar em forma de círculo
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  speedInKmh.toStringAsFixed(0), 
                                  style: TextStyle(
                                    color: Colors.white, // Cor do texto
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,        // Tamanho do texto
                                  ),
                                ),
                                Text(
                                  'km/h', 
                                  style: TextStyle(
                                    color: Colors.white, // Cor do texto
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,        // Tamanho do texto
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountTimer extends StatefulWidget {
  final int seconds;

  CountTimer({required this.seconds});

  @override
  _CountTimerState createState() => _CountTimerState();
}

class _CountTimerState extends State<CountTimer> {
  int remainingSeconds = 0;
  bool isPositive = true;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
      startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    
  }

  @override
  Widget build(BuildContext context) {
    // Determine the text color based on the sign of remainingSeconds
    Color textColor = remainingSeconds >= 0 ? Colors.white : Colors.red;

    return Text(
      formatTime(remainingSeconds),
      style: TextStyle(fontSize: 24, color: textColor),
    );
  }

  void startTimer() {
    // Create a timer that updates the remaining seconds every second
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
       if (mounted) {
      setState(() {
        // Decrease/increase the remaining seconds based on the sign
        remainingSeconds += isPositive ? -1 : 1;

        // When the countdown reaches zero, reset the timer
        if (remainingSeconds == 0) {
          isPositive = true;
          timer.cancel();
          startTimer();
        }
      });
    }});
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    // Format the time as a string (e.g., "mm:ss")
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = secs.toString().padLeft(2, '0');

    if (seconds >= 0) {
      return '$minutesStr:$secondsStr';
    } else {
      return '$minutesStr minutos';
    }
  }
}
