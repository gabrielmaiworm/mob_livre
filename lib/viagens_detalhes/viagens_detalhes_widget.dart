import '../flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'viagens_detalhes_model.dart';
export 'viagens_detalhes_model.dart';

class ViagensDetalhesWidget extends StatefulWidget {
  const ViagensDetalhesWidget({
    Key? key,
    this.detalhesViagem,
  }) : super(key: key);

  final dynamic detalhesViagem;

  @override
  _ViagensDetalhesWidgetState createState() => _ViagensDetalhesWidgetState();
}

class _ViagensDetalhesWidgetState extends State<ViagensDetalhesWidget> {
  late ViagensDetalhesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViagensDetalhesModel());

    _model.textController ??= TextEditingController(
        text: getJsonField(
      widget.detalhesViagem,
      r'''$..sugestao''',
    ).toString().toString());
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
    var avaliacaoField = getJsonField(widget.detalhesViagem, r'''$..avaliacao''');
    var avaliacaoString = avaliacaoField.toString();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
            child: Text(
              'Detalhes da Viagem ',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.network(
                              'https://i.stack.imgur.com/1XPRz.png',
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            functions.formatDateTimeCompleto(getJsonField(
                              widget.detalhesViagem,
                              r'''$..data_solicitacao''',
                            ).toString()),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        Text(
                          'R\$ ${getJsonField(
                            widget.detalhesViagem,
                            r'''$..avaliacao''',
                          ).toString()},00',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1D4F9A),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget.detalhesViagem,
                              r'''$..nome_equipamento''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          child: Image.asset(
                            'assets/images/Group_7.png',
                            width: 20,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      
                                      Expanded(
                                        child: Text(
                                          '${getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..parceiro.nome_fantasia''',
                                          ).toString()} - ${functions.formatDateTimeCompleto(
                                          getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..data_solicitacao''',
                                            ).toString())}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF1D4F9A),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..parceiro.nome_fantasia''',
                                          ).toString()} - ${functions.formatDateTimeCompleto(
                                          getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..data_devolucao''',
                                            ).toString())}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF1D4F9A),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Distância percorrida: ${getJsonField(
                              widget.detalhesViagem,
                              r'''$..avaliacao''',
                            ).toString()} km',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Tempo de uso: ${functions.formatTempoUso(
                                          getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..data_solicitacao''',
                                            ).toString(), getJsonField(
                                            widget.detalhesViagem,
                                            r'''$..data_devolucao''',
                                            ).toString())}',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 45, 25, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Você avaliou:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => _model.ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: Color(0xFFCFAD03),
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= double.parse(avaliacaoString),
                          unratedColor: Color.fromARGB(255, 117,117,117),
                          itemCount: 5,
                          itemSize: 40,
                          glowColor: Color(0xFFCFAD03),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Sugestões:',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF1D4F9A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 50),
                    child: TextFormField(
                      controller: _model.textController,
                      readOnly: true,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1D4F9A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1D4F9A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1D4F9A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF1D4F9A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF1D4F9A),
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
