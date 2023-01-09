import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:responsiveproject/cubit/states.dart';
import 'package:responsiveproject/services/location.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(InitState());

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  LatLng? currentpos;

  static GoogleMapCubit get(context) => BlocProvider.of(context);

  void ChangePostion({CameraPosition? item}) {
    currentpos = item?.target;
    emit(ChangeCurrentPositionState());
  }

  Future<void>? GetMyLocation() async {
    LocationData data= await LocationServices().GetLocation()!;
    animateCamera(data:data );
    emit(GetLocationSuccessState());
  }

  Future<void>? animateCamera({LocationData? data}) {
    CameraPosition cameraPosition = CameraPosition(
        target: LatLng(data!.latitude!, data!.longitude!), zoom: 14.4);

    controller!.future.then((value) {
      value!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    }).catchError((erorr){


    });
  }
}
