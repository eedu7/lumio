import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/special_offer_card.dart';

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
        flexWeights: <int>[1],
        shrinkExtent: 256,
        scrollDirection: Axis.horizontal,
        itemSnapping: true,

        children: List.generate(5, (int index) {
          return SpecialOfferCard(index: index);
        }),
      ),
    );
  }
}
