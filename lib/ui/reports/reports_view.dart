import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'reports_viewmodel.dart';

class ReportsView extends StatelessWidget {
const ReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportsViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(),
        viewModelBuilder: () => ReportsViewModel());
  }
}