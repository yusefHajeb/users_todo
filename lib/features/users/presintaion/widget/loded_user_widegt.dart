import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/features/users/presintaion/widget/user_card.dart';

import '../../../../core/color/app_colors2.dart';
import '../../domain/entites/user_entity.dart';

class LoadedUserWidget extends StatelessWidget {
  final List<Users> user;
  const LoadedUserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          children: [
            UserCurd(user: user[index])
            // ListTile(
            //   title: Text("${user[index].name}"),
            //   leading: CircleAvatar(
            //     child: Text(user[index].id.toString()),
            //     backgroundColor: AppColors.primaryBackgroundColor,
            //   ),
            //   subtitle: Text(user[index].username.toString()),
            // )
          ],
        );
      },
      itemCount: user.length,
      separatorBuilder: (context, i) => Divider(),
    );
  }
}
