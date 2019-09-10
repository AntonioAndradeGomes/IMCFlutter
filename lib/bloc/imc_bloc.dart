import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculadora_imc/validators/imc_validators.dart';
import 'package:rxdart/rxdart.dart';

class IMCBloc extends BlocBase with IMCValidators{

  final _alturaController = BehaviorSubject<String>();
  final _pesoController = BehaviorSubject<String>();
  final _situacaoController = BehaviorSubject<String>();

  Stream<String> get outAltura => _alturaController.stream.transform(validateAltura);
  Stream<String> get outPeso => _pesoController.stream.transform(validatePeso);

  Stream<String> get outSituacao => _situacaoController.stream;


  Stream<bool> get outSubmitValid => Observable.combineLatest2(
    outAltura, outPeso, (a,b) => true);

  Function(String) get changeAltura => _alturaController.sink.add;
  Function(String) get changePeso => _pesoController.sink.add;


  void submit(){
    double altura = double.parse(_alturaController.value);
    double peso = double.parse(_pesoController.value);
    double imc = peso/(altura *  altura);
    if(imc < 18.5){
      
      _situacaoController.add("Você está abiaxo do peso! \n IMC: ${imc.toStringAsFixed(2)}");
    }else if(imc >= 18.5 && imc <= 24.9){
      _situacaoController.add("Você está no peso normal! \n IMC: ${imc.toStringAsFixed(2)}");
    }else if(imc >= 25 && imc <= 29.9){
      _situacaoController.add("Você está com sobrepeso! \n IMC: ${imc.toStringAsFixed(2)}");
    }else if(imc >= 30){
      _situacaoController.add("Você está em um grau de obesidade! \n IMC: ${imc.toStringAsFixed(2)}");
    }
  }

  @override
  void dispose() {
    _alturaController.close();
    _pesoController.close();
    _situacaoController.close();
  }

}