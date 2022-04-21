import 'package:eclipse_task/models/user/user/user.dart';
import 'package:eclipse_task/screens/home/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Eclipse'),
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (BuildContext context, state) {
          if (state is HomeScreenLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.primaryColor,
              ),
            );
          }
          if (state is HomeScreenLoaded) {
            final List<User> users = state.users;
            return SizedBox.expand(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => UserListItem(
                  user: users[index],
                ),
              ),
            );
          }
          return Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
