// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'bai_1/ex1.dart';
// // import 'bai_2/ex2.dart';
// import 'bai_3/ex3.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// //import 'bai_1/ex1.dart';
// //import 'bai_2/ex2.dart';
// import 'bai_3/ex3.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoListScreen()
    );
  }
}
// import 'bai_4/ex4.dart';
// void main() {
//   runApp(
//         ChangeNotifierProvider(
//           create: (context)=>CounterProvider(),
//           child: const MyApp(),
//         ),
//
//   );
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const CounterScreen()
//     );
//   }
// }


