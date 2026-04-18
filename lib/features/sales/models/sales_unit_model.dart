class SalesUnitModel {
  final String? unitType;
  final String? unitNumber;
  final num? area;
  final String? measurement;
  final String? facing;
  final num? price;
  final String? status;
  final int? floor;
  final int? bhkQty;
  final String? villaType;
  final String? id;
  final String? salesProjectId;
  final String? createdAt;
  final String? updatedAt;

  SalesUnitModel({
    this.unitType,
    this.unitNumber,
    this.area,
    this.measurement,
    this.facing,
    this.price,
    this.status,
    this.floor,
    this.bhkQty,
    this.villaType,
    this.id,
    this.salesProjectId,
    this.createdAt,
    this.updatedAt,
  });

  factory SalesUnitModel.fromJson(Map<String, dynamic> json) {
    return SalesUnitModel(
      unitType: json['unit_type'] as String?,
      unitNumber: json['unit_number'] as String?,
      area: json['area'] as num?,
      measurement: json['measurement'] as String?,
      facing: json['facing'] as String?,
      price: json['price'] as num?,
      status: json['status'] as String?,
      floor: json['floor'] as int?,
      bhkQty: json['bhk_qty'] as int?,
      villaType: json['villa_type'] as String?,
      id: json['id'] as String?,
      salesProjectId: json['sales_project_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unit_type': unitType,
      'unit_number': unitNumber,
      'area': area,
      'measurement': measurement,
      'facing': facing,
      'price': price,
      'status': status,
      'floor': floor,
      'bhk_qty': bhkQty,
      'villa_type': villaType,
      'id': id,
      'sales_project_id': salesProjectId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class SalesUnitResponseModel {
  final int? total;
  final List<SalesUnitModel>? items;

  SalesUnitResponseModel({this.total, this.items});

  factory SalesUnitResponseModel.fromJson(Map<String, dynamic> json) {
    return SalesUnitResponseModel(
      total: json['total'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SalesUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'total': total, 'items': items?.map((e) => e.toJson()).toList()};
  }
}
