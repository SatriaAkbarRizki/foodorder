import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/kategori.dart';
import 'package:foodorder/riverpod/detail/details_provider..dart';

class DropdownWidgetDetail extends StatelessWidget {
  KategoriFoodModel kategoriFoodModel;
  DropdownWidgetDetail({super.key, required this.kategoriFoodModel});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final providerDetails = ref.watch(detailsProvider.notifier);
        providerDetails.sortData(kategoriFoodModel.subkategori);

        return SizedBox(
          width: double.infinity,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 15,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),

              value: providerDetails.listKategori.first,
              items: providerDetails.listKategori
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: 14),
                      ),
                    ),
                  )
                  .toList(),

              // ],
              onChanged: (value) {
                providerDetails.setKategori(value ?? "");
              },
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
