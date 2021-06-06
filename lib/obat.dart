class Imunisasi{

  int _id;
  String _nameobat;
  int _price;
  String _use;

    int get id => _id;

    String get nameobat => this._nameobat;
    set nameobat(String value) => this._nameobat = value;

    get price => this._price;
    set price( value) => this._price = value;

    String get use => this._use;
    set use(String value) => this._use = value;
    
    // konstruktor versi 1
    Imunisasi(this._nameobat, this._price, this._use);
    // konstruktor versi 2: konversi dari Map ke Item
    Imunisasi.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nameobat = map['nameim'];
    this._price = map['price'];
     this._use = map['use'];
   
    }
    // konversi dari Item ke Map
    Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nameobat'] = nameobat;
    map['price'] = price;
    map['use'] = use;
    return map;
 } 
 }

 