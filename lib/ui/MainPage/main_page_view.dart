import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:your_ca/ui/shared/styles.dart';

import 'main_page_viewmodel.dart';

class MainPageView extends StatelessWidget {

  final int? currentIndex;

  const MainPageView({Key? key, this.currentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
        onModelReady: (model) => model.init(currentIndex),
        builder: (context, model, child) => Scaffold(
              body: model.screen[model.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: model.currentIndex,
                onTap: (value) => model.onNavigationButton(value),
                selectedItemColor: kcPrimaryColor,
                unselectedItemColor: kcSubTextColor,
                showUnselectedLabels: true,
                selectedLabelStyle: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 15,
                enableFeedback: true,
                items: [
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Text(
                        '₹%',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: model.currentIndex == 1 ? kcPrimaryColor:kcSubTextColor
                        ),
                      ),
                      label: 'Tax Saving'),
                  const BottomNavigationBarItem(
                      icon: CircleAvatar(child: Icon(Icons.add,color: Colors.white,size: 40,semanticLabel: 'Add Transactions,Category'),backgroundColor: Colors.blue,),
                      label: ''),
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.fileAlt),
                      label: 'Transaction'),
                  const BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.chartPie),
                      label: 'Reports'),
                ],
              ),
            ),
        viewModelBuilder: () => MainPageViewModel());
  }
}
