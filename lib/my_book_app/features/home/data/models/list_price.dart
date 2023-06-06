class ListPrice {
  ListPrice({
    num? amount,
    String? currencyCode,}){
    _amount = amount;
    _currencyCode = currencyCode;
  }

  ListPrice.fromJson(Map<String,dynamic> json) {
    _amount = json['amount'];
    _currencyCode = json['currencyCode'];
  }
  num? _amount;
  String? _currencyCode;

  num? get amount => _amount;
  String? get currencyCode => _currencyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['currencyCode'] = _currencyCode;
    return map;
  }

}