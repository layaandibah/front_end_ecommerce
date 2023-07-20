import 'package:ecommers/applinks.dart';
import 'package:ecommers/core/class/crud.dart';

class AddressData{

  Crud crud;

  AddressData(this.crud);

  addAddresss(String userid,String lat,String long,String name,String city,String street,)async{
    var res=await crud.postData(AppLinks.addAddress,{
      "users_id":userid,
      "address_lat":lat,
      "address_long":long,
      "address_name":name,
      "address_city":city,
      "address_street":street
    });
    return  res.fold((left) =>left ,(right) =>right );
  }
  editAddresss(String addressid,String lat,String long,String name,String city,String street,)async{
    var res=await crud.postData(AppLinks.editAddress,{
      "address_id":addressid,
      "address_lat":lat,
      "address_long":long,
      "address_name":name,
      "address_city":city,
      "address_street":street
    });
    return  res.fold((left) =>left ,(right) =>right );
  }
  deleteAddresss(String addressid)async{
    var res=await crud.postData(AppLinks.deleteAddress,{
      "address_id":addressid,
    });
    return  res.fold((left) =>left ,(right) =>right );
  }
  viewAddresss(String usersid)async{
    var res=await crud.postData(AppLinks.viewAddress,{
      "users_id":usersid,
    });
    return  res.fold((left) =>left ,(right) =>right );
  }

}