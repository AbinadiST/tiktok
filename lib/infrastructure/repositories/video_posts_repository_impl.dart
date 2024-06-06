

//Aqui estamos indicando que nos manden un ORIGEN DE DATOS para SÓLO llamar esos ORÍGENES DE DATOS
import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepositoy{

  //Necesitamos una fuente de datos, que es la siguiente
  final VideoPostsDatasource videosDatasource;

  VideoPostsRepositoryImpl({
    required this.videosDatasource
    }); 

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }


}