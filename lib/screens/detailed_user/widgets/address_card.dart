import 'package:eclipse_task/models/address/address.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key? key, required this.address}) : super(key: key);
  final Address address;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Address'),
          const SizedBox(height: 20),

          Text('Street:'),
          const SizedBox(height: 5),
          Text(address.street),
          const SizedBox(height: 15),

          Text('Suite:'),
          const SizedBox(height: 5),
          Text(address.suite),
          const SizedBox(height: 15),

          Text('City:'),
          const SizedBox(height: 5),
          Text(address.city),
          const SizedBox(height: 15),

          Text('Zipcode:'),
          const SizedBox(height: 5),
          Text(address.zipcode),
          const SizedBox(height: 15),

          Text('Geo'),
          const SizedBox(height: 15),
          Text('Latitude:'),
          const SizedBox(height: 5),
          Text(address.geo.lat),
          const SizedBox(height: 10),
          Text('Longitude:'),
          const SizedBox(height: 5),
          Text(address.geo.lng),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
