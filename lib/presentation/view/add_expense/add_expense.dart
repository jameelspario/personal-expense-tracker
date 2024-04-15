import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../../../utils/constants.dart';
import '../../cubit/home/home_cubit.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textbox.dart';
import '../../widgets/dialogs.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
 
  final controllerTitle = TextEditingController();
  final controllerExpense = TextEditingController();
  final controllerDesription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            bloc.gotoHome();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded)), 
        title: Text(Strings.addExpense),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            16.0.spaceY,
            CustomTextbox(
              controller: controllerTitle,
              hint: Strings.title,
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
            24.0.spaceY,
            Container(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                text: Strings.add,
                callback: () {
                  if(controllerTitle.text.isEmpty){
                    Dialogs.snackbar(context, "Please enter a title");
                    return;
                  }
                   if(controllerExpense.text.isEmpty){
                    Dialogs.snackbar(context, "Please enter an amount");
                    return;
                  }
                   if(controllerDesription.text.isEmpty){
                    Dialogs.snackbar(context, "Please enter description");
                    return;
                  }
                   bloc.addExpense(
                      controllerTitle.value.text,
                      controllerExpense.value.text,
                      controllerDesription.value.text,
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
