import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/products_provider.dart';
import 'package:rzq_customer/screens/home/tabs/brands_tab.dart';
import 'package:rzq_customer/screens/home/tabs/main_tab.dart';
import 'package:rzq_customer/screens/home/tabs/sales_tab.dart';
import 'package:rzq_customer/screens/widgets/custom_drawer.dart';
import 'package:rzq_customer/styles/app_const.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rzq_customer/providers/bottom_bar_provider.dart';
// import 'package:rzq_customer/utils/fcm.dart';

class HomeScreen extends StatefulWidget {
  static const nav = "/home";
  final int? cityId;
  final int? categoryId;

  HomeScreen({this.categoryId, this.cityId});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int? categoryId;
  int? cityId;
  bool searchOn = false;
  // void initState() {
  //   super.initState();
  //   initFcm(context);
  //   categoryId = widget.categoryId;
  //   cityId = widget.cityId;
  // }
  void search() {
    setState(() {
      searchOn = !searchOn;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: DefaultTabController(
          length: 9,
          child: Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: AppConst.mIcon,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: search,
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              bottom: searchOn
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(55.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "بحث فى المنتجات",
                              fillColor: Colors.grey.shade400,
                              suffixIcon: InkWell(
                                  child: Icon(Icons.close, color: Colors.black),
                                  onTap: search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                  gapPadding: 25),
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15)),
                        ),
                      ))
                  : TabBar(
                      padding: const EdgeInsets.all(1),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      isScrollable: true,
                      labelColor: Colors.black87,
                      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                      tabs: [
                        Tab(
                          iconMargin: const EdgeInsets.all(3),
                          child: FittedBox(child: Text("الرئيسيه")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("تخفيضات ")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("الاجهزه")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("العطور")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("الميكياج")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("العنايه")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("عطورات النيش")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("الساعات")),
                        ),
                        Tab(
                          child: FittedBox(child: Text("الماركات")),
                        ),
                      ],
                    ),
            ),
            body: FutureBuilder(
                future: Provider.of<ProductsProvider>(context).fetchProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  return TabBarView(
                    children: [
                      MainTab(),
                      SalesTab(),
                      SalesTab(),
                      SalesTab(),
                      SalesTab(),
                      SalesTab(),
                      SalesTab(),
                      SalesTab(),
                      BrandsTab(),
                    ],
                  );
                }),
          ),
        ));
  }
}
