import 'package:deep_links_flutter/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

void main() => runApp(MaterialApp(
  title: "Dynamic link bloc",
  routes: <String,WidgetBuilder>{
'/':(BuildContext context)=>PocApp(),
    '/deals':(BuildContext context)=>DealPage(),


  },
));

class PocApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = DeepLinkBloc();
    return MaterialApp(

        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              title: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.blue,
                fontSize: 25.0,
              ),
            )),
        home: Scaffold(
          appBar: AppBar(title: Text("Flutter dynamic link Bloc")),
            body: Provider<DeepLinkBloc>(
                create: (context) => _bloc,
                dispose: (context, bloc) => bloc.dispose(),
                child: PocWidget())));
  }
}





