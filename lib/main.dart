import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🐈‍⬛', '🐾', '🐈‍⬛', '🐾'];
  final images = [
    'images/adel-grober-GqNmg3BRFXA-unsplash.jpg',
    'images/alexandra-leru-ESZeCN254sM-unsplash.jpg',
    'images/anton-ponomarenko-j7uVTlpwI0o-unsplash.jpg',
    'images/ash-he-8URbMA6wW_o-unsplash.jpg',
    'images/blanca-querol-DN5QDf0aEbc-unsplash.jpg',
    'images/bob-van-aubel-mkR6kHxBARU-unsplash.jpg',
    'images/chrissy-bogomilova-jwsFGhnOTx4-unsplash.jpg',
    'images/dare-artworks-y0igfGnNUMw-unsplash.jpg',
    'images/darren-richardson-KCdivsKLuWQ-unsplash.jpg',
    'images/diana-parkhouse-y5-GavCrQYk-unsplash.jpg',
    'images/eniko-kis-O2PtgZ9j5kg-unsplash.jpg',
    'images/german-krupenin-7y0ofVbPN_g-unsplash.jpg',
    'images/gio-bartlett-gOMrZXQfZKc-unsplash.jpg',
    'images/hannah-troupe-0FQneB1VjaM-unsplash.jpg',
    'images/julia-kadel-T0YlQSzr7lE-unsplash.jpg',
    'images/luis-fernando-estrada--093TmtmGy4-unsplash.jpg',
    'images/max-nedorezov-zva16ORWXOw-unsplash.jpg',
    'images/nathan-riley-_ir1D49PRqM-unsplash.jpg',
    'images/nygi-6NxCELoZnPg-unsplash.jpg',
    'images/omar-ramadan-AR0aEvnz78g-unsplash.jpg',
    'images/tatyana-rubleva-2QRmPpq7xCw-unsplash.jpg',
    'images/tudor-baciu-V5pZ9F0M4vU-unsplash.jpg',
  ];

  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(255, 33, 32, 32),
    appBar: AppBar(title: const Text('🐈‍⬛ Cat Gacha')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.asset(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🐾', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}
