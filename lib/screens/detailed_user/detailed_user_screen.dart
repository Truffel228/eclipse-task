import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/shared/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class DetailedUserScreen extends StatelessWidget {
  const DetailedUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PropertyCard(title: 'Name', value: user.name),
            PropertyCard(title: 'Email', value: user.email),
            PropertyCard(title: 'Phone', value: user.phone),
            PropertyCard(title: 'Website', value: user.website),
            const SizedBox(height: 10),
            CompanyCard(company: user.company),
            const SizedBox(height: 10),
            AddressCard(address: user.address),
            const SizedBox(height: 20),
            PostListPreview(posts: user.posts, itemCount: Constants.postPreviewItemCount),
            const SizedBox(height: 20),
            AlbumListPreview(itemCount: Constants.albumPreviewItemCount, albums: user.albums)
            // Text('Company'),
            // PropertyCard(title: 'Name', value: user.company.name),
            // PropertyCard(title: 'BS', value: user.company.bs),
            // PropertyCard(title: 'Catch Phrase', value: user.company.catchPhrase),
          ],
        ),
      ),
    );
  }
}
