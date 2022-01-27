import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  await Future.delayed(Duration(seconds: 2));

  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Album? album;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> albumuYukle() async {
    try {
      setState(() {
        isLoading = true;
      });
      Album album = await fetchAlbum();
      setState(() {
        this.album = album;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        actions: [
          IconButton(
            onPressed: () {
              albumuYukle();
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator() : album == null
            ? Text('Henüz başlamadı')
            : Text(album!.title)
      ),
    );
  }

}