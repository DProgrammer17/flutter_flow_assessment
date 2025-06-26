import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/features/orders/state/bmi/bmi_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bmiNotifier = NotifierProvider<BmiNotifier, BmiVM>(() {
  return BmiNotifier();
});

class BmiNotifier extends Notifier<BmiVM> {
  @override
  BmiVM build() => BmiVM(
    bmiFormKey: GlobalKey<FormState>(),
    weightController: TextEditingController(),
    heightController: TextEditingController(),
    ageController: TextEditingController(),
  );

  void updateGender(String? gender) {
    state = state.copyWith(gender: gender);
    validateForm();
  }

  void calculateBMI() {
    if (state.gender.contains(AppStrings.female)) {
      final calories =
          ((655.1) +
          (9.56 * double.parse(state.weightController.text)) +
          (1.85 * double.parse(state.heightController.text)) -
          (4.67 * double.parse(state.ageController.text)));
      state = state.copyWith(bmi: () => calories);
      return;
    }

    final calories =
        ((666.47) +
        (13.75 * double.parse(state.weightController.text)) +
        (5 * double.parse(state.heightController.text)) -
        (6.75 * double.parse(state.ageController.text)));
    state = state.copyWith(bmi: () => calories);
  }

  void validateForm() {
    if (state.bmiFormKey.currentState!.validate() &&
        state.gender.isNotEmpty &&
        state.weightController.text.isNotEmpty &&
        state.heightController.text.isNotEmpty &&
        state.ageController.text.isNotEmpty) {
      calculateBMI();
      state = state.copyWith(disableButton: false);
      return;
    }
    state = state.copyWith(disableButton: true);
  }
}
