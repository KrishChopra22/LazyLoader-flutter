import 'dart:async';
import 'package:english_words/english_words.dart';

/// Example data as it might be returned by an external service
/// ...this is often a `Map` representing `JSON` or a `FireStore` document
Future<List<Map>> _getExampleServerData(int length) {
  return Future.delayed(Duration(seconds: 1), () {
    return List<Map>.generate(length, (int index) {
      return {
        "body": WordPair.random().asPascalCase,
        "avatar":
            'https://avatars.dicebear.com/api/avataaars/${WordPair.random().asPascalCase}.png',
      };
    });
  });
}

/// PostModel has a constructor that can handle the `Map` data
/// ...from the server.
class PostModel {
  String body;
  String avatar;
  PostModel({required this.body, required this.avatar});
  factory PostModel.fromServerMap(Map data) {
    return PostModel(
      body: data['body'],
      avatar: data['avatar'],
    );
  }
}

/// PostsModel controls a `Stream` of posts and handles
/// ...refreshing data and loading more posts
class PostsModel {
  late Stream<List<PostModel>> stream;
  late bool hasMore;

  late bool _isLoading;
  late List<Map> _data;
  late StreamController<List<Map>> _controller;

  PostsModel() {
    _data = <Map>[];
    _controller = StreamController<List<Map>>.broadcast();
    _isLoading = false;
    stream = _controller.stream.map((List<Map> postsData) {
      return postsData.map((Map postData) {
        return PostModel.fromServerMap(postData);
      }).toList();
    });
    hasMore = true;
    refresh();
  }

  Future<void> refresh() {
    return loadMore(clearCachedData: true);
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = <Map>[];
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    return _getExampleServerData(10).then((postsData) {
      _isLoading = false;
      _data.addAll(postsData);
      hasMore = (_data.length < 80);
      _controller.add(_data);
    });
  }
}
