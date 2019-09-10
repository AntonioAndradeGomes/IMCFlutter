import 'dart:async';



class IMCValidators{

  final validateAltura = StreamTransformer<String, String>.fromHandlers(
    handleData: (altura, sink){
      if(altura.contains(",") == false){
        double alt = double.tryParse(altura);
        if(alt != null){
          sink.add(altura);
        }else{
          sink.addError("A altura deve ser um número decimal");
        }
      }else{ 
        sink.addError("Insira ponto no lugar da vírgula");
      }
    }
  );
  final validatePeso = StreamTransformer<String, String>.fromHandlers(
    handleData: (peso, sink){
      if(peso.contains(",") == false){
        double p = double.tryParse(peso);
        if(p != null){
          sink.add(peso);
        }else{
          sink.addError("O peso deve ser um número decimal");
        }
      }else{ 
        sink.addError("Insira ponto no lugar da vírgula");
      }
    }
  );
}