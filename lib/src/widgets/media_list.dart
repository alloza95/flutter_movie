import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/widgets/media_list_item.dart';
import '../commons/http_request.dart';
import '../models/media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async{
    var movies = await HttpHandler().fetchMovies();
    setState(() {
     _media.addAll(movies); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem(media: _media[index]);
        },
      ),
    );
  }
}