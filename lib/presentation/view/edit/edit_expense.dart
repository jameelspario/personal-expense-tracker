import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../../../utils/constants.dart';
import '../../cubit/home/home_cubit.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textbox.dart';
import '../../widgets/dialogs.dart';

class EditExpense extends StatefulWidget {
  const EditExpense({this.item, super.key});
  final dynamic item;

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  static final controllerTitle = TextEditingController();
  static final controllerExpense = TextEditingController();
  static final controllerDesription = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTitle.text = widget.item.title;
    controllerExpense.text = widget.item.amount;
    controllerDesription.text = widget.item.description;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => bloc.gotoHome(),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(Strings.editExpense),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            16.0.spaceY,
            CustomTextbox(
              controller: controllerTitle,
              hint: Strings.title,
              // suffixIcon: IconButton(
              //   icon: Icon(Icons.check),
              //   onPressed: () {
              //     editTitle = !editTitle;
              //     setState(() {});
              //   },
              // ),
            ),
            16.0.spaceY,
            CustomTextbox(
              controller: controllerExpense,
              hint: Strings.expense,
              keyboardType: TextInputType.number,
            ),
            16.0.spaceY,
            CustomTextbox(
              controller: controllerDesription,
              hint: Strings.description,
              minLine: 3,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
            40.0.spaceY,
            Container(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  text: Strings.submit,
                  callback: () {
                    if (controllerTitle.text.isEmpty) {
                      Dialogs.snackbar(context, "Title cannot be empty");
                      return;
                    }
                    if (controllerExpense.text.isEmpty) {
                      Dialogs.snackbar(context, "Amount cannot be empty");
                      return;
                    }
                    if (controllerDesription.text.isEmpty) {
                      Dialogs.snackbar(context, "Description cannot be empty");
                      return;
                    }
                    bloc.editExpenseItem(
                      widget.item,
                      controllerTitle.value.text,
                      controllerExpense.value.text,
                      controllerDesription.value.text,
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
