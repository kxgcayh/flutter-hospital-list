import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury_test/app/data/models/instance_model.dart';

class InstanceDashboardView extends GetView {
  InstanceDashboardView(
    this.baseInstance, {
    this.instances,
    this.categories,
    this.filter,
    this.onTapFilter,
  });

  final BaseInstance baseInstance;
  final List<String> categories;
  final String filter;
  final ValueChanged<String> onTapFilter;
  final List<InstanceData> instances;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                baseInstance.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Lihat Semua'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Container(
                margin: EdgeInsets.fromLTRB(12, 4, 12, 12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      spreadRadius: 0.001,
                      offset: Offset(2, 4.5),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: filter == category ? Colors.red : Colors.white,
                  child: InkWell(
                    onTap: () => onTapFilter(category),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 18,
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color:
                              filter == category ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Column(
          children: instances.map((instance) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://fakeimg.pl/80x80/?retina=1&text=${instance.category}&font=noto',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(instance.name),
                              Text(instance.address),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Lihat Detail'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
