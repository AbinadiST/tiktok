//MAPPER - VIDEOPOST - LOCALVIDEO

//El objetivo de este LOCAL_VIDEO_MODEL es para que nos ayude a MAPEAR el LOCAL_VIDEO_POSTS
//Los tipos de datos lo sacamos de LOCALVIDEOPOSTS

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes = 0, 
    this.views = 0
    });


    //Con esto hacemos MATCH a las propiedades del CLASS LOCALVIDEOPOSTS
    factory LocalVideoModel.fromJason(Map<String, dynamic> json) => LocalVideoModel(
      name: json['name'] ?? 'No name', 
      videoUrl: json['videoUrl'],
      likes: json['likes'] ?? 0,
      views: json['views'] ?? 0
      );

      VideoPost toVideoPostEntity() => VideoPost(
        //los argumentos del lado derecho, son de la instancia que vamos a crear del metodo VIDEOPOST
        //los argumentos del lado izq, son las propiedades con nombre del VIDEOPOST

        caption: name, //Aqui estamos MAPEANDO el NAME de LOCALVIDEOMODEL con el VIDEOPOST
        videoUrl: videoUrl,
        likes: likes,
        views: views
        );
}