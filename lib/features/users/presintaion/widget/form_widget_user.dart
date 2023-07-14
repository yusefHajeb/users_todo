import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_todo/core/Values/app_space.dart';
import 'package:users_todo/features/users/data/models/users/company.dart';
import 'package:users_todo/features/users/presintaion/bloc/bloc/and_delete_update_users_bloc.dart';
import '../../../../core/widget/form_submit_btn.dart';
import '../../../todos/presentation/widget/from_input.dart';
import '../../domain/entites/user_entity.dart';

class FormUserWidget extends StatefulWidget {
  final Users? user;
  final bool isUpdate;
  const FormUserWidget({super.key, this.user, required this.isUpdate});

  @override
  State<FormUserWidget> createState() => _FormUserWidgetState();
}

class _FormUserWidgetState extends State<FormUserWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameCompany = TextEditingController();
  final TextEditingController _catchPhraseCompany = TextEditingController();
  final TextEditingController _bsCompany = TextEditingController();
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    if (widget.isUpdate) {
      _nameController.text = widget.user!.name.toString();
      _emailController.text = widget.user!.email.toString();
      _phoneController.text = widget.user!.phone.toString();
      _websiteController.text = widget.user!.website.toString();
      _usernameController.text = widget.user!.username.toString();
      _nameCompany.text = widget.user!.company!.toMap()['name'].toString();
      _catchPhraseCompany.text = widget.user!.company!.toMap()['catchPhrase'];
      _bsCompany.text = widget.user!.company!.toMap()['bs'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          LabelledFormInput(
              controller: _nameController,
              label: "name",
              placeholder: "Enter Name"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _usernameController,
              label: "Username",
              placeholder: "Enter Username"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _phoneController,
              label: "Phone",
              isNumber: true,
              placeholder: "Enter phone"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _websiteController,
              label: "Website",
              placeholder: "Enter Website"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _emailController,
              label: "Email",
              placeholder: "Enter mail"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _nameCompany,
              label: "NameCompany",
              placeholder: "Enter Company Name"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _catchPhraseCompany,
              label: " CatchPhraseCompany",
              placeholder: "Enter CatchPhrase"),
          AppSpaces.verticalSpace10,
          LabelledFormInput(
              controller: _bsCompany,
              label: " bsCompay ",
              placeholder: "Enter Company CatchPhrase"),
          SubmitFormBtn(
            onPressed: validateFormtThenAupdateOrAdd,
            update: widget.isUpdate,
          )
        ],
      ),
    );
  }

  void validateFormtThenAupdateOrAdd() {
    final isValid = _formKey.currentState!.validate();
    final Users useroModel = Users(
      id: widget.isUpdate ? widget.user!.id : null,
      name: _nameController.text,
      phone: _phoneController.text,
      username: _usernameController.text,
      email: _emailController.text,
      website: _websiteController.text,
      company: CompanyModel(
          bs: _bsCompany.text,
          catchPhrase: _catchPhraseCompany.text,
          name: _nameCompany.text),
    );

    if (isValid) {
      if (widget.isUpdate) {
        BlocProvider.of<AddDeleteUpdateUsersBloc>(context)
            .add(UpdateUserEvent(user: useroModel));
      } else {
        BlocProvider.of<AddDeleteUpdateUsersBloc>(context)
            .add(AddUserEvent(user: useroModel));
      }
    }
  }
}
