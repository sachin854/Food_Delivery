import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/bloc/more_category/category_bloc.dart';
import '../../controller/bloc/more_category/category_event.dart';
import '../../controller/bloc/more_category/category_state.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../widgets/category_item.dart';
import '../../widgets/component/text_widget.dart';
import '../home_screen/home_page.dart';
import '../recommended/filter.dart';

class MoreCategory extends StatefulWidget {
  static const routeName = "/more_category";
  const MoreCategory({super.key});

  @override
  State<MoreCategory> createState() => _MoreCategoryState();
}

class _MoreCategoryState extends State<MoreCategory> {
  late CategoryBloc? _categoryBloc;
  late var categoryName;

  @override
  void initState() {
    _categoryBloc = CategoryBloc();
    super.initState();
  }

  @override
  void dispose() {
    _categoryBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.whiteColor,
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.blackColor,
              ),
            ),
            title: const TextWidget(
              title: "More Category",
              titleColor: AppColor.blackColor,
            ),
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryItemTappedState) {
                  Navigator.of(context).pushNamed(FilterScreen.routeName,arguments:categoryName);
                }
              },
              builder: (context, state) {
                if (state is CategoryLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.dimen10, right: Dimensions.dimen10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Wrap(
                            spacing: 14,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              for (var i = 0;
                                  i < state.category.length;
                                  i++)
                                InkWell(
                                  onTap: () {
                                    categoryName=state.category[i]?["category_name"];
                                    context
                                        .read<CategoryBloc>()
                                        .add(CategoryItemTapEvent(state.category[i]
                                    ?["category_name"]));
                                  },
                                  child: CategoryItem(
                                    image: state.category[i]?["food_image"],
                                    name: state.category[i]
                                        ?["category_name"],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is CategoryLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )),
    );
  }
}
