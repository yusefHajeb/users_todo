import 'package:flutter/material.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/features/users/presintaion/page/user_details_page.dart';
import 'package:users_todo/features/users/presintaion/widget/user_card.dart';

import '../../domain/entites/user_entity.dart';

class LoadedUserWidget extends StatelessWidget {
  final List<Users> user;
  const LoadedUserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InkWell(
                  onTap: () => context.navigator.push(MaterialPageRoute(
                      builder: (_) => UserDetailsPage(user: user[index]))),
                  child: UserCurd(user: user[index])),
            ],
          ),
        );
      },
      itemCount: user.length,
      separatorBuilder: (context, i) => const SizedBox(
        height: 8,
      ),
    );
  }
}
