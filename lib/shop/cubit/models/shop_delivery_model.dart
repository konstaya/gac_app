/// id : 2
/// time : "10:00-21:00"
/// day_delivery1 : "Вторник"
/// day_delivery2 : "Среда"
/// day_delivery3 : "Четверг"
/// day_delivery4 : "Нет"
/// day_delivery5 : "Нет"
/// day_delivery6 : "Нет"
/// day_delivery7 : "Нет"
/// payment : 100
/// payment_free : "от 3500 рублей."
/// sales_return : "По факту получения. Оплату транспортных расходов берет покупатель на себя, после получения деньги будут возвращены в течении 14 дней.  Продавец в праве отказать в возвращении денег"
/// shop : 1

class ShopDeliveryModel {
  final int id;
  final String time;
  final String dayDelivery1;
  final String dayDelivery2;
  final String dayDelivery3;
  final String dayDelivery4;
  final String dayDelivery5;
  final String dayDelivery6;
  final String dayDelivery7;
  final int payment;
  final String paymentFree;
  final String salesReturn;
  final int shop;

  ShopDeliveryModel({
    required this.id,
    required this.time,
    required this.dayDelivery1,
    required this.dayDelivery2,
    required this.dayDelivery3,
    required this.dayDelivery4,
    required this.dayDelivery5,
    required this.dayDelivery6,
    required this.dayDelivery7,
    required this.payment,
    required this.paymentFree,
    required this.salesReturn,
    required this.shop,
  });

  factory ShopDeliveryModel.fromJson(Map<String, dynamic> json){
    return ShopDeliveryModel(
        id: json['id'],
        time: json['time'],
        dayDelivery1: json['day_delivery1'],
        dayDelivery2: json['day_delivery2'],
        dayDelivery3: json['day_delivery3'],
        dayDelivery4: json['day_delivery4'],
        dayDelivery5: json['day_delivery5'],
        dayDelivery6: json['day_delivery6'],
        dayDelivery7: json['day_delivery7'],
        payment: json['payment'],
        paymentFree: json['payment_free'],
        salesReturn: json['sales_return'],
        shop: json['shop']);
  }

  List<String> daysDelivery(){
    List<String> days = [];
    if (dayDelivery1 != 'Нет'){
      days.add(dayDelivery1);
    }
    if (dayDelivery2 != 'Нет'){
      days.add(dayDelivery2);
    }
    if (dayDelivery3 != 'Нет'){
      days.add(dayDelivery3);
    }
    if (dayDelivery4 != 'Нет'){
      days.add(dayDelivery4);
    }
    if (dayDelivery5 != 'Нет'){
      days.add(dayDelivery5);
    }
    if (dayDelivery6 != 'Нет'){
      days.add(dayDelivery6);
    }
    if (dayDelivery7 != 'Нет'){
      days.add(dayDelivery7);
    }
    return days;
  }

  @override
  String toString() {
    return 'ShopDeliveryModel{id: $id, time: $time, dayDelivery1: $dayDelivery1, dayDelivery2: $dayDelivery2, dayDelivery3: $dayDelivery3, dayDelivery4: $dayDelivery4, dayDelivery5: $dayDelivery5, dayDelivery6: $dayDelivery6, dayDelivery7: $dayDelivery7, payment: $payment, paymentFree: $paymentFree, salesReturn: $salesReturn, shop: $shop}';
  }
}