import 'package:flutter/material.dart';
import '/constants/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shop_cubit.dart';

class ShopViewDetail extends StatelessWidget {
  final elements;
  final category;

  const ShopViewDetail({required this.elements, required this.category});


  @override
  Widget build(BuildContext context) {
    var cat;
    switch (category){
      case "Спортивные напитки":
        cat = ItemCategory.SportsDrinks;
        break;
      case 'Комплексные протеины':
        cat = ItemCategory.ComplexProteins;
        break;
      case 'Белковые изоляты и гидролизаты':
        cat = ItemCategory.ProteinIsolatesAndHydrolysates;
        break;
      case 'Сывороточные протеины':
        cat = ItemCategory.WheyProteins;
        break;
      case 'Витамины, минералы':
        cat = ItemCategory.VitaminsMinerals;
        break;
      case 'Препараты для суставных связок':
        cat = ItemCategory.DrugsForJointLigaments;
        break;
      case 'Гейнеры (углеводно-белковые смеси)':
        cat = ItemCategory.Gainers;
        break;
      case 'Казеиновые протеины':
        cat = ItemCategory.CaseinProteins;
        break;
      default:
        cat = ItemCategory.Other;
        break;

    }
    List newElem = [];
    for (var elem in  elements){
      if (elem.itemCategory == cat){
        newElem.add(elem);
      }
    }
    print(newElem);
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(24, 28, 31, 1.0),
          title: Text(category.toString(),
            style: TextStyle(
              // height: 24,
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            child: ListView(
              children:  List.generate(newElem.length, (index){
                return Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromRGBO(40, 45, 49, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(newElem[index].name.toString(), style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500, color: Colors.white),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(newElem[index].description.toString(), style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.w400, color: Colors.white30),
                            overflow: TextOverflow.ellipsis,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Цена:',
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                            Container(
                              height: 24,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 136, 236, 1),
                                  borderRadius: BorderRadius.circular(21)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    newElem[index].price.toString()+' ₽',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(40, 45, 49, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        )
    );
  }
}
