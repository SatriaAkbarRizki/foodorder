import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("Order", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/bakso.png',
                      fit: BoxFit.cover,
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "title",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Jumlah: 99',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),

                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(fontSize: 12),
                        ),
                        Text(
                          'Rp 999999',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
