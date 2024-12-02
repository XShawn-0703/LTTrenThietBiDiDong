import 'package:flutter/material.dart';

class BT2 extends StatelessWidget {
  final List<Map<String, dynamic>> articles = [
    {'title': 'Bài viết 1', 'description': 'Mô tả ngắn gọn về bài viết 1', 'imageUrl': 'https://picsum.photos/200/199',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 3', 'description': 'Mô tả ngắn gọn về bài viết 3', 'imageUrl': 'https://picsum.photos/200/198',},
    {'title': 'Bài viết 4', 'description': 'Mô tả ngắn gọn về bài viết 4', 'imageUrl': 'https://picsum.photos/200/197',},
    {'title': 'Bài viết 5', 'description': 'Mô tả ngắn gọn về bài viết 5', 'imageUrl': 'https://picsum.photos/200/196',},
    {'title': 'Bài viết 6', 'description': 'Mô tả ngắn gọn về bài viết 6', 'imageUrl': 'https://picsum.photos/200/195',},
    {'title': 'Bài viết 7', 'description': 'Mô tả ngắn gọn về bài viết 7', 'imageUrl': 'https://picsum.photos/200/194',},
    {'title': 'Bài viết 8', 'description': 'Mô tả ngắn gọn về bài viết 8', 'imageUrl': 'https://picsum.photos/200/193',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},
    {'title': 'Bài viết 2', 'description': 'Mô tả ngắn gọn về bài viết 2', 'imageUrl': 'https://picsum.photos/200/200',},


    // Thêm các bài viết khác vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(
      child: Text('Trang chủ'),
      ),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            leading: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(

                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(articles[index]['imageUrl']),

                  fit: BoxFit.cover,

                ),
              ),
            ),
            title: Text(articles[index]['title']),
            subtitle: Text(articles[index]['description']),
          ),
          );
        },
      ),
    );
  }
}