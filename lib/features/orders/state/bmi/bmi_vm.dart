import 'package:flutter/material.dart';
import 'package:flutter_flow_assessment/core/constants/app_assets.dart';
import 'package:flutter_flow_assessment/core/constants/app_strings.dart';
import 'package:flutter_flow_assessment/core/network/model/request/order_item_request.dart';
import 'package:flutter_flow_assessment/features/orders/state/cart/item_model.dart';

class BmiVM {
  final GlobalKey<FormState> bmiFormKey;
  final String gender;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController ageController;
  final bool disableButton;
  final double? bmi;


  const BmiVM({
    required this.bmiFormKey,
    required this.weightController,
    required this.heightController,
    required this.ageController,
    this.gender = '',
    this.disableButton = true,
    this.bmi,
  });

  BmiVM copyWith({
    GlobalKey<FormState>? bmiFormKey,
    String? gender,
    TextEditingController? weightController,
    TextEditingController? heightController,
    TextEditingController? ageController,
    bool? disableButton,
    double? Function()? bmi,
  }) {
    return BmiVM(
      bmiFormKey: bmiFormKey ?? this.bmiFormKey,
      weightController: weightController ?? this.weightController,
      heightController: heightController ?? this.heightController,
      ageController: ageController ?? this.ageController,
      gender: gender ?? this.gender,
      disableButton: disableButton ?? this.disableButton,
      bmi: bmi != null ? bmi() : this.bmi,
    );
  }
}
