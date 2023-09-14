import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { shopping, investment, foreignCurrency, gold }

const categoryIcons = {
  Category.shopping: Icons.shopify,
  Category.investment: Icons.bar_chart,
  Category.foreignCurrency: Icons.attach_money,
  Category.gold: Icons.money,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.cataegory})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category cataegory;

  String get formattedDate {
    return formatter.format(date);
  }
}
