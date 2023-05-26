import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mob_livree/index.dart';
import 'package:mob_livree/parceiro/parceiro_widget.dart';





class ParceiroPanel extends StatelessWidget {
  const ParceiroPanel({Key? key, this.parceiro}) : super(key: key);

  final dynamic parceiro;

  String getPicture() {
    try {
      Map<String, dynamic> pictureMap = jsonDecode(parceiro['foto64']);
      return pictureMap['url'];
    } catch (error) {
      print("Error on 'getPicture': $error");
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkSenGcBScqxajGbHY_QpQ9X1UTCUPEDUjSA&usqp=CAU";
    }
  }

  

  @override
  Widget build(BuildContext context) {
    if (parceiro != null) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              _BarrinhaCinza(),
              _PictureAndName(getPicture: getPicture, parceiro: parceiro),
              SizedBox(height: 20),
              _Endereco(parceiro: parceiro),
              SizedBox(height: 20),
              if (parceiro['kits'] != null && parceiro['kits'].length > 0)
                Expanded(
                  child: Column(
                    children: [
                      Spacer(),
                      
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: 
                                  ()  {
                                    Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (context) => ParceiroWidget(kits: parceiro['kits'],detalhesParceiro: parceiro)));
                                       },
                              child: Text(
                                "Lista de Conjuntos",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}

class _BarrinhaCinza extends StatelessWidget {
  const _BarrinhaCinza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: 40,
      height: 7,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

class _PictureAndName extends StatelessWidget {
  const _PictureAndName({Key? key, required this.getPicture, this.parceiro}) : super(key: key);

  final String Function() getPicture;
  final dynamic parceiro;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          height: 100,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            imageUrl: getPicture(),
            placeholder: (_, __) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            },
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                parceiro['razao_social'],
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                parceiro['email'],
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Endereco extends StatelessWidget {
  const _Endereco({Key? key, this.parceiro}) : super(key: key);

  final dynamic parceiro;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.phone),
            SizedBox(width: 10),
            Text(
              "Telefone: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "${parceiro['telefone']}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Icon(CupertinoIcons.map_pin_ellipse),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                "${parceiro['logradouro']} ${parceiro['numero']}, ${parceiro['bairro']}, ${parceiro['cidade']}, ${parceiro['complemento']}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Kits extends StatelessWidget {
  const _Kits({Key? key, this.kits}) : super(key: key);

  final dynamic kits;

  String getQuantidadeDeEquipamentosLivres() {
    int total = kits.length;
    int emUso = kits.where((kit) => kit['emprestado'] == true).length;
    int emManutencao = kits.where((kit) => kit['equipamento_status'] != "EM FUNCIONAMENTO" || kit['bateria_status'] != "EM FUNCIONAMENTO").length;

    return "${total - emUso - emManutencao} de $total Conjuntos Livre(s).";
  }

  String semEquipamentosLivres() {
    int emFuncionamento = kits.where((kit) => kit['equipamento_status'] == "EM FUNCIONAMENTO" || kit['bateria_status'] == "EM FUNCIONAMENTO").length;

    return "${emFuncionamento} Conjuntos Disponíveis.";
  }

  bool verificaEquipamentosLivres() {
    int emFuncionamento = kits.where((kit) => kit['equipamento_status'] == "EM FUNCIONAMENTO" || kit['bateria_status'] == "EM FUNCIONAMENTO").length;
    if(emFuncionamento > 0) {
      return true;
    } else {
      return false;
    }
  }



  


  @override
  Widget build(BuildContext context) {

    
    print(kits);
    return Row(
      children: [
        Column(
          children: [
        if(verificaEquipamentosLivres()) 
        Row(
          children: [
             Icon(
          FontAwesomeIcons.accessibleIcon,
        ),
            Text(
              getQuantidadeDeEquipamentosLivres(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if(verificaEquipamentosLivres() == false) 
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,0),
              child: Row(
                children: [
                  Icon(
          FontAwesomeIcons.accessibleIcon,
        ),
        SizedBox(width: 10),
                  Text(
                    semEquipamentosLivres(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
          
        ),
      ],
    );
  }
}
