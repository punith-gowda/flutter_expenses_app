import 'package:flutter/material.dart';

class Transcation {
  @required
  final String id;
  @required
  final String title;
  @required
  final double amount;
  @required
  final DateTime date;
  Transcation({this.id, this.title, this.amount, this.date});
}
