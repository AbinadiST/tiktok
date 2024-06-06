// IMPLEMENTACIONES


//Aqui estamos definiendo la forma de cómo vamos a procesar los videos locales
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostsDatasource{
  //Para considerarse un VIDEOPOSTSDATASOURCE debe implementar los 2 métodos que tiene 
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    
    await Future.delayed( const Duration(seconds: 2));

    //Esta implementacion lo copiamos de DISCOVER PROVIDER
     final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJason(video).toVideoPostEntity()
      ).toList();
    
    return newVideos;
  }


}