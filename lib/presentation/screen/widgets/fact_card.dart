import 'package:cat_trivia/presentation/helper/time_format_helper.dart';
import 'package:flutter/material.dart';

class FactCard extends StatelessWidget {
  final String fact;
  final String? createdDate;
  const FactCard({
    required this.fact,
    this.createdDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(child: Text(fact)),
          Text(createdDate != null
              ? createdDate!
              : TimeFormatHelper.dateForFactItem(dateTime: DateTime.now(), context: context)),
        ],
      ),
    );
  }
}
