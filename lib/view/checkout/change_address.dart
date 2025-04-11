import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodie/components/foodie_header.dart';
import 'package:foodie/components/foodie_textfield.dart';
import 'package:foodie/utils/theme/color_ext.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';

//TODO: Use provider && implement user changing location. Use a package or api to find place name from lat and long.

class ChangeAddressView extends StatefulWidget {
  const ChangeAddressView({super.key});

  @override
  State<ChangeAddressView> createState() => _ChangeAddressViewState();
}

class _ChangeAddressViewState extends State<ChangeAddressView> {
  MapController? controller = MapController();
  late List<Marker> _customMarkers;
  final searchPlace = TextEditingController();

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      Marker(
          point: const LatLng(24.00254, 90.42010),
          child: _customMarker('You', FColor.primary)),
    ];
  }

  _customMarker(String symbol, Color color) {
    return Icon(
      Icons.location_pin,
      color: color,
      size: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              initialCenter: const LatLng(24.00254, 90.42010),
              initialZoom: 17,
              onTap: ((tapPosition, point) {
                print('tapped at $point');
                //change the location of marker
                // _customMarkers.clear();
                // _customMarkers.add(Marker(
                //     point: point,
                //     child: _customMarker('Tapped', FColor.highlight)));
              })),
          mapController: controller,
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.foodie',
            ),
            MarkerLayer(markers: _customMarkers)
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: size.height * 0.1,
          child: FoodieHeaderWithoutCart(
            header: 'Change Address',
            onBackPressed: () {
              Navigator.pop(context);
            },
            color: FColor.black,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: size.height * 0.2,
            width: size.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodieTextfield(
                  controller: searchPlace,
                  hintText: 'Search Address',
                  hintFontStyle: FontStyle.normal,
                  prefixIcon: const Icon(Icons.search),
                ),
                const Gap(20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'media/images/fav_icon.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                    const Gap(10),
                    Text(
                      'Choose a saved place',
                      style: TextStyle(
                        color: FColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
