import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/core/Util/message_snackbar.dart';
import 'package:users_todo/core/widget/app_bar.dart';
import 'package:users_todo/core/widget/error_todo_widget.dart';
import 'package:users_todo/core/widget/loading_widget.dart';
import 'package:users_todo/features/users/presintaion/bloc/bloc/and_delete_update_users_bloc.dart';
import 'package:users_todo/features/users/presintaion/page/users_page.dart';
import 'package:users_todo/features/users/presintaion/widget/form_widget_user.dart';
import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/color/app_colors2.dart';
import '../../domain/entites/user_entity.dart';

class AddUpdateUserPage extends StatelessWidget {
  final Users? user;
  final bool isUpate;
  const AddUpdateUserPage({super.key, this.user, required this.isUpate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, '', arrowBack: true),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              BlocConsumer<AddDeleteUpdateUsersBloc, AddDeleteUpdateUsersState>(
            builder: ((context, state) {
              if (state is LoadingAddUpdateDeleteUserState) {
                return const LoadingWidget();
              }
              return FormUserWidget(
                isUpdate: isUpate,
                user: isUpate ? user : null,
              );
            }),
            listener: (context, state) {
              if (state is ErrorAddUpdateDeleteUserState) {
                MessageDisplayWidget(message: state.message);
                context.navigator.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const UsersPage()),
                    (route) => false);
              } else if (state is MessageAddUpdateDeleteState) {
                MessageSnackBar().showMessageSnackBar(
                    state.message, context, Colors.greenAccent);
                context.navigator.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const UsersPage()),
                    (route) => false);
              }
            },
          ),
        ),
      ],
    );
  }
}
