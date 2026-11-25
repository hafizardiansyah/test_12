import 'package:material_ui/material_ui.dart';
import 'package:test_vending_machine/core/utils/currency_format.dart';

class MachineDisplayPanel extends StatelessWidget {
  final int balance;
  final String statusMessage;
  final List<String> outOfStockNames;

  const MachineDisplayPanel({
    super.key,
    required this.balance,
    required this.statusMessage,
    required this.outOfStockNames,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.money_outlined,
                                color: Colors.white70,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Current Balance',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(balance),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 235, 161, 57),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.kitchen, color: Colors.white, size: 30),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          Text(
            statusMessage,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
