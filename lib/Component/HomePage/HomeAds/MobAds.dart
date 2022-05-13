import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MobileNativeAds extends StatefulWidget {
  const MobileNativeAds({Key key}) : super(key: key);

  @override
  State<MobileNativeAds> createState() => _MobileNativeAdsState();
}

class _MobileNativeAdsState extends State<MobileNativeAds> {
  NativeAd _ad;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  ///Important make sure to dispose the ad when disposing the screen
  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }


  void loadNativeAd() {
    _ad = NativeAd(
        request: const AdRequest(),
        ///This is a test adUnitId make sure to change it
        adUnitId: NativeAd.testAdUnitId,
        factoryId:"" ,
        listener: NativeAdListener(
            onAdLoaded: (ad){
              setState(() {
                isLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error){
              ad.dispose();
              print('failed to load the ad ${error.message}, ${error.code}');
            }
        )
    );

    _ad.load();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 200,
        width: 200,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index){
              if(isLoaded && index == 2){
                return Container(
                  child: AdWidget(ad: _ad,),
                  alignment: Alignment.center,
                  height: 170,
                  color: Colors.black26,
                );
              }else{
                return ListTile(
                  title: Text('Item ${index + 1}'),
                  leading: const FlutterLogo(size: 25,),
                  subtitle: Text('Sub Title for item ${index + 1}'),
                );
              }

            }
        ),
      ),
    );
  }
}
