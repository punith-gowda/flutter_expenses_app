import 'package:expenses_app/widgets/chart.dart';
import 'package:expenses_app/widgets/new_transcation.dart';
import 'package:expenses_app/widgets/transcations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transcation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      // ignore: deprecated_member_use
      theme: ThemeData(
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    titleLarge: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        color: Colors.white))
                .headline6),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.purple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transcation> _userTranscations = [];

  List<Transcation> get _recentTranscations {
    return _userTranscations.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTranscation(String _title, double _amount, DateTime _date) {
    final newTx = Transcation(
        title: _title,
        amount: _amount,
        date: _date,
        id: DateTime.now().toString());

    setState(() {
      _userTranscations.add(newTx);
    });
    Navigator.of(context).pop();
  }

  void _deleteTranscation(String id) {
    setState(() {
      _userTranscations.removeWhere((tx) => tx.id == id);
    });
  }

  void _startNewTranscation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewTranscation(_addNewTranscation),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: <Widget>[
        IconButton(
            onPressed: () => _startNewTranscation(context),
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.32,
                child: Chart(_recentTranscations)),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  0.68,
              child: TranscationList(_userTranscations, _deleteTranscation),
            )
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTranscation(context),
      ),
    );
  }
}
