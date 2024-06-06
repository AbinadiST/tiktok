//CIRCULAR PROGRESS Y PAGEVIEW

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';


class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key, 
    required this.videos
    });

  
  @override
  Widget build(BuildContext context) {
    return PageView.builder( // BIULDER = eficaz, parecido al RECYCLERVIEW
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(), //solo para ANDROID y realiza rebote de imagen
      itemCount: videos.length,  // cantidad de videos que ya tenemos 
      itemBuilder: (context, index) {
        //ITEMBUILDER = conforma pare del PAGEVIEW.BUILDER

        final VideoPost videoPost = videos[index]; 
        // VideoPost es tipo de DATO, tambien se puede evitar el doble VIDEOPOST, con solo uno

        return Stack(//Para colocar elementos unos encima de otros
          children: [

            // Video Player + gradiente------------------------------------------------------
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              )
            ),


            // Botones-----------------------------------------------------------------------

            Positioned( // Colocamos la posicion del icono FAVORITE
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
              ),
          ],

        );
      },
    );
  }
}



