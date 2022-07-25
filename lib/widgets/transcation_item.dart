import 'package:flutter/material.dart';
import 'package:expenses_app/models/transcation.dart';
import 'package:intl/intl.dart';

class TranscationItem extends StatelessWidget {
  const TranscationItem({
    Key key,
    @required Transcation userTranscation,
    @required Function deleteTx,
  })  : _userTranscation = userTranscation,
        _deleteTx = deleteTx,
        super(key: key);

  final Transcation _userTranscation;
  final Function _deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(4)),
          child: Container(
            width: 40,
            child: FittedBox(
              child: Text(
                '\$${_userTranscation.amount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _userTranscation.title,
                style: TextStyle(
                    color: Color.fromARGB(255, 247, 185, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                DateFormat.yMMMd().format(_userTranscation.date),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              _deleteTx(_userTranscation.id);
            },
          ),
        )
      ],
    ));
  }
}
