import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:users_todo/features/users/presintaion/page/users_page.dart';
import '../../../../../core/Util/message_snackbar.dart';
import '../../../../../core/color/app_colors2.dart';
import '../../../../core/widget/dialoge_loading_widget.dart';
import '../../../../../core/widget/loading_widget.dart';
import '../../../../core/widget/outline_button_with_text.dart';
import '../bloc/bloc/and_delete_update_users_bloc.dart';

class CostomDeleteUserBtn extends StatelessWidget {
  final int userId;
  const CostomDeleteUserBtn({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonWithText(
        width: 100,
        content: "Delete",
        onPressed: () {
          deleteDialog(context, userId);
        });
  }

  void deleteDialog(BuildContext context, int userId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdateUsersBloc,
              AddDeleteUpdateUsersState>(builder: (context, state) {
            if (state is LoadingAddUpdateDeleteUserState) {
              return const AlertDialog(
                title: LoadingWidget(),
              );
            }

            return DeleteDialogWidget(id: userId, isUser: true);
          }, listener: (context, state) {
            if (state is MessageAddUpdateDeleteState) {
              MessageSnackBar().showMessageSnackBar(
                  state.message, context, Colors.greenAccent);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => UsersPage()),
                  (route) => false);
            } else if (state is ErrorAddUpdateDeleteUserState) {
              Navigator.pop(context);
              MessageSnackBar().showMessageSnackBar(
                  state.message, context, Colors.redAccent);
            }
          });
        });
  }
}
