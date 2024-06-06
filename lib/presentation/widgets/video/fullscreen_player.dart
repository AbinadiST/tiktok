//VIDEO PLAYER

import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
    {super.key, 
    required this.videoUrl, 
    required this.caption
    });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() { // ciclo de vida de STATEFULWIDGET
    super.initState();

// Propiedades para el video --------------------------------------------------------------
  controller = VideoPlayerController.asset( widget.videoUrl )
  ..setVolume(0) // Para quitar el volumen
  ..setLooping(true) // para que se reproduzcan nuevamente al llegar al final
  ..play(); // se reproduzca automaticamente

  }

//Termina reproduccion del video ---------------------------------------------------------
  @override
  void dispose() { // evitamos que el video se siga reproduciendo cuando ya no lo estemos viendo
    controller.dispose(); // se hace una limpieza al contolador
    super.dispose();
  }


//Reproduccion del video -----------------------------------------------------------------
  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {

        if ( snapshot.connectionState != ConnectionState.done ){
          // si el VIDEO es diferente a YA PARA REPRODUCIRSE, aparece el PROGRESSINDICATOR
          return const Center( child: CircularProgressIndicator( strokeWidth: 2));

        }

        return GestureDetector( //detector de gestos 
        onTap: () {
          if( controller.value.isPlaying) {
            controller.pause();
            return;
          }
          controller.play();
        },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
        
                VideoPlayer(controller),
        
                //Gradiente
                VideoBackground(
                  stops: const [0.8, 1.0], 
                  // Indicamos que la transparencia empiece desde 0% al 80% 
                  //y desde ese punto que empiece el gradiente al final(100%) 
                ),

        
        
                //Texto
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                  ),
        
        
        
              ],
            )
          ),
        );
        
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle),
    );
  }
}
