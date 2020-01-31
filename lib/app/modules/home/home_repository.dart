import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:marvelpedia/app/models/character.dart';
import 'package:crypto/crypto.dart';
import 'package:mobx/mobx.dart';

class HomeRepository extends Disposable {
  final Dio _client;

  HomeRepository(this._client);

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  Future<ObservableList<Character>> getCharacterList() async {
    var ts = new DateTime.now().millisecondsSinceEpoch;
    var encoded = utf8.encode(ts.toString()+"priv_key"+"pub_key");
    var hash = md5.convert(encoded);
    var url = "http://gateway.marvel.com/v1/public/characters?ts="+ts.toString()+"&apikey=8536ee7e2c02b177dd1328209053f05f"+"&hash="+hash.toString();
    final response =
        await _client.get(url);

    var list  = List<Character>.from(response.data["data"]["results"].map((item) => Character.fromJson(item)));
    return list.asObservable();
  }


  Future<List<Character>> getCharacterSimpleList() async {
    var ts = new DateTime.now().millisecondsSinceEpoch;
    var encoded = utf8.encode(ts.toString()+"priv_key"+"pub_key");
    var hash = md5.convert(encoded);
    var url = "http://gateway.marvel.com/v1/public/characters?ts="+ts.toString()+"&apikey=8536ee7e2c02b177dd1328209053f05f"+"&hash="+hash.toString();
    final response =
        await _client.get(url);

    var list  = List<Character>.from(response.data["data"]["results"].map((item) => Character.fromJson(item)));
    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
