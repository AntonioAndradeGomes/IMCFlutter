import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora_imc/bloc/imc_bloc.dart';
import 'package:calculadora_imc/widgets/input_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _imcBloc = new IMCBloc();

  @override
  void dispose() {
    _imcBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Container(),
          new SingleChildScrollView(
            child: new Container(
              margin: EdgeInsets.all(20),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Icon(
                    Icons.local_hospital,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.height / 5,
                  ),
                  const AutoSizeText(
                    "Calculadora de IMC",
                    maxLines: 2,
                    style: const TextStyle(color: Colors.white, fontSize: 45),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  new AutoSizeText(
                    "Coloque a sua altura e peso nos campos abaixo para saber seu IMC",
                    maxLines: 2,
                    style: new TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  new InputField(
                    texto: "Sua altura",
                    stream: _imcBloc.outAltura,
                    onChanged: _imcBloc.changeAltura,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  new InputField(
                    texto: "Seu peso atual",
                    stream: _imcBloc.outPeso,
                    onChanged: _imcBloc.changePeso,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<bool>(
                    stream: _imcBloc.outSubmitValid,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _imcBloc.submit();
                        return new StreamBuilder<String>(
                          stream: _imcBloc.outSituacao,
                          builder: (context, snapshot) {
                            return new AutoSizeText(
                              snapshot.data,
                              maxLines: 2,
                              style: new TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            );
                          },
                        );
                      } else {
                        return new AutoSizeText(
                          "O resultado aparecerá aqui!",
                          maxLines: 2,
                          style:
                              new TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
