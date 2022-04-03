import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tax_saving_viewmodel.dart';

class TaxSavingView extends StatelessWidget {
const TaxSavingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaxSavingViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => TaxSavingViewModel());
  }
}