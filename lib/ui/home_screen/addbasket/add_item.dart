import 'package:finalapppp/controller/bloc/additem/additem_bloc.dart';
import 'package:finalapppp/controller/bloc/additem/additem_state.dart';
import 'package:finalapppp/resources/constants/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/additem/additem_state.dart';
import '../../../widgets/component/text_widget.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = "/additem";

  AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  int up = 1;
  bool isLiked = false;
  late AddItemBloc _addItemBloc;

  @override
  initState() {
    super.initState();
    _addItemBloc = BlocProvider.of<AddItemBloc>(context);
  }

  void increment() {
    setState(() {
      if (up >= 0 && up < 10) {
        up++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (up > 1) {
        up--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BlocConsumer<AddItemBloc, AddItemState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AddItemLoadingState) {
                print('dataa.....'+state.additemdata['images']);
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          state.additemdata['images'] ?? "",
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: 10,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: GestureDetector(
                              onTap: () {
                                // toggleFavorite();
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title: state.additemdata['your_title']?? "",
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          Divider(
                            height: 30,
                          ),
                          TextWidget(
                            title: state.additemdata['description']?? "",
                            fontSize: AppFontWeight.font17,
                            textoverflow: TextOverflow.ellipsis,
                            maxLine: 3,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 6,
                              top: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(right: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: InkWell(
                                        onTap: () {
                                          decrement();
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.green,
                                          size: 20,
                                        )),
                                  ),
                                  TextWidget(
                                    title: '$up',
                                    fontSize: AppFontWeight.font20,
                                    titleColor: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: InkWell(
                                        onTap: () {
                                          increment();
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.green,
                                          size: 16,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.1)),
                              child: TextFormField(
                                maxLines: 4,
                                decoration: const InputDecoration(
                                    labelText: 'Note to Restaurent (optional)',
                                    labelStyle: TextStyle(color: Colors.grey)),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 30),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25), // Adjust the radius as needed
                                  ),
                                ),
                                onPressed: () => {},
                                child: Text(
                                  'Add to Basket -\$24.00',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ]),
      )),
    );
  }
}
