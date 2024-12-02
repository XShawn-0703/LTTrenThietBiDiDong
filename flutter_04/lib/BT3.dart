import 'package:flutter/material.dart';


class Home extends StatelessWidget {

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
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ sơ'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300, // Đặt chiều rộng cố định cho Card
          child: Card(
            //color: Colors.blue, // Màu nền nhạt của Card
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellow,
                    backgroundImage: NetworkImage('https://picsum.photos/200/200'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tên người dùng',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email: email@example.com'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Text('Số điện thoại: 0123456789'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:   Text('Đăng nhập'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  // Thêm các quy tắc validation khác ở đây
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Ẩn mật khẩu khi nhập
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  // Thêm các quy tắc validation khác ở đây
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Dữ liệu hợp lệ, thực hiện đăng nhập
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');

                    // Chuyển đến form tiếp theo
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
                    );
                  } else {
                    // Hiển thị thông báo lỗi nếu dữ liệu không hợp lệ
                    // Ví dụ:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Vui lòng nhập đầy đủ thông tin đăng nhập'),
                      ),
                    );
                  }
                },
                child: Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

//
class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  // Sử dụng các class có sẵn
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    ProfilePage(),

  ];
  // Hàm xử lý khi tap vào item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chu',
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Ho so',
            )
          ],
          // Index cua item dang duoc chon
          currentIndex: _selectedIndex,
          // Màu của item khi được chọn
          selectedItemColor: Colors.amber[800],
          // Hàm xử lý khi tap vào item
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
