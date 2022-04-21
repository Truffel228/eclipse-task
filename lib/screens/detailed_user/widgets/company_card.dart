import 'package:eclipse_task/models/company/company.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key? key, required this.company}) : super(key: key);
  final Company company;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Company'),
          const SizedBox(height: 20),
          Text('Name:'),
          const SizedBox(height: 5),
          Text(company.name),
          const SizedBox(height: 15),
          Text('BS:'),
          const SizedBox(height: 5),
          Text(company.bs),
          const SizedBox(height: 15),
          Text('Catch Phrase:'),
          const SizedBox(height: 5),
          Text(company.catchPhrase),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
