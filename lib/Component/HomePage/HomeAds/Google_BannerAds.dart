import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleBannerAds extends StatefulWidget {
  const GoogleBannerAds({Key key}) : super(key: key);

  @override
  State<GoogleBannerAds> createState() => _GoogleBannerAdsState();
}

class _GoogleBannerAdsState extends State<GoogleBannerAds> {

    BannerAd _bannerAd;
    bool _isAdLoaded=false;

    @override
  void initState() {
      _initBannerAd();
    super.initState();
  }
    _initBannerAd(){
      _bannerAd  = BannerAd(
          size: AdSize.largeBanner,
          adUnitId: BannerAd.testAdUnitId,
          listener: BannerAdListener(
            onAdLoaded: (ad){
              setState(() {
                _isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad,error){},
          ),
          request: AdRequest(),
      );
      _bannerAd.load();
    }

  @override
  Widget build(BuildContext context) {
    return _isAdLoaded? Container(
      width: _bannerAd.size.width.toDouble(),
      height:  _bannerAd.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd,),
    ):SizedBox();

  }
}
