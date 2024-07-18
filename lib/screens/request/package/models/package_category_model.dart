class PackageCategoryModel {
  List<Data>? data;

  PackageCategoryModel({this.data});

  PackageCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? packageCategoryName;

  Data({this.id, this.packageCategoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageCategoryName = json['package_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_category_name'] = this.packageCategoryName;
    return data;
  }
}
