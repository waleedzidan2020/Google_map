import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsiveproject/cubit/cubit.dart';
import 'package:responsiveproject/cubit/states.dart';

class MobileScreen extends StatelessWidget {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapCubit(),
      child: BlocConsumer<GoogleMapCubit, GoogleMapState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(color: Colors.teal),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: IconButton(
                                  iconSize: 40,
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  },
                                  icon: Icon(Icons.exit_to_app),
                                ),
                              ),
                              Container(
                                child: GoogleMap(
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated:
                                      (GoogleMapController contoller) {
                                    GoogleMapCubit.get(context)
                                        .controller
                                        .complete(contoller);
                                    GoogleMapCubit.get(context).currentpos =
                                        _kGooglePlex?.target;
                                  },
                                  onCameraMove: (position) {
                                    GoogleMapCubit.get(context)
                                        .ChangePostion(item: position);
                                  },
                                  mapType: MapType.hybrid,
                                ),
                                width: 400,
                                height: 400,
                              ),
                              Text(
                                "${GoogleMapCubit.get(context).currentpos?.latitude.toString()}  ${GoogleMapCubit.get(context).currentpos?.longitude.toString()}",
                                style: TextStyle(fontSize: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      GoogleMapCubit.get(context)
                                          .GetMyLocation();
                                    },
                                    child: Icon(Icons.location_on),
                                    elevation: 5,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Icon(Icons.search),
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.wallet_giftcard),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
