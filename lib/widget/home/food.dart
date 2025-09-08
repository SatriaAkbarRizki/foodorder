import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/home/home_provider.dart';
import 'package:foodorder/screen/detaill.dart';

class FoodWidgetHome extends StatelessWidget {
  const FoodWidgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final dataHomeProvider = ref.watch(homeProvider);
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'foodimagges-${dataHomeProvider.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${RepoFood.url}/assets/images/${dataHomeProvider.image}',
                      fit: BoxFit.contain,
                      height: 250,
                    ),
                  ),
                ),
              ),
              Text(
                dataHomeProvider.nama,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Always 5 stars
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: index < dataHomeProvider.rating
                          ? Colors.amber
                          : Colors.grey,
                    );
                  },
                ),
              ),
              Text(
                dataHomeProvider.deskripsi,
                textAlign: TextAlign.justify,
                maxLines: 5,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ref
                          .read(homeProvider.notifier)
                          .formatCurrency(dataHomeProvider.harga),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     shape: ContinuousRectangleBorder(
                    //       borderRadius: BorderRadiusGeometry.all(
                    //         Radius.circular(50),
                    //       ),
                    //     ),
                    //   ),
                    //   child: Text("Simpan"),
                    // ),
                  ],
                ),
              ),

              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetaillScreen(kategoriFoodModel: dataHomeProvider),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(50)),
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xffcbfe01),
                ),
                child: Text(
                  "Pesan Sekarang",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
