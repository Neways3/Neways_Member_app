// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../models/category_list_model.dart';
import '../models/dropdown_model.dart';
import '../models/package_category_model.dart';
import '../models/package_request.dart';
import '../models/package_response.dart';
import '../services/package_api_service.dart';

class PackageChangeController extends GetxController {
  List<PackageResponse> packages = [];
  PackageCategoryModel packageModel = PackageCategoryModel();
  CategoryListModel categoryListModel = CategoryListModel();
  List<String> packageNames = [];
  List<DropdownModel> categoryListName = [];
  List<DropdownModel> packageCategory = [];
   PackageResponse? currentPackage;
   DropdownModel? selectedPackageCategory;
   DropdownModel? selectedCategoryListItem;

   PackageResponse selectedPackage = PackageResponse();
  DateTime date = DateTime.now();
  TextEditingController note = TextEditingController();
  bool isLoading = false;
  String selectedPackageName = 'Select Package';
  bool isSelectPackage = false;
  @override
  void onInit() {
    super.onInit();
    getBranch();
    packageCategoryFun();
  }

  getBranch() async {
    isLoading = true;
    await EasyLoading.show();
    await PackageAPIService.getCurrentPackage().then((value) {
      if (value.runtimeType == PackageResponse) {
        currentPackage = value;
      } else {}
    });
    await PackageAPIService.getAllData().then((value) {
      if (value.runtimeType == List<PackageResponse>) {
        packages = value;
        packageNames.add('Select Package');
        for (var element in packages) {
          packageNames.add(element.packageName + '-' + element.id.toString());
        }
      } else {}
    });
    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }
void getpackageCategory({required DropdownModel model}){
    selectedPackageCategory = model;
    update();
}
void getCategoryList({required DropdownModel model}){
  selectedCategoryListItem = model;
    update();
}
  packageCategoryFun() async {
    isLoading = true;
    packageCategory.clear();
    categoryListName.clear();
    packageCategory.add(DropdownModel( 0, 'Select Item'));
    categoryListName.add(DropdownModel( 0, 'Select Item'));
    await EasyLoading.show();
    await PackageAPIService.getPackagesCategory().then((value) {
      if (value.runtimeType == PackageCategoryModel) {
        packageModel = value;
        for(var package in packageModel.data!){
          packageCategory.add(DropdownModel(package.id ?? 0, package.packageCategoryName ?? ''));
        }
        print("this is value ${packageModel.data?.first.packageCategoryName}");
      } else {
        print("Unexpected value type: ${value.runtimeType}");
      }
    });

    isLoading = false;
    await EasyLoading.dismiss();
    update();
  }

  categoryList() async {

    await EasyLoading.show();
    await PackageAPIService.getCategoryList(selectedPackageCategory?.id ?? 0).then((value) {
      if (value.runtimeType == CategoryListModel) {
        categoryListModel = value;
        for(var package in categoryListModel.data!){
          categoryListName.add(DropdownModel(package.id ?? 0, package.packageName ?? ''));
        }
        print("this is value ${categoryListModel.data?.first.packageName}");
      } else {
        print("Unexpected value type: ${value.runtimeType}");
      }
    });

    // isLoading = false;
    await EasyLoading.dismiss();
    update();
  }
  selectPackage(String value) {
    selectedPackageName = value;
    if (selectedPackageName == "Select Package") {
      isSelectPackage = false;
    } else {
      getSelectedData(int.parse(value.split('-')[1]));
    }
    update();
  }

  getSelectedData(int id) {
    for (var element in packages) {
      if (element.id == id) {
        isSelectPackage = true;
        selectedPackage = element;
      }
    }
    update();
  }

  submit() async {
    if (selectedPackageName == "Select Package") {
      Get.snackbar(
        'Wrong',
        "Requested package field must be required!",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        margin: const EdgeInsets.all(8),
        backgroundColor: Colors.red.shade500,
      );
      EasyLoading.dismiss();
      return false;
    }
    await PackageAPIService.submit(
        data: PackageRequest(
      currentPackage: currentPackage?.packageName,
      requestPackage: selectedCategoryListItem?.name,
      requestPackageCategory: selectedPackageCategory?.name,
      note: note.text,
      status: false,
      date: "${date.day}/${date.month}/${date.year}",
    ));

    EasyLoading.dismiss();
    return true;
  }

  Future pickDate(BuildContext context, {DateTime? initialDate}) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      // firstDate: DateTime.now().subtract(const Duration(days: 0)),
      firstDate: DateTime(DateTime.now().year - (DateTime.now().year - 2000)),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (newDate == null) return;
    // return '${date.day}/${date.month}/${date.year}';
    date = newDate;
    update();
    return newDate;
  }
}
