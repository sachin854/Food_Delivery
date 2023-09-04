import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_bloc.dart';
import 'package:finalapppp/resources/constants/color.dart';
import 'package:finalapppp/resources/constants/dimensions.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:finalapppp/services/rest_api/client.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:finalapppp/widgets/component/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressForm extends StatefulWidget {
  AddAddressForm();
  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   late DeliveryAddressBloc _deliveryAddressBloc;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            title: 'Add New Address',
            fontWeight: FontWeight.w700,
            fontSize: AppFontWeight.font18,
          ),
          const SizedBox(height: Dimensions.dimen20),
          const TextWidget(
            title: 'Title',
            fontWeight: FontWeight.w400,
            fontSize: AppFontWeight.font14,
          ),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Home, Office, etc.',
              hintStyle: TextStyle(color: AppColor.greyColor),

              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Dimensions.dimen17),
          const TextWidget(
            title: 'Address',
            fontWeight: FontWeight.w400,
            fontSize: AppFontWeight.font14,
          ),
          TextFormField(
            controller: addressController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Enter your address',
              hintStyle: TextStyle(color: AppColor.greyColor),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: Dimensions.dimen17),
          ElevatedButton(
            onPressed: () {
              String title=titleController.text;
              String address=addressController.text;
              // List newaddress={"title":titleController.text,"address":addressController.text};
              Map<dynamic,dynamic> data=
                {
                  "title":titleController.text,
                  "address":addressController.text
                };
              print("sssss");
              print(data);
              var newarray= RestApiClientService.shared.deliveryaddress.add(data);
              Navigator.pop(context);
              print(RestApiClientService.shared.deliveryaddress);
   
              },
            child: Text('Save Address'),style: ElevatedButton.styleFrom(primary: AppColor.greenColor),
          ),
        ],
      ),
    );
  }
}
