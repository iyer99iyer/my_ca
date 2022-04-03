import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:your_ca/ui/add_category/add_category_viewmodel.dart';
import 'package:your_ca/ui/shared/styles.dart';

import '../shared/ui_helpers.dart';
import '../widgets/typeButton.dart';
import 'add_category_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'category'),
  FormTextField(name: 'note'),
])
class AddCategoryView extends StatelessWidget with $AddCategoryView {
  AddCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCategoryViewModel>.reactive(
      onModelReady: (model) => model.init(listenToFormUpdated,categoryController,noteController),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          // appBar: ,
          body: Column(
            children: [
              Stack(
                children: [
                  // Title
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20, top: 30, bottom: 15),
                        child: Text('Add Category',
                            style: GoogleFonts.roboto(
                                fontSize: 36, fontWeight: FontWeight.bold)),
                        decoration:
                            BoxDecoration(color: model.currentPickerColor),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -20,
                    right: 20,
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(context: context, builder: (context){
                          return Container(
                            height: MediaQuery.of(context).size.height*.45,
                            color: Color(0xFF737373),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        GestureDetector(onTap:()=>Navigator.pop(context), child: Icon(Icons.clear, color: Colors.black, size: 30,)),
                                        horizontalSpaceMedium,
                                        Text('Pick Color', style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: physicalWidth,
                                    height: 8,
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 2,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Expanded(
                                    child: GridView.builder(
                                      itemCount: model.colorList.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 8,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8
                                        ),
                                        itemBuilder: (context,index){
                                          return GestureDetector(
                                            onTap: ()=>model.onTapColor(index,context),
                                            child: CircleAvatar(
                                              backgroundColor: Color(model.colorList[index]),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                              ),
                            ),
                          );
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: kcPrimaryBackgroudColor,
                        child: FaIcon(FontAwesomeIcons.eyeDropper,color: Colors.black,),
                      ),
                    ),
                  ),
                ],
                clipBehavior: Clip.none,
              ),
              verticalSpaceRegular,
              // Type
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Type :',style:GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                    horizontalSpaceMedium,
                    TypeButton(
                      buttonName: 'Expenses',
                      onTap: (value)=> model.onTapType(value),
                      color: model.currentType == 0 ? model.currentThemeColor : null,
                      position: 0,
                    ),
                    horizontalSpaceSmall,
                    TypeButton(
                      buttonName: 'Income',
                      onTap: (value)=> model.onTapType(value),
                      color: model.currentType == 1 ? model.currentThemeColor : null,
                      position: 1,
                    ),
                  ],
                ),
              ),
              verticalSpaceRegular,
              // Category TextField
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value)=>model.onChangedCategory(value),
                  keyboardType: TextInputType.text,
                  controller: categoryController,
                  focusNode: categoryFocusNode,
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    label: Text('Enter Category'),
                    errorText: model.validateCategory(),
                    // suffixIconConstraints:
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              verticalSpaceRegular,
              // Note TextField
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value)=>model.onChangedCategory(value),
                  keyboardType: TextInputType.text,
                  controller: noteController,
                  focusNode: noteFocusNode,
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    label: Text('Enter Note'),
                    // suffixIconConstraints:
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              verticalSpaceRegular,
              model.categoryIfEmpty ?
              GestureDetector(
                onTap: () => model.addDefaultCategories(),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: kcIncomeColor,
                  child: Text('Add Default Categories'),
                ),
              ):Container(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.onClickSaveButton(),
            child: Icon(Icons.check,color: Colors.white, size: 35,),
            backgroundColor: model.currentPickerColor,
          ),
        ),
      ),
      viewModelBuilder: () => AddCategoryViewModel(),
    );
  }
}
