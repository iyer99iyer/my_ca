import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_viewmodel.dart';

class AddView extends StatelessWidget {
const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => SafeArea(child: Scaffold(
          body: Center(
            child: Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: ()=>model.navigateToAddCategory(),
                    child: Text('Add Category'),
                    color: Colors.teal,
                  ),
                  MaterialButton(
                    onPressed: ()=>model.navigateToAddTransaction(),
                    child: Text('Add Transaction'),
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        )),
        viewModelBuilder: () => AddViewModel());
  }
}