import 'package:material_ui/material_ui.dart';
import 'package:test_vending_machine/core/utils/currency_format.dart';

class MoneyInputPanel extends StatelessWidget {
  final List<int> denominations;
  final ValueChanged<int> onInsertMoney;

  const MoneyInputPanel({
    super.key,
    required this.denominations,
    required this.onInsertMoney,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Insert the money',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: denominations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final amount = denominations[index];
            return OutlinedButton.icon(
              onPressed: () => onInsertMoney(amount),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 44, 88, 200),
                side: const BorderSide(color: Color.fromARGB(255, 44, 88, 200)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.payments_outlined, size: 18),
              label: Text(
                formatRupiah(amount),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ],
    );
  }
}
