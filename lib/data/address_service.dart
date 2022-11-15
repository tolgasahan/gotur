
import 'package:gotur/models/address.dart';

class AddressService{
  static List<Address> address = List<Address>.empty(growable: true);

  static AddressService _singleton = AddressService._interval();

  factory AddressService(){
    return _singleton;
  }



  AddressService._interval();
  static List<Address> getAll(){
    address.add(Address(1, "Ev", "İstanbul/Pendik",0));
    address.add(Address(2, "İş", "İstanbul/Bağlarbaşı",1));
    address.add(Address(3, "Diğer", "İstanbul/Maltepe",0));

    return address;
  }
}