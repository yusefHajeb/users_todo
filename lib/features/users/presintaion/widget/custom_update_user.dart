import 'package:flutter/material.dart';
import 'package:users_todo/features/users/presintaion/page/add_or_update_user.dart';
import '../../../../../core/widget/outline_button_with_text.dart';
import '../../domain/entites/user_entity.dart';

class CostomUpdateUserBtn extends StatelessWidget {
  final Users users;
  const CostomUpdateUserBtn({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonWithText(
        content: "Update",
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      AddUpdateUserPage(isUpate: true, user: users)));
        });
  }
}
