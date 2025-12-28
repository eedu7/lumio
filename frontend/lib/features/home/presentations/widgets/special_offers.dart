import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/home/presentations/widgets/special_offer_card.dart';
import 'package:go_router/go_router.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196.0,
      width: double.infinity,
      child: CarouselView.weighted(
        onTap: (int index) {
          context.push(
            AppRoutes.categoryProducts(
              key: AppRoutes.collection,
              value: 'Special Offer: ${index}',
              discount: '30',
            ),
          );
        },
        flexWeights: <int>[1],
        shrinkExtent: 256,
        scrollDirection: Axis.horizontal,
        itemSnapping: true,
        children: List.generate(5, (int index) {
          return InkWell(
            onTap: () => {debugPrint('Clicked')},
            child: SpecialOfferCard(index: index),
          );
        }),
      ),
    );
  }
}
