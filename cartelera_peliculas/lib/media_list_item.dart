import 'package:flutter/material.dart';
import 'model/Media.dart';

class MediaListItem extends StatelessWidget {
  //! Atributos
  final Media media;
  //! Constructor
  const MediaListItem({Key key, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: new Stack(
              children: <Widget>[
                //? Mostrar la imagen de fonfo
                new FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg',
                  image: media.getBackDropUrl(),
                  fit: BoxFit.cover,
                  fadeInDuration: new Duration(milliseconds: 40),
                  height: 200.0,
                  width: double.infinity,
                ),
                //? Contenedor gris traparente para info
                new Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    decoration: new BoxDecoration(,
                      color: Colors.grey[900].withOpacity(0.5)
                    ),
                    constraints: new BoxConstraints.expand(height: 55.0),
                  ),
                ),
                //? Info del contenedor gris
                new Positioned(
                  left: 10.0, 
                  bottom: 30.0, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //* Nombre
                      new Container(
                        child: Text(
                          media.title, 
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //* Generos
                      new Container(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: new Text(
                          media.getGenres(), 
                          style: new TextStyle(
                            color: Colors.white
                          ), 
                          maxLines: 1, 
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
