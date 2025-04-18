import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages because this is our pacakge
import 'package:integrations_controller/integrations_controller.dart';
import 'package:simple_hub/domain/connections_service.dart';
import 'package:simple_hub/presentation/atoms/atoms.dart';
import 'package:simple_hub/presentation/pages/add_new_devices_process/choose_device_vendor_to_add/widgets/vendor_widget.dart';

class VendorsList extends StatefulWidget {
  @override
  State<VendorsList> createState() => _VendorsListState();
}

class _VendorsListState extends State<VendorsList> {
  List<VendorEntityInformation>? vendorsList;

  @override
  void initState() {
    super.initState();
    initializeVendors();
  }

  Future initializeVendors() async {
    final List<VendorEntityInformation> temp =
        await ConnectionsService.instance.getVendors();
    temp.removeWhere(
      (element) => element.vendorsAndServices == VendorsAndServices.undefined,
    );
    setState(() {
      vendorsList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (vendorsList == null) {
      return const CircularProgressIndicatorAtom();
    }

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 16,
      ),
      reverse: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final vendor = vendorsList![index];
        return VendorWidget(vendor);
      },
      itemCount: vendorsList!.length,
    );
  }
}
