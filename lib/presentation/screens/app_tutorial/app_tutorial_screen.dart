import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Veniam commodo amet esse dolor mollit ex Lorem eu magna anim est.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Pariatur nostrud deserunt adipisicing irure nostrud ut eu consectetur.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Velit non quis commodo sunt exercitation magna labore irure mollit cillum ipsum deserunt.', 'assets/images/3.png'),
];



class AppTutorial extends StatefulWidget {
  
  static const name = 'app_tutorial_screen';

  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    //Evento que se ejecuta al hacer cambio de pagina en el pageview
    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0;
      //Si el usuario llega al final del tutorial, 
      //se muestra el boton de comenzar
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });

  }

  @override
  void dispose() {
    //Siempre se recomienda llamar al metodo dispose 
    //al usar controladores
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //PageView es un widget que permite mostrar una lista de widgets 
      //de forma horizontal
      body: Stack(
        children: [
          _TutorialPageView(controller: pageViewController),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Salir"),
              onPressed: () => context.pop(),
            )
          ),
          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 100),
              child: FilledButton(
                child: const Text("Comenzar"),
                onPressed: () => context.pop(),
              ),
            )
          ) : const SizedBox(),
        ],
      ),
    );
  }
}

///Widget personalizado que muestra los slides
class _TutorialPageView extends StatelessWidget {

  final PageController controller;
  const _TutorialPageView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller ,
      physics: const BouncingScrollPhysics(),
      children: slides.map(
        //Llama al widget _Slide y le pasa los datos de cada slide 
        //que estan en la lista slides
        (slideData) => _Slide(
          title: slideData.title,
          caption: slideData.caption,
          imageUrl: slideData.imageUrl,
        )
      ).toList(),
      
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          //Centra los elementos de manera vertical
          mainAxisAlignment: MainAxisAlignment.center,
          //Alinea los elementos a la izquierda de manera horizontal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}