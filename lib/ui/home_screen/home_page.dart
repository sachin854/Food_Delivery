import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/home/home_bloc.dart';
import '../../controller/bloc/home/home_event.dart';
import '../../controller/bloc/home/home_state.dart';
import '../../resources/constants/color.dart';
import '../../resources/constants/dimensions.dart';
import '../../resources/constants/font_weight.dart';
import '../../resources/constants/padding.dart';
import '../../widgets/component/text_widget.dart';
import '../../widgets/discount_item_card.dart';
import '../../widgets/category_item.dart';
import '../../widgets/offer_card.dart';
import '../login_intro/login_intro.dart';
import '../more_category/more_category.dart';
import '../mycart/my_cart.dart';
import '../notification/notification_screen.dart';
import '../offers/special_offers.dart';
import '../recommended/filter.dart';
import '../recommended/recommended.dart';
import '../search/search_screen.dart';
import 'addbasket/homeitem_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int? selectedIndex;
  late final int selectedRecommendedIndex;
  late final String selectedCategoryName;
  int selectedRecommendFilter = 0;
  late HomeBloc? _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            final Map<Type, String> stateToRouteMap = {
              HomeErrorState: LoginIntro.routeName,
              HomeNotificationTappedState: NotificationScreen.routeName,
              HomeCartTappedState: MyCartScreen.routeName,
              HomeOffersSeeAllTappedState: SpecialOffers.routeName,
              HomeCategoryItemTappedState: FilterScreen.routeName,
              HomeDicountCardSeeAllTappedState: MoreCategory.routeName,
              // HomeDicountCardIndividualTappedState: HomeItemScreen.routeName,
              HomeRecommendedSeeAllTappedState: RecommendedScreen.routeName,
              // FilterTappedState: null,
              // RecommendCardTappedState: HomeItemScreen.routeName,
            };
            final routeName = stateToRouteMap[state.runtimeType];

            if(state is RecommendCardTappedState){
              Navigator.of(context).pushNamed(HomeItemScreen.routeName,
                  arguments: selectedRecommendedIndex);
            }
            if(state is HomeDicountCardIndividualTappedState){
              Navigator.of(context).pushNamed(HomeItemScreen.routeName,
                  arguments: selectedIndex as int);
            }
            if (routeName != null) {
              if (routeName == HomeItemScreen.routeName) {
                final index = selectedIndex;
                Navigator.of(context).pushNamed(
                  routeName,
                  arguments: index,
                );
              }

              if (routeName == FilterScreen.routeName) {
                final categoryName = selectedCategoryName;
                if (categoryName == "More") {
                  Navigator.of(context).pushNamed(MoreCategory.routeName);
                } else {
                  Navigator.of(context).pushNamed(FilterScreen.routeName,
                      arguments: categoryName);
                }
              } else {
                Navigator.of(context).pushNamed(
                  routeName,
                );
              }
            }
          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeSuccessState) {
              return Container(
                padding: const EdgeInsets.only(
                  top: Dimensions.dimen15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.dimen15,
                        right: Dimensions.dimen15,
                      ),
                      child: Column(
                        children: [

                          ///Profile
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                ),
                                child: Image.network(
                                    state.userData[0]["profile"].toString()),
                              ),
                              const SizedBox(
                                width: Dimensions.dimen15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                    title: "Deliver to",
                                    titleColor: AppColor.greyColor,
                                  ),
                                  const SizedBox(
                                    height: Dimensions.dimen10,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        title: state.userData[0]["address"]
                                            .toString(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Dimensions.dimen40,
                                    width: Dimensions.dimen40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: AppColor.borderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                    child: Stack(children: <Widget>[
                                      Center(
                                          child: GestureDetector(
                                              onTap: () {
                                                context.read<HomeBloc>().add(
                                                    HomeNotificationTapEvent());
                                              },
                                              child: const Icon(
                                                  Icons.notifications_active))),
                                      const Positioned(
                                        top: Dimensions.dimen8,
                                        right: Dimensions.dimen8,
                                        child: Icon(Icons.brightness_1,
                                            size: Dimensions.dimen8,
                                            color: Colors.redAccent),
                                      )
                                    ]),
                                  ),
                                  const SizedBox(
                                    width: Dimensions.dimen15,
                                  ),
                                  Container(
                                    height: Dimensions.dimen40,
                                    width: Dimensions.dimen40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: AppColor.borderColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                    child: Stack(children: <Widget>[
                                      Center(
                                        child: GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .add(HomeCartTapEvent());
                                            },
                                            child: const Icon(
                                                Icons.shopping_cart)),
                                      ),
                                      const Positioned(
                                        top: Dimensions.dimen8,
                                        right: Dimensions.dimen8,
                                        child: Icon(Icons.brightness_1,
                                            size: Dimensions.dimen8,
                                            color: Colors.redAccent),
                                      )
                                    ]),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: Dimensions.dimen20),

                          ///Search Field
                          Container(
                            height: Dimensions.dimen48,
                            padding: const EdgeInsets.all(Paddings.padding10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              readOnly: true,
                              onTap: (){
                                Navigator.pushNamed(context, SearchScreen.routeName);
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: "What are you craving?",
                                hintStyle: TextStyle(color: AppColor.greyColor),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: Dimensions.dimen27,color: AppColor.greyColor,
                                ),
                              ),
                            ),
                          ),

                          ///Special Offers
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: Dimensions.dimen20,
                                    bottom: Dimensions.dimen20),
                                child: TextWidget(
                                  title: "Special Offers",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.dimen19,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: Dimensions.dimen20,
                                    bottom: Dimensions.dimen20),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(HomeOffersSeeAllTapEvent());
                                  },
                                  child: const TextWidget(
                                    title: "See All",
                                    titleColor: AppColor.greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.dimen15,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ///OfferCard
                          const OfferCard(
                            widget: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                        title: "30%",
                                        fontSize: 60,
                                        titleColor: AppColor.whiteColor,
                                        fontWeight: FontWeight.bold),
                                    TextWidget(
                                        title: "DICOUNT ONLY",
                                        fontSize: 18,
                                        titleColor: AppColor.whiteColor,
                                        fontWeight: FontWeight.bold),
                                    TextWidget(
                                        title: "VALID FOR TODAY!",
                                        fontSize: 18,
                                        titleColor: AppColor.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          ///Category
                          Wrap(
                            spacing: 14,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              for (var index = 0;
                                  index < state.category.length;
                                  index++)
                                InkWell(
                                  onTap: () {
                                    selectedCategoryName = state.category[index]?["category_name"];
                                    context.read<HomeBloc>().add(
                                        HomeCategoryItemTapEvent(
                                            selectedCategoryName));
                                  },
                                  child: CategoryItem(
                                    image: state.category[index]?["food_image"],
                                    name: state.category[index]
                                        ?["category_name"],
                                  ),
                                )
                            ],
                          ),

                          ///See all
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: Dimensions.dimen20,
                                    bottom: Dimensions.dimen20),
                                child: TextWidget(
                                  title: "Discount Guaranteed! ",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.dimen19,
                                ),
                              ),
                              const TextWidget(
                                title: '\u{1F44C}',
                                fontSize: 18,
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: Dimensions.dimen20,
                                    bottom: Dimensions.dimen20),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(HomeDiscountSeeAllTapEvent());
                                  },
                                  child: const TextWidget(
                                    title: "See All",
                                    titleColor: AppColor.greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.dimen15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///Discount Guaranteed
                    SizedBox(
                      height: Dimensions.dimen300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: state.discountArray.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectedIndex = index;
                                  context.read<HomeBloc>().add(
                                      HomeDiscountCardTapEvent(selectedIndex!));
                                },
                                child: DiscountCard(
                                  img: state.discountArray[index]?['images'] ??
                                      "",
                                  foodTitle: state.discountArray[index]
                                          ?['food_title'] ??
                                      "",
                                  distance: state.discountArray[index]
                                          ?['distance'] ??
                                      '',
                                  ratings: state.discountArray[index]
                                          ?['ratings'] ??
                                      '',
                                  foodPrice: state.discountArray[index]
                                              ?['price']
                                          .toString() ??
                                      '',
                                  deliveryCharges: state.discountArray[index]
                                          ?['delivery_charges'] ??
                                      '',
                                  likeValue: state.discountArray[index]
                                          ?['like'],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    ///Recommended For You
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.dimen15,
                          right: Dimensions.dimen15,
                          top: Dimensions.dimen20,
                          bottom: Dimensions.dimen20),
                      child: Row(
                        children: [
                          const TextWidget(
                            title: "Recommended For You",
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.dimen19,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(HomeRecommendSeeAllTapEvent());
                            },
                            child: const TextWidget(
                              title: "See All",
                              titleColor: AppColor.greenColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.dimen15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Filter
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.recommendFilterData.length,
                          itemBuilder: (context, index) {
                            bool selectedFilter = selectedRecommendFilter == index;
                            return Container(
                              decoration: BoxDecoration(
                                color: selectedFilter
                                    ? Colors.green
                                    : Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.green, width: 2),
                                borderRadius:
                                BorderRadius.circular(35),
                              ),
                              margin: const EdgeInsets.only(left: 16),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedRecommendFilter = index;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: selectedFilter
                                          ? Colors.green
                                          : Colors.white,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              25))),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        state.recommendFilterData[
                                        index]
                                        ["food_image"],
                                        height: 19,
                                        width: 19,
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 5),
                                        child: TextWidget(
                                          title: state.recommendFilterData[
                                          index]
                                          ["title"]
                                              .toString(),
                                          titleColor: selectedFilter
                                              ? Colors.white
                                              : Colors.green,
                                          fontSize:
                                          AppFontWeight.font13,
                                          fontWeight: FontWeight.w700,
                                          textoverflow:
                                          TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),

                    ///Recommended Card
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                        state.discountArray.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(
                                top: Dimensions.dimen20,
                                left: Dimensions.dimen16,
                                right: Dimensions.dimen16),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {
                                selectedRecommendedIndex = index;
                                context.read<HomeBloc>().add(
                                    RecommendCardTapEvent(selectedRecommendedIndex));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(
                                            Paddings.padding15),
                                        height: Dimensions.dimen120,
                                        width: Dimensions.dimen120,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              state.discountArray[index]
                                                      ?['images'] ??
                                                  "",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              title: state.discountArray[index]
                                                  ?["food_title"],
                                              titleColor: AppColor.blackColor,
                                              fontSize: AppFontWeight.font18,
                                              fontWeight: FontWeight.w700,
                                              //height: 4,
                                              textoverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                TextWidget(
                                                  title:
                                                      state.discountArray[index]
                                                          ["distance"],
                                                  titleColor:
                                                      AppColor.greyColor,
                                                  fontSize:
                                                      AppFontWeight.font12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Paddings.padding5,
                                                      right: Paddings.padding5),
                                                  child: TextWidget(
                                                    title: "|",
                                                    titleColor:
                                                        AppColor.greyColor,
                                                    fontSize:
                                                        AppFontWeight.font12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 15),
                                                    TextWidget(
                                                      title:
                                                          state.discountArray[
                                                                      index]?[
                                                                  'ratings'] ??
                                                              '',
                                                      titleColor:
                                                          AppColor.greyColor,
                                                      fontSize:
                                                          AppFontWeight.font12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.delivery_dining,
                                                    color: Colors.green,
                                                    size: 15),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TextWidget(
                                                    title: state.discountArray[
                                                                index]?['price']
                                                            .toString() ??
                                                        '',
                                                    titleColor:
                                                        AppColor.greyColor,
                                                    fontSize:
                                                        AppFontWeight.font12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const Spacer(),
                                                 Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 12),
                                                  child: Icon(
                                                    state.discountArray[
                                                    index]?['like']
                                                        ? Icons.favorite
                                                        : Icons.favorite_border_outlined,
                                                    color: state.discountArray[
                                                    index]?['like']
                                                        ? AppColor.redColor
                                                        : Colors.grey, // Use your desired grey color
                                                  )
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.dimen25,
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
        // bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
