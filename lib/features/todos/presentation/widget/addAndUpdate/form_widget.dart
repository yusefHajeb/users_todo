import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/features/todos/presentation/bloc_todos/addDeleteUpdateTodo/add_delete_update_todo_bloc.dart';
import 'package:users_todo/features/todos/presentation/widget/addAndUpdate/form_submit_btn.dart';
import '../../../domain/entites/todo_entity.dart';
import '../from_input.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdate;
  final Todo? todo;
  const FormWidget({Key? key, required this.isUpdate, this.todo})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    if (widget.isUpdate) {
      _titleController.text = widget.todo!.title.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            LabelledFormInput(
              controller: _titleController,
              isUpdate: widget.isUpdate,
              label: '',
              placeholder: '',
            ),
            Checkbox(
              value: widget.isUpdate,
              onChanged: (newVal) {
                setState(() {});
              },
              activeColor: Colors.white,
            ),
            SubmitFormBtn(
                onPressed: validateFormtThenAupdateOrAdd,
                update: widget.isUpdate),
          ],
        ));
  }

  void validateFormtThenAupdateOrAdd() {
    final isValid = formKey.currentState!.validate();
    final todoModel = Todo(
        userId: widget.isUpdate ? widget.todo!.userId : null,
        id: widget.isUpdate ? widget.todo!.id : null,
        title: _titleController.text,
        completed: widget.isUpdate ? widget.todo!.completed : false);
    if (isValid) {
      if (widget.isUpdate) {
        BlocProvider.of<AddDeleteUpdateTodoBloc>(context)
            .add(UpdateTodoEvent(todo: todoModel));
      } else {
        BlocProvider.of<AddDeleteUpdateTodoBloc>(context)
            .add(AddTodoEvent(todo: todoModel));
      }
    }
  }
}
