import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FoodsAds extends StatefulWidget {
  const FoodsAds({Key key}) : super(key: key);

  @override
  State<FoodsAds> createState() => _FoodsAdsState();
}

class _FoodsAdsState extends State<FoodsAds> {
    FacebookNativeAd _facebookNativeAd;



    @override
    void initState() {
      super.initState();
      _showNativeBannerAd();
    }



  _showNativeBannerAd() {
    setState(() {
      _facebookNativeAd = FacebookNativeAd(
        placementId: "YOUR_PLACEMENT_ID",
        adType: NativeAdType.NATIVE_BANNER_AD,
        bannerAdSize: NativeBannerAdSize.HEIGHT_100,
        backgroundColor: Colors.blue,
        buttonBorderColor: Colors.white,
        buttonColor: Colors.deepPurple,
        buttonTitleColor: Colors.white,
        descriptionColor: Colors.white,
        width: double.infinity,
        keepAlive: true,
        titleColor: Colors.white,
        listener: (result, value) {
          print("Native Banner Ad: $result --> $value");
        },
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _facebookNativeAd,
    );
  }
}
