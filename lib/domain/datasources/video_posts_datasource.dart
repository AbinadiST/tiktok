import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsDatasource{
// es ABSTRACT para que no se creen instancias de esta clase 

Future<List<VideoPost>> getFavoriteVideosByUser( int page);

Future<List<VideoPost>> getTrendingVideosByPage( int page);


}