// 结果数据类型
class FilterBarResult {
  final String? areaId; // 区域
  final String? priceId; // 租金
  final String? rentTypeId; // 方式
  final List<String>? moreIds; // 筛选

  FilterBarResult(
      {this.areaId,
        this.priceId,
        this.rentTypeId,
        this.moreIds,
        String? priceTypeId,
        List<String>? moreId});
}

// 通用类型
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('五华区', '1'),
  GeneralType('呈贡区', '2'),
  GeneralType('西山区', '3'),
  GeneralType('官渡区', '4'),
  GeneralType('安宁市', '5'),
];
List<GeneralType> priceList = [
  GeneralType('800', '6'),
  GeneralType('900', '7'),
  GeneralType('1000', '8'),
  GeneralType('1100', '9'),
  GeneralType('1200', '10'),
  GeneralType('1300', '11'),
];
List<GeneralType> rentTypeList = [
  GeneralType('整租', '12'),
  GeneralType('合租', '13'),
];
List<GeneralType> roomTypeList = [
  GeneralType('一室', '14'),
  GeneralType('两室', '15'),
  GeneralType('三室', '16'),
  GeneralType('四室', '17'),
  GeneralType('五室', '18'),
  GeneralType('五室以上', '19'),
];
List<GeneralType> orientedList = [
  GeneralType('东', '20'),
  GeneralType('南', '21'),
  GeneralType('西', '22'),
  GeneralType('北', '23'),
  GeneralType('东南', '24'),
  GeneralType('西南', '25'),
  GeneralType('西北', '26'),
  GeneralType('东北', '27'),
];
List<GeneralType> floorList = [
  GeneralType('一楼', '28'),
  GeneralType('二楼', '29'),
  GeneralType('三楼', '30'),
  GeneralType('四楼', '31'),
  GeneralType('五楼', '32'),
  GeneralType('六楼', '33'),
  GeneralType('七楼', '34'),
  GeneralType('八楼', '35'),
];