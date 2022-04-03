// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CategoryValueKey = 'category';
const String NoteValueKey = 'note';

mixin $AddCategoryView on StatelessWidget {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final FocusNode categoryFocusNode = FocusNode();
  final FocusNode noteFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    categoryController.addListener(() => _updateFormData(model));
    noteController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            CategoryValueKey: categoryController.text,
            NoteValueKey: noteController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    categoryController.dispose();
    categoryFocusNode.dispose();
    noteController.dispose();
    noteFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get categoryValue => this.formValueMap[CategoryValueKey] as String?;
  String? get noteValue => this.formValueMap[NoteValueKey] as String?;

  bool get hasCategory => this.formValueMap.containsKey(CategoryValueKey);
  bool get hasNote => this.formValueMap.containsKey(NoteValueKey);

  bool get hasCategoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey]?.isNotEmpty ?? false;
  bool get hasNoteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey]?.isNotEmpty ?? false;

  String? get categoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey];
  String? get noteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey];
}

extension Methods on FormViewModel {
  setCategoryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryValueKey] = validationMessage;
  setNoteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NoteValueKey] = validationMessage;
}
