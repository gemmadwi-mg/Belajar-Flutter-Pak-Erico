import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        create: (_) => ColorBloc(Colors.amber),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              colorBloc.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              colorBloc.add(ColorEvent.to_lightBlue);
            },
            backgroundColor: Colors.blue,
          )
        ],
      ),
      appBar: AppBar(
        title: Text('BLOC dengan Flutter_Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (_, currentColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 100,
            height: 100,
            color: currentColor,
          ),
        ),
      ),
    );
  }
}
