import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
const StartUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: model.doSomething,
              child: Container(
                //
                padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                width: 100,
                height: 50,
                child: const Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),
          )
        ),
        viewModelBuilder: () => StartupViewModel());
  }
}