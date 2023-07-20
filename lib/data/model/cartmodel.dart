class CartModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsActive;
  int? itemsCount;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  String? itemsImage;
  int? itemsCat;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemscount;
  double? totalprice;

  CartModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsActive,
        this.itemsCount,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsImage,
        this.itemsCat,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.itemscount,
        this.totalprice});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsActive = json['items_active'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsImage = json['items_image'];
    itemsCat = json['items_cat'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemscount = json['itemscount'];
    totalprice = double.parse((json['totalprice']).toStringAsFixed(2));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_active'] = this.itemsActive;
    data['items_count'] = this.itemsCount;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_image'] = this.itemsImage;
    data['items_cat'] = this.itemsCat;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['itemscount'] = this.itemscount;
    data['totalprice'] = this.totalprice;
    return data;
  }
}