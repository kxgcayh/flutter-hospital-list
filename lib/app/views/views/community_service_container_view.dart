import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury_test/app/controllers/community_service_controller_controller.dart';
import 'package:valbury_test/app/data/models/community_service_model.dart';

class CommunityServiceContainerView extends GetView {
  final CommunityService communities;

  CommunityServiceContainerView({
    required this.communities,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  communities.name!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetBuilder<CommunityServiceControllerController>(
              builder: (controller) {
                return Row(
                  children: [
                    SizedBox(width: 12),
                    Row(
                      children: controller.getCategories(communities).map((e) {
                        return _CategorySlider(e, type: communities.name!);
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GetBuilder<CommunityServiceControllerController>(
                builder: (controller) {
              return Column(
                children: controller.filterData(communities).map((e) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 14),
                              Text(
                                e.name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                e.address!,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lihat Detail',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CategorySlider extends StatelessWidget {
  final String title;
  final String type;
  const _CategorySlider(
    this.title, {
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityServiceControllerController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(right: 12),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () => controller.updateFilter(title, type),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(title)),
              ),
            ),
          ),
        );
      },
    );
  }
}
