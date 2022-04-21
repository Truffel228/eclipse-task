import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/shared/routes.dart';
import 'package:eclipse_task/shared/widgets/app_card.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.detailedUser, arguments: user),
      child: AppCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.username),
            const SizedBox(height: 15),
            Text(user.name),
          ],
        ),
      ),
    );
  }
}
