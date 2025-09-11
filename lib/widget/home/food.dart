import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/repository/food.dart';
import 'package:foodorder/riverpod/home/home_provider.dart';
import 'package:foodorder/screen/detaill.dart';
import 'package:foodorder/widget/animated/describe.dart';
import 'package:foodorder/widget/animated/foodimage.dart';

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
                child: AutoAnimatedImage(imageUrl: dataHomeProvider.image),
              ),
              const SizedBox(height: 5),
              Text(
                dataHomeProvider.nama,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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

              AutoAnimatedDescribe(describe: dataHomeProvider.deskripsi),
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
                  minimumSize: const Size(double.infinity, 45),
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xffcbfe01),
                ),
                child: Text(
                  "Pesan Sekarang",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
