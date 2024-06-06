import 'package:toktik/domain/entities/video_post.dart';



abstract class VideoPostRepositoy{
// es ABSTRACT para que no se creen instancias de esta clase 
// El REPOSITORY termina llamando al DATASOURCE

Future<List<VideoPost>> getFavoriteVideosByUser( int page);

Future<List<VideoPost>> getTrendingVideosByPage( int page);


}