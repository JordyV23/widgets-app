import "dart:math";
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  double borderRadius = 10;
  Color color = Colors.red;

  void changeShape(){
    final random =  Random();
    width = random.nextInt(300).toDouble() + 120;
    height = random.nextInt(300).toDouble() + 120;
    borderRadius = random.nextInt(100).toDouble() + 20;
    
    //Genera un color aleatorio en RGB
    color = Color.fromRGBO(
      random.nextInt(255), //red
      random.nextInt(255), //green
      random.nextInt(255), //blue
      1
    );

    setState(() {
      
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        //Crea un contenedor animado
        child: AnimatedContainer(
          //Le asigna una duracion a la animacion
          duration: const Duration(milliseconds: 400),
          //Cambia el tipo de animacion
          curve: Curves.easeInOutCubic,
          //Si el ancho es menor o igual a 0, se asigna 0
          width: width <= 0 ? 0 : width,
          //Si el alto es menor o igual a 0, se asigna 0
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            //Si el radio es menor o igual a 0, se asigna 0
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius )
          ),
        ),
      ),

      //Creando un boton flotante
      floatingActionButton: FloatingActionButton(
        //Al presionar el boton se ejecuta la funcion changeShape
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}