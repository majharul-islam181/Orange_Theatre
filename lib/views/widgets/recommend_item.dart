// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../../config/colors/color.dart';
import 'custom_image.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({
    super.key,
    required this.data,
    this.onTap,
  });

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            _buildImage(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: buildInfo(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColor.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data["type"],
          style: const TextStyle(
            fontSize: 12,
            color: AppColor.labelColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        _buildRateAndPrice(),
      ],
    );
  }

  Widget _buildRateAndPrice() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 14,
          color: AppColor.yellow,
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: Text(
            data["rate"],
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Text(
          data["price"],
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      radius: 15,
      height: 80,
    );
  }
}
