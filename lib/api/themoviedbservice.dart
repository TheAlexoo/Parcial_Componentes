import 'movie.dart';
import 'movies.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



  final String API_url = "https://api.themoviedb.org/3";
  final String API_key = "194fb73ba2102ff59a54efa737756a5f";

  Future<List<Movie>> getTopRatedMovies() async{
    var url = API_url + "/movie/top_rated?api_key=" + API_key + "&language=es";
    final respuesta = await http.get(Uri.parse(url));

    if(respuesta.statusCode == 200){
      final respuestaJSON = json.decode(respuesta.body);
      final peliculasMejorValoradas = Movies.fromJsonList(respuestaJSON['results']);
      return peliculasMejorValoradas;
    } 
    return <Movie>[];
  }  
