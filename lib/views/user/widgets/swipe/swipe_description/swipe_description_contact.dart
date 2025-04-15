import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SwipeDescriptionContact extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescriptionContact({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    String? address = restaurant.address;
    String? phone = restaurant.phoneNumber;

  //   if (address!.endsWith("France")) {
  //     address = address.substring(0, address.length - 7);
  //   }

    Future<void> openMaps() async {
      String encodedAddress = Uri.encodeComponent(address!);

      Uri mapUri;

      if (Platform.isIOS) {
        // Ouvre Apple Maps sur iOS
        mapUri = Uri.parse("http://maps.apple.com/?q=$encodedAddress");
      } else {
        // Ouvre Google Maps sur Android
        mapUri = Uri.parse("geo:0,0?q=$encodedAddress");
      }

      if (await canLaunchUrl(mapUri)) {
        await launchUrl(mapUri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback vers Google Maps Web
        Uri webUrl = Uri.parse(
            "https://www.google.com/maps/search/?api=1&query=$encodedAddress");
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      }
    }

    Future<void> showConfirmationDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, // L'utilisateur doit appuyer sur un bouton pour fermer
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ouvrir la Map"),
            content: Text(
                "Vous allez être redirigé vers votre application de cartographie pour vous rendre au restaurant.\n\n$address"),
            actions: <Widget>[
              TextButton(
                child: Text("Annuler"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Ouvrir"),
                onPressed: () {
                  Navigator.pop(context);
                  openMaps();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> makePhoneCall() async {
      Uri phoneUri = Uri.parse("tel:$phone");

      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Impossible de passer l\'appel';
      }
    }

    Future<void> showPhoneDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible:
            false, // L'utilisateur doit appuyer sur un bouton pour fermer
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Appeler le restaurant"),
            content: Text(
                "Vous allez être redirigé vers votre application de téléphone pour appeler le restaurant.\n\n$phone"),
            actions: <Widget>[
              TextButton(
                child: Text("Annuler"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Ouvrir"),
                onPressed: () {
                  Navigator.pop(context);
                  makePhoneCall();
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                phone != null
                    ? GestureDetector(
                        onTap: () => showPhoneDialog(context),
                        child: Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 14,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                phone,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 1),
                          ),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          padding: const EdgeInsets.all(0),
                        ),
                      )
                    : Container(),
                    address != null
                    ?
                GestureDetector(
                  onTap: () => showConfirmationDialog(context),
                  child: Chip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          // 🔥 Permet au texte de s'adapter sans déborder
                          child: Text(
                            address,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                            softWrap: true, // 🔥 Permet le passage à la ligne
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.all(0),
                  ),
                )
                    : Container(),

              ],
            ),
          ],
        ));
  }
}
