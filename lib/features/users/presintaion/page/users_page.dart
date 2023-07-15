import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/DarckBackground/dark_background.dart';
import 'package:users_todo/core/widget/error_todo_widget.dart';
import 'package:users_todo/core/widget/loading_widget.dart';
import 'package:users_todo/features/users/presintaion/page/add_or_update_user.dart';
import 'package:users_todo/features/users/presintaion/widget/loded_user_widegt.dart';

import '../../../../core/color/app_colors2.dart';
import '../../../../core/widget/app_header_widget.dart';
import '../../../../core/widget/outline_button_with_text.dart';
import '../bloc/UserBloc/user_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is LoadingUserState) {
            return LoadingWidget();
          } else if (state is LoadedUserState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: LoadedUserWidget(user: state.user),
            );
          } else if (state is ErrorUserState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        })
      ]),
      floatingActionButton: _floationgButton(context),
    );
  }

  FloatingActionButton _floationgButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => AddUpdateUserPage(isUpate: false))),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<UserBloc>(context).add(RefereshUserEvent());
    return Future.value(Unit);
  }
}
