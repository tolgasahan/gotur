import 'dart:async';

import 'package:gotur/data/address_service.dart';
import 'package:gotur/models/address.dart';


class AddressBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  List<Address> getAll(){
    return AddressService.getAll();
  }
}

final addressBloc = AddressBloc();