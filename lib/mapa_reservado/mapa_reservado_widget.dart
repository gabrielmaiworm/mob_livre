import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../components/reserva_cancelada/reserva_cancelada_widger.dart';
import '../components/sair/sair_widget.dart';
import '../components/scan_manual/scan_manual_widget.dart';
import '../components/scan_manual_reserva/scan_manual_reserva_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/bottom_reservado/bottom_reservado_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:isolate';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'mapa_reservado_model.dart';
export 'mapa_reservado_model.dart';


class MapaReservadoWidget extends StatefulWidget {
  const MapaReservadoWidget({
    Key? key,
    this.detalhesEquip,
    this.detailUser,
  }) : super(key: key);

  final dynamic detalhesEquip;
  final dynamic detailUser;

  @override
  _MapaReservadoWidgetState createState() => _MapaReservadoWidgetState();
}

class _MapaReservadoWidgetState extends State<MapaReservadoWidget> {
  late MapaReservadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
    LatLng? currentUserLocationValue;
    LatLng? googleMapsCenter;
    final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model = createModel(context, () => MapaReservadoModel());
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
                                          valueOrDefault<String>(
                                            FFAppState().nome,
                                            'Usuário',
                                          ),
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
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D4F9A),
                  ),
                  child: SingleChildScrollView(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                            child: Icon(
                                              Icons.home,
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                              size: 25,
                                            ),
                                          ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().maisOpcoes = false;
                                                });
                                              },
                                              text: 'Inicio',
                                              options: FFButtonOptions(
                                                width: 100,
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
                                // BOTÃO DE NOTIFICAÇÕES
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height: MediaQuery.of(context).size.height * 0.06,
                                //     decoration: BoxDecoration(
                                //       color: FlutterFlowTheme.of(context).secondaryBackground,
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.max,
                                //         mainAxisAlignment: MainAxisAlignment.start,
                                //         children: [
                                //           Image.asset(
                                //             'assets/images/Vector.png',
                                //             width: MediaQuery.of(context).size.width * 0.08,
                                //             height: MediaQuery.of(context).size.height * 0.04,
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
                                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                //                 iconPadding:
                                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                //                 color: Colors.white,
                                //                 textStyle: FlutterFlowTheme.of(context)
                                //                     .subtitle2
                                //                     .override(
                                //                       fontFamily: 'Poppins',
                                //                       color: FlutterFlowTheme.of(context)
                                //                           .primaryColor,
                                //                       fontWeight: FontWeight.bold,
                                //                     ),
                                //                 elevation: 0,
                                //                 borderSide: BorderSide(
                                //                   color: Colors.transparent,
                                //                   width: 1,
                                //                 ),
                                //                 borderRadius: BorderRadius.circular(8),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/navigator.png',
                                            width: MediaQuery.of(context).size.width * 0.08,
                                            height: MediaQuery.of(context).size.height * 0.04,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/loja.png',
                                            width: MediaQuery.of(context).size.width * 0.08,
                                            height: MediaQuery.of(context).size.height * 0.04,
                                            fit: BoxFit.contain,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await launchURL('http://www.kitlivre.com/');
                                                },
                                                text: 'Acessar Loja',
                                                options: FFButtonOptions(
                                                  width: 120,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // BOTÃO DE AJUDA
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height: MediaQuery.of(context).size.height * 0.06,
                                //     decoration: BoxDecoration(
                                //       color: FlutterFlowTheme.of(context).secondaryBackground,
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.max,
                                //         mainAxisAlignment: MainAxisAlignment.start,
                                //         children: [
                                //           Image.asset(
                                //             'assets/images/ajuda.png',
                                //             width: MediaQuery.of(context).size.width * 0.08,
                                //             height: MediaQuery.of(context).size.height * 0.05,
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
                                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                //                 iconPadding:
                                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                //                 color: Colors.white,
                                //                 textStyle: FlutterFlowTheme.of(context)
                                //                     .subtitle2
                                //                     .override(
                                //                       fontFamily: 'Poppins',
                                //                       color: FlutterFlowTheme.of(context)
                                //                           .primaryColor,
                                //                       fontWeight: FontWeight.bold,
                                //                     ),
                                //                 elevation: 0,
                                //                 borderSide: BorderSide(
                                //                   color: Colors.transparent,
                                //                   width: 1,
                                //                 ),
                                //                 borderRadius: BorderRadius.circular(8),
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              
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
                                          'Você poderá retirar seu conjunto até ',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text("${dateTimeFormat('Hm', DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 1800000))}",
                                    style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                    ),
                                    
                                  ),
                                ],
                              ),
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
                                            10, 0, 0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Conjunto reservado: ${FFAppState().kit}\n',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
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
                                          'Após o horário informado, seu conjuto sairá da reserva.\n',
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
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                                                        child: ScanManualReservaWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => setState(() {}));
                                              },
                                  text: 'Retirar Conjunto',
                                  options: FFButtonOptions(
                                    width: 250,
                                    height: 45,
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                            height:
                                                MediaQuery.of(context).size.height *
                                                    0.7,
                                            child: ReservaCanceladaWidget(),
                                            
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  text: 'Cancelar Reserva',
                                  options: FFButtonOptions(
                                    width: 250,
                                    height: 45,
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                  flex: 4,
                  child: Stack(
                    children: [
                      FlutterFlowGoogleMap(
                        controller: googleMapsController,
                        onCameraIdle: (latLng) =>
                            googleMapsCenter = latLng,
                        initialLocation: googleMapsCenter ??=
                            currentUserLocationValue,
                        markerColor: GoogleMarkerColor.blue,
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
                wrapWithModel(
                  model: _model.bottomReservadoModel,
                  updateCallback: () => setState(() {}),
                  child: BottomReservadoWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
