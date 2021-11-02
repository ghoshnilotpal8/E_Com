import 'dart:convert';

class Cement {
  int? index;
  String? name;
  String? category;
  String? imag;
  String? price;

  Cement({
    this.index,
    this.name,
    this.category,
    this.imag,
    this.price,
  });

  factory Cement.fromcategory(Map<String, dynamic> category) {
    return Cement(
      index: category["index"],
      name: category["name"],
      category: category["category"],
      imag: category["imag"],
      price: category["price"],
    );
  }

  Cement.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    category = json['category'];
    imag = json['imag'];
    price = json['price'];
  }

  Cement copyWith({
    int? index,
    String? name,
    String? category,
    String? imag,
    String? price,
  }) {
    return Cement(
      index: index ?? this.index,
      name: name ?? this.name,
      category: category ?? this.category,
      imag: imag ?? this.imag,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> tocategory() {
    return {
      'index': index,
      'name': name,
      'category': category,
      'imag': imag,
      'price': price,
    };
  }

  String toJson() => json.encode(tocategory());

  //factory Cement.fromJson(String source) => Cement.fromcategory(json.decode(source));

  @override
  String toString() {
    return 'Cement(index: $index, name: $name, category: $category, imag: $imag, price: $price)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cement &&
        o.index == index &&
        o.name == name &&
        o.category == category &&
        o.imag == imag &&
        o.price == price;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        name.hashCode ^
        category.hashCode ^
        imag.hashCode ^
        price.hashCode;
  }
}
