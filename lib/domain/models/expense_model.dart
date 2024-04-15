import 'dart:convert';



class ExpenseModel {

  dynamic id;
  dynamic title;
  dynamic amount;
  dynamic dateTime;
  dynamic description;
  ExpenseModel({
     this.id,
     this.title,
     this.amount,
     this.dateTime,
     this.description,
  });

  /* 
  function converts class object to Map
  
   */

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'amount': amount});
    result.addAll({'dateTime': dateTime});
    result.addAll({'description': description});
  
    return result;
  }

/* 
  function converts Map to class Object
  
   */
  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] ?? null,
      title: map['title'] ?? null,
      amount: map['amount'] ?? null,
      dateTime: map['dateTime'] ?? null,
      description: map['description'] ?? null,
    );
  }

  /* 
  map to String converter
   */

  String toJson() => json.encode(toMap());

/* 
  string to class object
   */
  factory ExpenseModel.fromJson(String source) => ExpenseModel.fromMap(json.decode(source));
}
