import 'package:material_ui/material_ui.dart';
import 'package:test_vending_machine/core/utils/currency_format.dart';
import 'package:test_vending_machine/features/home/models/drink_models.dart';

class DrinkCard extends StatelessWidget {
  final DrinkModel drink;
  final VoidCallback onBuy;

  const DrinkCard({super.key, required this.drink, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    final isEmpty = drink.isOutOfStock;

    return Card(
      elevation: 2,
      color: isEmpty ? Colors.grey.shade200 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: isEmpty
                  ? Colors.grey.shade400
                  : const Color(0xFF0284C7).withValues(alpha: 0.12),
              child: Icon(
                Icons.local_drink,
                color: isEmpty ? Colors.white : const Color(0xFF0284C7),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drink.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isEmpty ? Colors.grey : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(drink.price),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isEmpty ? Colors.grey : const Color(0xFF059669),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isEmpty
                        ? 'Out of stock'
                        : 'Stock available: ${drink.stock}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isEmpty ? FontWeight.bold : FontWeight.normal,
                      color: isEmpty ? Colors.red : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: isEmpty ? null : onBuy,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0284C7),
                foregroundColor: Colors.white,
              ),
              child: Text(isEmpty ? 'Out of stock' : 'Buy'),
            ),
          ],
        ),
      ),
    );
  }
}
