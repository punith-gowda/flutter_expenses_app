import 'package:expenses_app/widgets/transcation_item.dart';
import 'package:flutter/material.dart';
import '../models/transcation.dart';
import "package:intl/intl.dart";

class TranscationList extends StatelessWidget {
  final List<Transcation> _userTranscations;
  final Function _deleteTx;
  TranscationList(this._userTranscations, this._deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                return TranscationItem(
                    userTranscation: _userTranscations[index],
                    deleteTx: _deleteTx);
              },
            ),
    );
  }
}
