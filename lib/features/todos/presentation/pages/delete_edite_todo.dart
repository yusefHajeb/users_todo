import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Util/extentions.dart';
import 'package:users_todo/core/color/app_colors2.dart';
import 'package:users_todo/core/widget/todo_list_tail.dart';
import 'package:users_todo/features/todos/presentation/widget/TodoWidget/costom_update_btn.dart';
import '../../../../core/DarckBackground/dark_background.dart';
import '../../../../core/Values/app_space.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/error_todo_widget.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../../users/domain/entites/user_entity.dart';
import '../../../users/presintaion/bloc/UserBloc/user_bloc.dart';
import '../../../users/presintaion/widget/user_card.dart';
import '../../domain/entites/todo_entity.dart';
import '../widget/TodoWidget/costom_btn_delete.dart';

class TodoDeltailPage extends StatelessWidget {
  final Todo todo;

  const TodoDeltailPage({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Detail Todo', arrowBack: true),
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Todo :",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TodoListTial(todo: todo),
              // Center(
              //   child: Wrap(
              //     alignment: WrapAlignment.center,
              //     children: [
              //       AppSpaces.horizontalSpace20,
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Card(
              //           color: HexColor.fromHex("#181a1f"),
              //           elevation: 0,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10),
              //             side: BorderSide(
              //               color: AppColors.ballColors[2][1],
              //               width: 1,
              //             ),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               todo.title,
              //               style: context.textTheme.displayMedium!.copyWith(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15,
              //                   color: Colors.white),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // CostomCheckboxCompleted(
              //   completed: todo.completed,
              // ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "User :",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is LoadingUserState) {
                    return LoadingWidget();
                  } else if (state is LoadedUserState) {
                    Users user = state.user.firstWhere(
                      (element) => element.id == todo.userId,
                    );
                    return UserCurd(user: user);
                  } else if (state is ErrorUserState) {
                    return MessageDisplayWidget(message: state.message);
                  }
                  return const LoadingWidget();
                }),
              ),
              AppSpaces.verticalSpace20,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CostomDeleteTodoBtn(todoId: todo.id!),
                    CostomUpdateTodoBtn(todo: todo),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Detail Todo", style: context.textTheme.displayMedium),
    );
  }
}
