import 'package:flutter/material.dart';
import 'package:parcial1_componentes/api/themoviedbservice.dart';
import 'package:parcial1_componentes/api/movies.dart';
import 'package:parcial1_componentes/api/movie.dart';
import 'package:parcial1_componentes/ui/cajapelicula.dart';
import 'package:parcial1_componentes/ui/spinnerwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDBPage(),
    );
  }
}

class MovieDBPage extends StatelessWidget{
  @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Pélis mas valoradas'),
       ),
       body: FutureBuilder(
         initialData: [],
         future: getTopRatedMovies(),
         builder: 
         (BuildContext context, AsyncSnapshot<List> snapshot){
           if(snapshot.hasData){
             return ListView.builder(
               itemCount: snapshot.data!.length,
               itemBuilder: (context, index){
                 var youtuber = snapshot.data![index];
                 return CajaPelicula(peli: youtuber);
               },
             );
           } else {
              return SpinnerWidget();
           }
         }
       ),
     );
   }
}