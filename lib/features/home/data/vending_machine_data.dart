import 'package:test_vending_machine/core/utils/currency_format.dart';
import 'package:test_vending_machine/features/home/models/drink_models.dart';

class VendingMachine {
  final List<int> acceptedDenominations = [2000, 5000, 10000, 20000];

  final List<DrinkModel> drinks = [
    DrinkModel(name: 'Aqua', price: 5000, stock: 3),
    DrinkModel(name: 'Teh Botol', price: 7000, stock: 3),
    DrinkModel(name: 'Pocari Sweat', price: 10000, stock: 3),
  ];

  int currentBalance = 0;

  String insertMoney(int amount) {
    currentBalance += amount;
    return 'Money inserted: ${formatRupiah(amount)}. Total balance: ${formatRupiah(currentBalance)}';
  }

  String buyDrink(DrinkModel drink) {
    if (drink.isOutOfStock) {
      return 'Sorry, ${drink.name} out of stock!';
    }
    if (currentBalance < drink.price) {
      return 'Insufficient balance.';
    }

    drink.stock -= 1;
    final change = currentBalance - drink.price;
    currentBalance = 0;

    if (change > 0) {
      return 'Successfully buy ${drink.name}! Your change: ${formatRupiah(change)}.';
    }
    return 'Successfully buy ${drink.name}!';
  }

  int refundMoney() {
    final refunded = currentBalance;
    currentBalance = 0;
    return refunded;
  }

  List<DrinkModel> getOutOfStockDrinks() {
    return drinks.where((item) => item.isOutOfStock).toList();
  }

  void restockAll() {
    drinks[0].stock = 3;
    drinks[1].stock = 3;
    drinks[2].stock = 3;
  }
}
