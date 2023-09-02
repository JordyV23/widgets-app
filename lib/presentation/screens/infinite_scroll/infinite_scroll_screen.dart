import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {


  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener( () {
        //*Para obtener posicion actual del scroll
        //scrollController.position.pixels;

        //*Para obtener el maximo scroll
        //scrollController.position.maxScrollExtent;

        if(scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent){
          loadNextPage();
        }

      }
    ); 
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }


  ///Metodo que carga la siguiente pagina de imagenes
  ///en la lista, simulando una peticion http
  Future loadNextPage() async {
    //Valida si ya se esta cargando la siguiente pagina
    //Si es asi, no se ejecuta el metodo
    if(isLoading) return;
    //Si no esta cargando, se cambia a true
    isLoading = true;
    setState(() {});
    //Se agrega un delay de 2 segundos para simular una peticion http
    await Future.delayed(const Duration(seconds: 2));
    addImages();
    isLoading = false;
    //Si el widget ya no esta montado, no continua
    if(!isMounted) return;
    setState(() {});

    moveScroll(scrollController.position.pixels+120);
  }

  ///Metodo que agrega 5 imagenes a la lista de imagenes
  void addImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId+e)
    );
  }

  ///Metodo que se ejecuta al hacer pull to refresh
  Future<void> onRefresh() async{
    //Activa el loading
    isLoading = true;
    setState(() { });

    //Simula una peticion http
    await Future.delayed(const Duration(seconds: 3));
    //Si el widget ya no esta montado, no continua
    if(!isMounted) return;

    //Se agrega una imagen mas a la lista
    isLoading = false;
    final lastId = imagesIds.last;
    //Se limpia la lista de imagenes
    imagesIds.clear();
    //Se agregan las imagenes nuevas
    imagesIds.add(lastId+1);
    addImages();

    //Se actualiza el estado del widget
    setState(() { });
    moveScroll(0);
  }

  ///Metodo que mueve el scroll a la posicion indicada
  void moveScroll(double pixels){
    //Mueve el scroll al final solo si el scroll no esta en el final
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return; 
  
    scrollController.animateTo(
      pixels, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      //removePadding: Remueve el padding del body
      body: MediaQuery.removePadding(
        //Necesita un context para poder remover el padding
        context: context,
        //Remueve el padding del top
        removeTop: true,
        //Crea un lisview con un scroll de 5 imagenes
        child: _ImageList(scrollController: scrollController, imagesIds: imagesIds, onRefresh: onRefresh),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : ()=> context.pop(), 
        child: isLoading ? const _SpinningIcon() : const _ArrowBackIcon(),
      ),
    );
  }
}

class _ImageList extends StatelessWidget {
  const _ImageList({
    required this.scrollController,
    required this.imagesIds,
    required this.onRefresh,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      edgeOffset: 10,
      strokeWidth: 2,
      child: ListView.builder(
        controller: scrollController ,
        //La longitud de la lista es la cantidad de imagenes
        itemCount: imagesIds.length,
        //Creacion de las imagenes en ejecucion
        itemBuilder: (context, index){
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            //Lo que se muestra mientras se carga la imagen
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            //La imagen que se muestra 
            image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
          );
        }
      ),
    );
  }
}

class _ArrowBackIcon extends StatelessWidget {
  const _ArrowBackIcon();

  @override
  Widget build(BuildContext context) {
    return FadeIn(child: const Icon(Icons.arrow_back));
  }
}

class _SpinningIcon extends StatelessWidget {
  const _SpinningIcon();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: SpinPerfect (
        infinite: true,
        child: const Icon(Icons.refresh_rounded)
      ),
    );
  }
}