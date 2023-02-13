import 'package:mob_livree/detalhe_equipamento/detalhe_equipamento_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/custom_functions.dart' as functions;

class ParceiroWidget extends StatefulWidget {
  const ParceiroWidget({Key? key, this.kits, this.detalhesParceiro}) : super(key: key);

  final dynamic detalhesParceiro;
  final dynamic kits;

 

  @override
  _ParceiroWidgetState createState() => _ParceiroWidgetState();
}



class _ParceiroWidgetState extends State<ParceiroWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
   LatLng? currentUserLocationValue;
  

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

 @override
  void initState() {
    super.initState();
    
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

   String getQuantidadeDeEquipamentosLivres(dynamic kits) {
      int total = kits.length;
      int emUso = kits.where((kit) => kit['emprestado'] == true).length;
      int emManutencao = kits.where((kit) => kit['equipamento_status'] != "EM FUNCIONAMENTO" || kit['bateria_status'] != "EM FUNCIONAMENTO").length;

      return "${total - emUso - emManutencao}";
    }
  
  String semEquipamentosLivres(dynamic kits) {
      int emFuncionamento = kits.where((kit) => kit['equipamento_status'] == "EM FUNCIONAMENTO" && kit['bateria_status'] == "EM FUNCIONAMENTO" && kit['usuario'] == null).length ;

      return "${emFuncionamento}";
    }

    String totalEquipamentos(dynamic kits) {
      int total = kits.length;

      return "$total";
    }

  bool verificaEquipamentosLivres(dynamic kits) {
    int emFuncionamento = kits.where((kit) => kit['equipamento_status'] == "EM FUNCIONAMENTO" || kit['bateria_status'] == "EM FUNCIONAMENTO").length;
    if(emFuncionamento > 0) {
      return true;
    } else {
      return false;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

String getPicture() {
    try {
      Map<String, dynamic> pictureMap = jsonDecode(widget.detalhesParceiro['foto64']);
      return pictureMap['url'];
    } catch (error) {
      print("Error on 'getPicture': $error");
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkSenGcBScqxajGbHY_QpQ9X1UTCUPEDUjSA&usqp=CAU";
    }
    
  };
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
          appBar: AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      title: SelectionArea(
          child: Text(
        'Parceiro',
        style: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xFF1D4F9A),
              fontSize: 20,
            ),
      )),
      actions: [],
      centerTitle: true,
      elevation: 3,
    ), 
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                            child: Image.network(
                              getPicture(),
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.42),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        color: Color(0xFF1D4F9A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    widget.detalhesParceiro['nome_fantasia'],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SelectionArea(
                                      child: Text(
                                    widget.detalhesParceiro['logradouro'] + "," + widget.detalhesParceiro['bairro'] + ", " + widget.detalhesParceiro['cidade'] + " - " + widget.detalhesParceiro['estado'],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  )),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Image.asset(
                                          'assets/images/_icon__wheelchair_.png',
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                        child: SelectionArea(
                                            child: Text(
                                          semEquipamentosLivres(widget.kits),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                        )),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Image.asset(
                                          'assets/images/_icon__bike_parking_.png',
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SelectionArea(
                                          child: Text(
                                        totalEquipamentos(widget.kits),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                      )),
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          'Aberto',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF1D4F9A),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )),
                                      ],
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
              ),
              Align(
                alignment: AlignmentDirectional(-0.05, -0.02),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFF1D4F9A),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.favorite_sharp,
                                color: Color(0xFF1D4F9A),
                                size: 28,
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xFF1D4F9A),
                                width: 1,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await launchURL('tel:${widget.detalhesParceiro['telefone']}');
                              },
                              child: Icon(
                                Icons.phone,
                                color: Color(0xFF1D4F9A),
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFF1D4F9A),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SelectionArea(
                            child: Text(
                          '${formatNumber(
                            functions.returnDistanceBetweenTwoPoints(
                                currentUserLocationValue,
                                functions.transformPosition(
                                    widget.detalhesParceiro['latitude'].toString(),
                                   widget.detalhesParceiro['longitude'].toString())),
                            formatType: FormatType.custom,
                            format: '####.0#',
                            locale: '',
                          )} km',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1D4F9A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1.44),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Equipamentos disponíveis\n para locação',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                          )),
                        ],
                      ),
                      // Generated code for this ListView Widget...
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Builder(
                          builder: (context) {
                            final listaKit = getJsonField(
                              widget.detalhesParceiro,
                              r'''$..kits''',
                            ).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listaKit.length,
                              itemBuilder: (context, listaKitIndex) {
                                final listaKitItem = listaKit[listaKitIndex];
                                return Visibility(
                                visible: getJsonField(
                                listaKitItem!,
                                r'''$..equipamento_status''',
                              ) ==
                              "EM FUNCIONAMENTO" && getJsonField(
                                listaKitItem!,
                                r'''$..equipamento_status''',
                              ) == "EM FUNCIONAMENTO" && getJsonField(
                                listaKitItem!,
                                r'''$..usuario''',
                              ) == null,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => DetalheEquipamentoWidget(detalhesEquip: listaKitItem)));
                                          },
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(1.01, -0.26),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                  height: MediaQuery.of(context).size.height * 0.12,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x7496BBFF),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                0, 0, 10, 0),
                                                            child: SelectionArea(
                                                                child: Text(
                                                              getJsonField(
                                                                listaKitItem,
                                                                r'''$..nome_equipamento''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme.of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                            )),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Ver',
                                                              style: FlutterFlowTheme.of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily: 'Poppins',
                                                                    fontSize: 16,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons.chevron_right_rounded,
                                                              color: Colors.black,
                                                              size: 35,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(-1.04, 0),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://imgs.casasbahia.com.br/1501531919/1xg.jpg?imwidth=500',
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
    );

    
  }
  
}

