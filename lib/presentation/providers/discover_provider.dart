//Instalamos PROVIDER, CTRL + SHIFT + P y teclerar PUBASSIST, clic y teclear PROVIDER y ENTER
// LEER Y ASIGNAR LOS VIDEOS AL PROVIDER

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';


class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepositoy videosRepository;  //VIDEOPOSTREPOSITOY proviene de la clase ABSTRACTA

  //TODO repository, DataSource(fuente de la data)

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
    });


  Future<void> loadNextPage() async {

    //await Future.delayed( const Duration(seconds: 2) );

    //final List<VideoPost> newVideos = videoPosts.map(
     // (video) => LocalVideoModel.fromJason(video).toVideoPostEntity()
      //).toList();


    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();

  }

}