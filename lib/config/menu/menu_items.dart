import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
      required this.title, 
      required this.subTitle, 
      required this.link, 
      required this.icon
    });
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Botones', 
    subTitle: 'Botonera en flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),


  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'ProgressIndicators', 
    subTitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y Dialogos', 
    subTitle: 'Indicadores en Pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated Container', 
    subTitle: 'Stateful Widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outlined
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'Controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.contact_support_rounded
  ),

  MenuItem(
    title: 'Introduccion a la aplicacion', 
    subTitle: 'Tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.book_outlined
  ),

  MenuItem(
    title: 'InfiniteScroll & Pull', 
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_outlined
  ),


];