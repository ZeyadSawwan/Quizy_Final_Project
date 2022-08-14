import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../utils/ad_helper.dart';
import '../result/result_screen.dart';

class QuizBloc {
  late Timer timer;
  int start = 60;
  bool answerResult = false;
  String selectedAnswer = "";
  int index2 = 0;
  bool answered = false;
  int selectedAnswerIndex = 0;
  PageController? pageController = PageController(initialPage: 0);
  List<String> collectionName = [
    "quiz2",
    "quiz1",
    "quiz4",
    "quiz3",
  ];

  int score = 0;
  InterstitialAd? interstitialAd;

  void scoreMethod(index, streamSnapshot) {
    if (selectedAnswer == streamSnapshot.data!.docs[index]["correctAnswer"]) {
      score += 1;
    }
  }

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitalAdUnitId!,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => interstitialAd = ad,
          onAdFailedToLoad: (LoadAdError error) => interstitialAd = null,
        ));
  }

  void showInterstitialAd(indexx) {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!
          .show()
          .then((value) => Get.to(() => ResultScreen(score, indexx)));

      interstitialAd = null;
    }
  }
}
