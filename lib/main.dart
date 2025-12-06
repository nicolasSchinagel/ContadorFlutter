import 'package:flutter/material.dart';


void main(){
  runApp(
    MyApp()
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decremento() {
    setState(() {
      contador--;
    });
    print("decremento");
  }
  bool get isEmpty => contador == 0;
  bool get isFull => contador == 20;
  void incremento() {
    setState(() {
      contador++;
    });
    print("incremento");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background1.jpg'), // sem barra inicial
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode Entrar',
              style: TextStyle(
                fontSize: 26.0,
                color: isFull? Colors.yellow : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                contador.toString(),
                style: TextStyle(
                  fontSize: 26,
                  color: isFull? Colors.red : Color.fromARGB(255, 184, 224, 255),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decremento,
                  style: TextButton.styleFrom(
                    backgroundColor:isEmpty ?Colors.red : Colors.yellow,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Sair',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 32),
                TextButton(
                  onPressed: isFull ? null : incremento,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull?Colors.red : Colors.yellow,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black),
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
