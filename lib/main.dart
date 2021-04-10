import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _textSize = 20.0;
  double _spaceSize = 10.0;
  String _title = "Calculadora IMC";
  String _result = "Info";

  TextEditingController edtPesoController = TextEditingController();
  TextEditingController edtAlturaController = TextEditingController();

  void _resetCampos() {
    setState(() {
      edtPesoController.text = "";
      edtAlturaController.text = "";
      _result = "Informe seus dados!";
    });
  }

  void _btnCalcular() {

    String resultado = "";

    double peso = double.parse(edtPesoController.text);
    double altura = double.parse(edtAlturaController.text) / 100 ;
    double imc = peso / (altura * altura);

    if(imc < 18.6)
      resultado = " Abaixo do peso (${imc.toStringAsPrecision(3)})";
    else if(imc >= 18.6 && imc < 24.9)
      resultado = " Peso ideal (${imc.toStringAsPrecision(3)})";
    else if(imc >= 24.9 && imc < 29.9)
      resultado = " Levemente acima do peso (${imc.toStringAsPrecision(3)})";
    else if(imc >= 29.9 && imc < 34.9)
      resultado = " Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
    else if(imc >= 34.9 && imc < 39.9)
      resultado = " Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
    else if(imc >= 40 )
      resultado = " Obesidade grau 3 (${imc.toStringAsPrecision(3)})";

    setState(() {
      _result = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: Icon(Icons.replay_outlined),
              onPressed: () {
                _resetCampos();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person, size: 80, color: Colors.green),
            Padding(
              padding: EdgeInsets.all(_spaceSize),
              child: TextField(
                controller: edtPesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso {kg}",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _textSize, color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_spaceSize),
              child: TextField(
                controller: edtAlturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura {cm}",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _textSize, color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_spaceSize),
              child: Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {_btnCalcular();},
                  child: Text("Calcular",
                      style:
                      TextStyle(color: Colors.white, fontSize: _textSize)),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(_spaceSize),
                child: Text(
                  _result,
                  style: TextStyle(fontSize: _textSize, color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ));
  }
}
