import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/ad_helper.dart';

class AddMobBanner extends StatefulWidget {
  const AddMobBanner({Key? key}) : super(key: key);

  @override
  State<AddMobBanner> createState() => _AddMobBannerState();
}

class _AddMobBannerState extends State<AddMobBanner> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isBannerAdReady
        ? Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          )
        : Container();
  }
}
