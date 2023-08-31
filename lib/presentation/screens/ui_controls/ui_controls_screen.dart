import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  
  static const name = 'iu_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, horse, boat }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDev = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        //Crea un control de switch
        SwitchListTile(
          title: const Text('Dev23 Mode'),
          subtitle: const Text('Enable dev23 mode'),
          value: isDev, 
          //Cambia el valor del switch al presionarlo
          //Como es un stateful widget, se debe usar setState
          onChanged: (value) => setState( (){
            isDev = !isDev;
          } )
        ),

        //Agrupa todas las opciones en un expansion tile
        ExpansionTile(
          title: const Text("Vehicle"),
          subtitle: Text('$selectedTransportation'),
          children: [

            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Fastest way'),
              value: Transportation.car, 
              //Valor ligado
              groupValue: selectedTransportation,
              //Al cambiar de valor actualiza el estado 
              onChanged: (value) => setState( (){
                selectedTransportation = Transportation.car;
              }),
            ),

            RadioListTile(
              title: const Text('By Bike'),
              subtitle: const Text('Slowest way'),
              value: Transportation.bike, 
              //Valor ligado
              groupValue: selectedTransportation,
              //Al cambiar de valor actualiza el estado 
              onChanged: (value) => setState( (){
                selectedTransportation = Transportation.bike;
              }),
            ),

            RadioListTile(
              title: const Text('By Horse'),
              subtitle: const Text('Slowest way'),
              value: Transportation.horse, 
              //Valor ligado
              groupValue: selectedTransportation,
              //Al cambiar de valor actualiza el estado 
              onChanged: (value) => setState( (){
                selectedTransportation = Transportation.horse;
              }),
            ),
            
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Slowest way'),
              value: Transportation.boat, 
              //Valor ligado
              groupValue: selectedTransportation,
              //Al cambiar de valor actualiza el estado 
              onChanged: (value) => setState( (){
                selectedTransportation = Transportation.boat;
              }),
            ),
          ],
        ),


        //Crea un control de checkbox
        CheckboxListTile(
          title: const Text('Include Breakfast'),
          //Valor ligado
          value: wantsBreakfast,
          //Actualiza el estado al cambiar de valor 
          onChanged: (value) => setState((){
            wantsBreakfast = !wantsBreakfast;
          })
        ),
        CheckboxListTile(
          title: const Text('Include Lunch'),
          //Valor ligado
          value: wantsLunch, 
          //Actualiza el estado al cambiar de valor 
          onChanged: (value) => setState((){
            wantsLunch = !wantsLunch;
          })
        ),
        CheckboxListTile(
          title: const Text('Include Dinner'),
          //Valor ligado
          value: wantsDinner, 
          //Actualiza el estado al cambiar de valor 
          onChanged: (value) => setState((){
            wantsDinner = !wantsDinner;
          })
        ),


      ],
    );
  }
}