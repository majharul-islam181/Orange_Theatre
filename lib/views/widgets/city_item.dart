// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../../config/colors/color.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
    required this.data,
    this.isSelected = false,
    this.onTap,
  });

  final data;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: isSelected ? Colors.white : AppColor.darker,
          ),
        ),
      ),
    );
  }
}
