import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_todo/core/Util/message_snackbar.dart';
import 'package:users_todo/core/widget/app_header_widget.dart';
import 'package:users_todo/core/widget/todo_list_tail.dart';
import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/Values/app_space.dart';
import '../../../../core/color/app_colors2.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../../../core/widget/outline_button_with_text.dart';
import '../../../todos/presentation/bloc_todos/bloc/todos_bloc.dart';
import '../../domain/entites/user_entity.dart';
import '../bloc/UserBloc/user_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  final Users user;
  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  HeaderApp(
                    title: "Details User",
                    messagingPage: true,
                    widget: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(user.name!,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                  atributeUser(user.email.toString(), FontAwesomeIcons.message),
                  AppSpaces.verticalSpace10,
                  atributeUser(user.phone.toString(), FontAwesomeIcons.phone),
                  AppSpaces.verticalSpace10,
                  atributeUser(user.website.toString(), FontAwesomeIcons.link),
                  Divider(color: AppColors.lightMauveBackgroundColor),
                  companyWidget(user.company!.toMap(), context),
                  AppSpaces.verticalSpace20,
                  updateDeleteButton(context),
                  BlocBuilder<TodosBloc, TodosState>(
                      builder: (context, todoState) {
                    if (todoState is LoadingTodoState) {
                      return LoadingWidget();
                    } else if (todoState is LoadedTodoState) {
                      final todos = todoState.todos
                          .where((element) => element.userId == user.id)
                          .toList();
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return TodoListTial(todo: todo);
                          });
                    }
                    return const LoadingWidget();
                  }),
                ],
              )))),
        ),
      ],
    );
  }

  Widget companyWidget(Map company, BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Company",
              textAlign: TextAlign.center,
              style: myTheme(ctx).headline1!.copyWith(fontSize: 14),
            ),
            AppSpaces.horizontalSpace10,
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company['name'].toString(),
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.2)),
                  SizedBox(height: 4),
                  Text("catchPhrase : ${company['catchPhrase']}",
                      style: GoogleFonts.lato(
                        color: HexColor.fromHex("5A5E6D"),
                        fontSize: 11,
                      )),
                  Text("bs : ${company['bs']}",
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.lato(
                          color: HexColor.fromHex("5A5E6D"), fontSize: 11))
                ])
          ]),
    );
  }

  Widget atributeUser(String txt, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.lightMauveBackgroundColor,
          size: 14,
        ),
        AppSpaces.horizontalSpace20,
        Text(txt,
            style: GoogleFonts.lato(
                color: HexColor.fromHex("B0FFE1"), fontSize: 17))
      ],
    );
  }

  Widget updateDeleteButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlinedButtonWithText(
              width: 100, content: "Update", onPressed: () {}),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: OutlinedButtonWithText(
              width: 100, content: "Delete", onPressed: () {}),
        ),
      ],
    );
  }
}
