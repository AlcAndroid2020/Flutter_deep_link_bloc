import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

class PocWidget extends StatelessWidget {
  String parameter, page;

  goDetailpage(BuildContext context, String parameter, bool gotParameter) {
    if (gotParameter == true) {
      return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailedPage(parameter: parameter)),
      );
    } else {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DealPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        parameter = snapshot.data;

        if (!snapshot.hasData) {
          return Container(
              child: Center(
                  child: Text('No deep link was used  ',
                      style: Theme.of(context).textTheme.title)));
        } else {
          var str = snapshot.data.toString().split('/');
          if (str[3].trim() != "") page = str[3].trim();
          if (str[4] != "") parameter = str[4].trim();

          if (page != "") {
            if (parameter != "")
              return goDetailpage(context, parameter, true);
            else
              return goDetailpage(context, parameter, false);
          } else {
            return Container(
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Text('Redirected: ${snapshot.data}',
                                style: Theme.of(context).textTheme.title),
                          ],
                        ))));
          }
        }
      },
    );
  }
}

class DetailedPage extends StatefulWidget {
  String parameter;

  DetailedPage({this.parameter});

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Container(
          child: Text(widget.parameter),
        ));
  }
}

class DealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Deal Page"),
        ),
        body: Container(
          child: Text("this deal page"),
        ));
  }
}
