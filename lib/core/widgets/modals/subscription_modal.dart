import 'package:ceticy/core/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSubscriptionModal(BuildContext context) {
  int selectedOffer = 2;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'NO-LIMIT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    SvgPicture.asset(
                      AppAsset.getSvg("video_call"),
                      width: 64,
                      height: 64,
                      colorFilter: ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Navigue sans publicité',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Utilise l\'application en toute liberté.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubscriptionCard(
                      duration: '1 mois',
                      price: '25 €',
                      monthly: '',
                      discount: '',
                      isSelected: selectedOffer == 1,
                      onTap: () {
                        setState(() {
                          selectedOffer = 1;
                        });
                      },
                    ),
                    SubscriptionCard(
                      duration: '3 mois',
                      price: '45 €',
                      monthly: '15 €/m.',
                      discount: 'Économisez 40%',
                      isSelected: selectedOffer == 2,
                      onTap: () {
                        setState(() {
                          selectedOffer = 2;
                        });
                      },
                    ),
                    SubscriptionCard(
                      duration: '6 mois',
                      price: '60 €',
                      monthly: '10,00 €/m.',
                      discount: 'Économisez 60%',
                      isSelected: selectedOffer == 3,
                      onTap: () {
                        setState(() {
                          selectedOffer = 3;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Abonnement résiliable à tout moment\nPaiement unique',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'En appuyant sur Continuer, ton achat sera facturé, ton abonnement sera automatiquement renouvelé pour la même durée jusqu’à ce que tu l’annules dans les paramètres de Play Store. Tu acceptes également nos Conditions d\'utilisation.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    String offerMessage = selectedOffer == 1 ? '1 mois' : selectedOffer == 2 ? '3 mois' : '6 mois';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Demande de paiement pour l\'abonnement pour $offerMessage') ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      );
    },
  );
}

class SubscriptionCard extends StatelessWidget {
  final String duration;
  final String price;
  final String monthly;
  final String discount;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.duration,
    required this.price,
    required this.monthly,
    required this.discount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final [duration1, duration2] = duration.split(' ');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 112,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: Colors.black, width: 4)
              : Border.all(color: Colors.transparent, width: 4),
        ),
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Text(
              duration1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black),
            ),
            Text(
              duration2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            discount.isNotEmpty
                ? Container(
                    height: 20,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      discount,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 20,
                  ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            if (monthly.isNotEmpty)
              Text(
                monthly,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
