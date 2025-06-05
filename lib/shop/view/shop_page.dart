import '../../constructor/config.dart';
import '../../constants/drawer_nav_bar.dart';
import '/shop/view/shop_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/shop/cubit/shop_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/bottom_nav_bar.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ShopView());
  }

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  List<String> items = [
    "Акции",
    "Доставка",
    "Контакты",
  ];
  int current = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShopCubit>(context).fetchData();
  }

  static double heightOfList(String str) {
    if (str.length > 33) {
      return 110;
    } else {
      return 55;
    }
  }

  String getNewLineString(readLines) {
    StringBuffer sb = StringBuffer();
    for (String line in readLines) {
      sb.write("$line\n");
    }
    return sb.toString();
  }

  String getPhone(phone) {
    StringBuffer sb = StringBuffer();
    sb.write("+" + phone[0] + " ");
    sb.write(phone.substring(2, 5) + " ");
    sb.write(phone.substring(6, 9) + " ");
    sb.write(phone.substring(9, 11) + " ");
    sb.write(phone[11] + "5");
    return sb.toString();
  }

  Widget tabChoice(i, sh, shpr, shde) {
    int prom_count = shpr.length;
    if (i == 0 && shpr != null) {
      return Center(
          child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        padding: EdgeInsets.all(8),
        width: 358,
        height: shpr.length / 2 * 112 - 18,
        decoration: BoxDecoration(
          color: Color.fromRGBO(40, 45, 49, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 150 / 80,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(prom_count, (index) {
                return Card(
                  color: Color.fromRGBO(111, 117, 122, 1),
                  child: Container(
                    height: 80,
                    width: 155,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(111, 117, 122, 1),
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      height: 80,
                      width: 155,
                      child: Center(
                        child: Text(
                          shpr[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                );
              })),
        ),
      ));
    } else if (i == 1 && shde != null) {
      List<String> days = shde[0].daysDelivery();
      print(days);
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
          padding: EdgeInsets.all(16),
          width: 358,
          decoration: BoxDecoration(
              color: Color.fromRGBO(40, 45, 49, 1),
              borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Доставка',
                style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    Container(
                      width: 97,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 136, 236, 1),
                          borderRadius: BorderRadius.circular(21)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color.fromRGBO(40, 45, 49, 1),
                            size: 16.0,
                          ),
                          Text(
                            days[0],
                            style: const TextStyle(
                              color: Color.fromRGBO(40, 45, 49, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 97,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 136, 236, 1),
                          borderRadius: BorderRadius.circular(21)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color.fromRGBO(40, 45, 49, 1),
                            size: 16.0,
                          ),
                          Text(
                            days[1],
                            style: const TextStyle(
                              color: Color.fromRGBO(40, 45, 49, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 97,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(39, 136, 236, 1),
                          borderRadius: BorderRadius.circular(21)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color.fromRGBO(40, 45, 49, 1),
                            size: 16.0,
                          ),
                          Text(
                            days[2],
                            style: const TextStyle(
                              color: Color.fromRGBO(40, 45, 49, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 24,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(39, 136, 236, 1),
                    borderRadius: BorderRadius.circular(21)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color.fromRGBO(40, 45, 49, 1),
                      size: 16.0,
                    ),
                    Text(
                      shde[0].time,
                      style: const TextStyle(
                        color: Color.fromRGBO(40, 45, 49, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  'Стоимость доставки от ' +
                      shde[0].payment.toString() +
                      ' рублей (в зависимости от района).',
                  style: const TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Бесплатная доставка ',
                      style: TextStyle(
                        color: Color.fromRGBO(104, 101, 101, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: shde[0].paymentFree.toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: const Text(
                  'Способы оплаты',
                  style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: const Text(
                  '• наличные курьеру;',
                  style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                child: const Text(
                  '• онлайн-банкинг (перевод на карту).',
                  style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: const Text(
                  'Возврат',
                  style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  getNewLineString(shde[0].salesReturn.split('_')),
                  style: const TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else if (i == 2 && sh != null) {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
          width: 358,
          decoration: BoxDecoration(
              color: Color.fromRGBO(40, 45, 49, 1),
              borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Row(
                children: [
                  // Container(
                  //   width: 109,
                  //   height: 136,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(14), // Image border
                  //     child: SizedBox.fromSize(
                  //       size: Size.fromRadius(14), // Image radius
                  //       child:
                  //           Image.asset('assets/shop.jpg', fit: BoxFit.cover),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: 204,
                    // height: 136,
                    height: 100,
                    margin: EdgeInsets.only(left: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Магазин спортивного питания ',
                          // 'Магазин спортивного питания ' + sh[0].name,
                          style: const TextStyle(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Container(
                        //   child: Text(
                        //     getNewLineString(sh[0].address.split('_')),
                        //     style: const TextStyle(
                        //       color: Color.fromRGBO(217, 217, 217, 1),
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: 120,
                          height: 24,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(39, 136, 236, 1),
                              borderRadius: BorderRadius.circular(21)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_outlined,
                                color: Color.fromRGBO(40, 45, 49, 1),
                                size: 16.0,
                              ),
                              Text(
                                sh[0].time,
                                style: const TextStyle(
                                  color: Color.fromRGBO(40, 45, 49, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // getPhone(sh[0].phone),
                      "+7 904 944 2429",
                      style: const TextStyle(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.phone,
                          color: Color.fromRGBO(217, 217, 217, 1)),
                      onPressed: () {
                        launchUrl(
                            (Uri.parse('tel://${"+7 904 944 2429"}'))
                            // (Uri.parse('tel://${getPhone(sh[0].phone)}'))
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(39, 136, 236, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ))),
                  onPressed: () {
                    launchUrl(Uri.parse("https://yandex.ru/maps/56/chelyabinsk/house/ulitsa_soni_krivoy_62/YkgYdQFmTUEGQFtvfX10dntmYw==/?ll=61.366441%2C55.157758&z=17"));
                    // launchUrl(Uri.parse(sh[0].map));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Показать на карте',
                        style: TextStyle(
                          color: Color.fromRGBO(40, 45, 49, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        // <-- Icon
                        Icons.chevron_right,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: const Text('Error'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color.fromRGBO(24, 28, 31, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(24, 28, 31, 1),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Магазин',
                  style: TextStyle(
                    // height: 24,
                    fontSize: 24,
                    color: Color.fromRGBO(228, 226, 226, 1),
                  ),
                  textAlign: TextAlign.left,
                ),
                Icon(Icons.shopping_cart_sharp)
              ],
            ),
          ],
        ),
        toolbarHeight: 70,
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state is ShopLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is ShopLoaded && (state).shopItems != null &&
              (state).shop != null &&
              (state).shopDelivery != null &&
              (state).shopPromotion != null) {
            final shopItems = (state).shopItems;
            final shop = (state).shop;
            final shop_promotions = (state).shopPromotion;
            final shop_delivery = (state).shopDelivery;
            final int count1;
            final Set<String> uniqCategory = {};
            final List<String> uniqCategory2;
            if (shopItems != null &&
                shop != null &&
                shop_delivery != null &&
                shop_promotions != null) {
              for (final elem in shopItems) {
                uniqCategory.add(elem.itemCategory.toString());
              }
              if (shop.isNotEmpty && shop_promotions.isNotEmpty && shop_delivery.isNotEmpty && shopItems.isNotEmpty){
                count1 = uniqCategory.length;
                uniqCategory2 = uniqCategory.toList();
                List<String> uniqCat = [];
                for (var i = 0; i < uniqCategory2.length; i++) {
                  switch (uniqCategory2[i]) {
                    case 'ItemCategory.SportsDrinks':
                      uniqCat.add('Спортивные напитки');
                      break;
                    case 'ItemCategory.ComplexProteins':
                      uniqCat.add('Комплексные протеины');
                      break;
                    case 'ItemCategory.ProteinIsolatesAndHydrolysates':
                      uniqCat.add('Белковые изоляты и гидролизаты');
                      break;
                    case 'ItemCategory.WheyProteins':
                      uniqCat.add('Сывороточные протеины');
                      break;
                    case 'ItemCategory.VitaminsMinerals':
                      uniqCat.add('Витамины, минералы');
                      break;
                    case 'ItemCategory.DrugsForJointLigaments':
                      uniqCat.add('Препараты для суставных связок');
                      break;
                    case 'ItemCategory.Gainers':
                      uniqCat.add('Гейнеры (углеводно-белковые смеси)');
                      break;
                    case 'ItemCategory.CaseinProteins':
                      uniqCat.add('Казеиновые протеины');
                      break;
                    default:
                      break;
                  }
                  if (i == uniqCategory2.length - 1) {
                    uniqCat.add('Другое');
                  }
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Каталог',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: (uniqCat.length * 72),
                          child: ListView(
                            primary: false,
                            children: List.generate(count1, (index) {
                              return GestureDetector(
                                  onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopViewDetail(elements: shopItems, category: uniqCat[index])),

                                );
                              },
                                child: Container(
                                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                                width: 170,
                                height: heightOfList(uniqCat[index]),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color.fromRGBO(40, 45, 49, 1),
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    uniqCat[index],
                                    style: const TextStyle(
                                      color: Color.fromRGBO(217, 217, 217, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                )
                              );
                            }),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
                            child: Text(
                              // shop[0].name.toUpperCase(),
                              "Дворец спорта".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 358,
                        height: 60,
                        child: ListView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      width: 116,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: current == index
                                            ? Color.fromRGBO(217, 217, 217, 1)
                                            : Color.fromRGBO(40, 45, 49, 1),
                                        borderRadius: current == index
                                            ? BorderRadius.circular(10)
                                            : BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          items[index],
                                          style: current == index
                                              ? TextStyle(
                                              color: Color.fromRGBO(
                                                  40, 45, 49, 1),
                                              fontSize: 16)
                                              : TextStyle(
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      Center(
                        child: tabChoice(
                            current, shop, shop_promotions, shop_delivery),
                      )
                    ],
                  ),
                );
              }else{
                return Center(child: const Text('Error'),);
              }
            } else {
              return Text(
                'Не удалось получить список товаров',
                style: TextStyle(color: Colors.white),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: GACRules.navBarType == 0 ?
        BottomNavBar(3, context) : null,
      drawer: GACRules.navBarType == 1 ?
        DrawerNavBar(3, context): null,
    );
  }
}
