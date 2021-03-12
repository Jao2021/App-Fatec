import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MaterialApp(
    home: Joken(),
    theme: ThemeData(primaryColor: Colors.green),
  ));
}

class Joken extends StatefulWidget {
  @override
  JokenState createState() => JokenState();
}

class JokenState extends State<Joken> {
    var opcao = ['papel', 'pedra', 'tesoura'];
    String imagemPlayer = "";
    Color corMensagem;
    String imagem = "";
    String menssagem ="";
    
  void sorteia (String escolhauser){
    imagemPlayer = "assets/image/$escolhauser.png";
    int ppt = Random().nextInt(3); 
    String escolhapc = opcao[ppt];

    
      switch(escolhapc){
        case 'pedra':
          imagem = "assets/image/pedra.png";
          break;
        case 'papel':
           imagem = "assets/image/papel.png";
          break;
        case 'tesoura': 
          imagem = "assets/image/tesoura.png";
          break;
      }
    
    if(
      (escolhauser == 'papel' && escolhapc == 'pedra') ||
      (escolhauser == 'pedra' && escolhapc == 'tesoura') ||
      (escolhauser == 'tesoura' && escolhapc == 'papel')
    ){
      setState(() {
        menssagem ="Você Ganhou";
        corMensagem = Colors.green;
      });
     }else if(
      (escolhapc == 'papel' && escolhauser == 'pedra') ||
      (escolhapc == 'pedra' && escolhauser == 'tesoura') ||
      (escolhapc == 'tesoura' && escolhauser == 'papel') 
     ){
      setState(() {
        menssagem ="Você Perdeu";
        corMensagem = Colors.red;
      });

     }else{
       setState(() {
         menssagem = "Empatou";
        corMensagem = Colors.blue;
       });
    }

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
           title: Text('JOKENPÔ', style: TextStyle(
              color: Colors.white, ),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Computador',
                style: Theme.of(context).textTheme.headline4),
             Flexible(child: Center(child: Image.asset(imagem)),),
              Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('VS', style: Theme.of(context).textTheme.headline4),
                    Text(menssagem, style: TextStyle(color:corMensagem, fontSize: 20.0))
                  ]
                ),
              ),
              Flexible(child: Center(child: Image.asset(imagemPlayer), ),),
              
              
              Text('Jogador', style: Theme.of(context).textTheme.headline4),
              //jogador//
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(25, 30, 50, 30),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        color: Colors.green,
                        child: Text('Pedra', style: TextStyle(color:Colors.white),),
                        onPressed: () => sorteia('pedra'),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 30, 50, 30),
                      child:RaisedButton(
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        color: Colors.green,
                        child: Text('Papel', style: TextStyle(color:Colors.white),),
                        onPressed: () => sorteia('papel'),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child:RaisedButton(
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        color: Colors.green,
                        child: Text('Tesoura', style: TextStyle(color:Colors.white),),
                        onPressed: () => sorteia('tesoura'),
                      ),
                    ),
                  ],
                ),
                
            ],
          ),
        ),
        
      );
  }
}

    