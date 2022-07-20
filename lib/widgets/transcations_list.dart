import 'package:flutter/material.dart';
import '../models/transcation.dart';
import "package:intl/intl.dart";

class TranscationList extends StatelessWidget {
  final List<Transcation> _userTranscations;
  TranscationList(this._userTranscations);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTranscations.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transcations Added",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    "assets/images/waiting.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _userTranscations.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Container(
                        width: 40,
                        child: FittedBox(
                          child: Text(
                            '\$${_userTranscations[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _userTranscations[index].title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 247, 185, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(_userTranscations[index].date),
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    )
                  ],
                ));
              },
            ),
    );
  }
}
