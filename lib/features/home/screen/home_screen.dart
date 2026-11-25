import 'package:material_ui/material_ui.dart';
import 'package:test_vending_machine/features/home/data/vending_machine_data.dart';
import 'package:test_vending_machine/features/home/models/drink_models.dart';
import 'package:test_vending_machine/features/home/widgets/item_card.dart';
import 'package:test_vending_machine/features/home/widgets/money_input.dart';
import 'package:test_vending_machine/features/home/widgets/vending_machine.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VendingMachine _machine = VendingMachine();
  String _statusMessage = 'Silakan masukkan uang dan pilih minuman.';

  void _handleInsertMoney(int amount) {
    setState(() {
      _statusMessage = _machine.insertMoney(amount);
    });
  }

  void _handleBuyDrink(DrinkModel drink) {
    setState(() {
      _statusMessage = _machine.buyDrink(drink);
    });
  }

  void _handleRestock() {
    setState(() {
      _machine.restockAll();
      _statusMessage = 'Restock successfully.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final outOfStockNames = _machine
        .getOutOfStockDrinks()
        .map((e) => e.name)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Vending Machine'),
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Isi Ulang Stok',
            onPressed: _handleRestock,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MachineDisplayPanel(
              balance: _machine.currentBalance,
              statusMessage: _statusMessage,
              outOfStockNames: outOfStockNames,
            ),
            const SizedBox(height: 20),
            MoneyInputPanel(
              denominations: _machine.acceptedDenominations,
              onInsertMoney: _handleInsertMoney,
            ),
            const SizedBox(height: 10),
            const Text(
              'Choose Drink',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _machine.drinks.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final drink = _machine.drinks[index];
                return DrinkCard(
                  drink: drink,
                  onBuy: () => _handleBuyDrink(drink),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
