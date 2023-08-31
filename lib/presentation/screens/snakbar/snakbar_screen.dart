import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  /// Muestra un snackbar personalizado
  void showCustomSnackbar(BuildContext context){
    //Limpia todos los snackbar que esten en pantalla
    ScaffoldMessenger.of(context).clearSnackBars();

    //Crear un snackbar y lo guarda en una variable
    final snackbar =  SnackBar(
      //Le da un contenido al snackbar
      content: const Text('Hola Mundo'),
      //Le dar una accion al snackbar
      action: SnackBarAction(
        label: 'Oki',
        onPressed: (){},
      ),
      //Establece la duracion del snackbar
      duration: const Duration(seconds: 2),
    );

    //Muestra el snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  /// Muestra un dialogo personalizado
  void openDialog(BuildContext context){
    showDialog(
      context: context,
      //Fuerza al usuario a presionar un boton para cerrar el dialogo 
      barrierDismissible: false,
      //Crea un dialogo
      builder: (context) => AlertDialog(
        //Le da un titulo y un contenido al dialogo
        title: const Text("Seguro de ver las licencias?"),
        content: const Text("Eu est proident cupidatat pariatur ipsum veniam laborum mollit sit tempor id mollit irure. Amet commodo culpa ipsum irure id tempor cillum quis. Lorem reprehenderit enim dolore nisi deserunt amet non eiusmod laborum quis do. Et duis officia esse id dolor aute ex eu cillum voluptate laboris quis sint laborum. Nulla irure fugiat ad exercitation Lorem ut nulla tempor eu. Quis ex dolore occaecat eu fugiat pariatur dolor fugiat pariatur consectetur proident consectetur deserunt."),
        //Le da un boton de cancelar y un boton de aceptar al dialogo
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: const Text("Cancelar")),
          FilledButton(onPressed: ()=>context.pop(), child: const Text("Aceptar")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars Y Dialogos'),
      ),

      body: Center(
        //Crea una columna
        child: Column(
          //Centra los elementos
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Crea boton de Licencias Utilizadas 
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("Listado de Licencias Utilizadas en esta aplicacion")
                  ]
                );
              }, 
              child: const Text("Licencias Utilizadas")
            ),

            //Crea boton de Mostrar Dialogo de Pantalla
            FilledButton.tonal(
              onPressed: ()=>openDialog(context), 
              child: const Text("Mostrar Dialogo de Pantalla")
            ),
          ],
        ),
      ),

      //crea un boton flotante
      floatingActionButton: FloatingActionButton.extended(
        //Le da un texto y un icono
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),

        //Al presionar el boton llama a la funcion showCustomSnackbar
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}