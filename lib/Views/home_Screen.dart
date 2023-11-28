import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:khafif/Constants/mycolors.dart';
import 'package:khafif/Presintation/Widgets/Home_Items/comening_food.dart';
import 'package:khafif/Presintation/Widgets/methods.dart';
import 'package:khafif/Presintation/Widgets/Home_Items/product_favorite.dart';
import 'package:khafif/Presintation/Widgets/global_item.dart';
//import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollcontroller = ScrollController();
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    page = 0;
    fetsh();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.maxScrollExtent ==
          scrollcontroller.offset) {
        fetsh();
      }
    });
    super.initState();
  }

  Future fetsh() async {
    if (isLoading) {
      return;
    }
    // isLoading = true;
    // const limit = 25;
    // final url = Uri.parse('$baseUrl/products?offset=$page&limit=$limit');
    // final url2 = Uri.parse('$baseUrl/categories');
    // final response = await http.get(url);
    // final response2 = await http.get(url2);
    // if (response.statusCode == 200 && response2.statusCode == 200) {
    //   //print(response2.body);
    //   final List newItems = json.decode(response.body);
    //   final result = postFromJson(response.body);
    //   // final List newItems2 = json.decode(response2.body);
    //   final result2 = postFromJson2(response2.body);
    //   setState(() {
    //     page = page + limit;
    //     isLoading = false;
    //     if (newItems.length < limit) {
    //       hasMore = false;
    //     }
    //     items.addAll(result);
    //     items2.addAll(result2);
    //     print(items2[0].image);

    //   });
    // } else {
    //   return;
    // }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 0;
      //  items.clear();
    });
    fetsh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      appBar: customAppBar("", context, true),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return buildHomeWidget(context);
            } else {
              return buildHomeWidget(context);
            }
          },
          child: showLoadingIndicator(),
        ),
      ),
    );
  }
}

Widget buildHomeWidget(
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Container(
      //color: Colors.pink,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildCustomMeal(
              "label1",
              "label2",
              "label3",
              const Icon(
                Icons.delivery_dining,
                size: 24.0,
              ),
              const Icon(
                Icons.abc,
                size: 24,
              ),
              context),
          buildSearchBar("search", TextEditingController(), context),
          globalTitle("descover", context),
          buildProductBar(context),
          buildFavoriteItem(context),
          globalTitle("descover", context),
          buildComeningFood(context),
        ],
      ),
    ),
  );
}

Widget buildComeningFood(BuildContext context) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.15,
    width: double.infinity,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: ((context, index) {
          return const ComeningFood(
            title: 'Noodles',
            rating: '4.2',
            price: '20.00',
            imageUrl: 'assets/images/fries.jpg',
          );
        })),
  );
}

Widget buildFavoriteItem(BuildContext context) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.40,
    width: double.infinity,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: ((context, index) {
          return const ProductFavorite(
            title: 'titel',
            subTitle: 'subtitle',
            imageUrl: 'assets/images/fries.jpg',
            calories: '200',
            price: '180',
            favorate: true,
          );
        })),
  );
}

Widget buildProductBar(BuildContext context) {
  return SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.20,
    width: double.infinity,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: ((context, index) {
          return const GlobalItem(
              label: "label", imageUrl: 'assets/images/fries.jpg');
        })),
  );
}

Widget buildCustomMeal(String label1, String label2, String label3, Icon icon1,
    Icon icon2, BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    // color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label1,
          style: const TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          //color: Colors.green,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon1, Text(label2)],
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon2, Text(label3)],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildSearchBar(
    String label, TextEditingController textController, BuildContext context) {
  return SizedBox(
    //color: Colors.black,
    width: double.infinity,
    height: 96,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 13,
          child: SizedBox(
            //padding: const EdgeInsets.all(8.0),
            width: MediaQuery.sizeOf(context).width * 0.80,
            child: buildTextFormField(
                label,
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                textController,
                true),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.sizeOf(context).width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.table_rows_rounded,
                  size: 16,
                )),
          ),
        ),
      ],
    ),
  );
}
