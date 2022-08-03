import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool value = false;

  final alturaTextController = TextEditingController();
  final pesoTextController = TextEditingController();

  String texto = 'Descubra se você está no peso ideal!';
  String imagens = 'imc';

  calculoIMC() {
    double altura = double.parse(alturaTextController.text);
    double alturaCM = altura / 100;
    double peso = double.parse(pesoTextController.text);
    double imc = peso / (alturaCM * alturaCM);

    if (imc < 18.5) {
      texto = 'Abaixo do peso';
      imagens = 'imc_azul';
    } else if (imc <= 24.9) {
      texto = 'Normal';
      imagens = 'imc_verde';
    } else if (imc <= 29.9) {
      texto = 'Sobrepeso';
      imagens = 'imc_amarelo';
    } else if (imc <= 39.9) {
      texto = 'Obesidade';
      imagens = 'imc_laranja';
    } else if (imc > 40) {
      texto = 'Obesidade grave';
      imagens = 'imc_vermelho';
    } else {
      texto = 'tente novamente';
    }
  }

  voltarimc() {
    texto = 'Descubra se você está no peso ideal!';
    imagens = 'imc';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Calculadora IMC',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/$imagens.jpeg'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '$texto',
                    style: TextStyle(fontSize: 22.9, fontWeight: FontWeight.w600, color: Colors.blue.shade900),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: alturaTextController,
                          decoration: InputDecoration(
                              suffixText: 'cm',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade900, width: 1.5),
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                              ),
                              suffixStyle:
                              TextStyle(color: Colors.blue.shade900),
                              labelText: 'Altura',
                              hintText: 'Digite sua altura',
                              hintStyle: TextStyle(color: Colors.blue.shade900),
                              labelStyle: TextStyle(color: Colors.blue.shade900)),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextField(
                          controller: pesoTextController,
                          decoration: InputDecoration(
                              suffixText: 'Kg',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade900, width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixStyle:
                              TextStyle(color: Colors.blue.shade900),
                              labelText: 'Peso',
                              hintText: 'Digite seu peso',
                              hintStyle: TextStyle(color: Colors.blue.shade900),
                              labelStyle: TextStyle(color: Colors.blue.shade900)),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print(calculoIMC());
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    child: Text('Calcular', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150)),
                      primary: Colors.blue.shade900,
                      fixedSize: Size(300, 50),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print(voltarimc());
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                    },
                    child: Text('Voltar', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150)),
                      primary: Colors.blue.shade900,
                      fixedSize: Size(150, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
