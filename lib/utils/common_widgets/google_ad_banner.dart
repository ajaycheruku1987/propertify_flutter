import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';

class GoogleAdBanner extends StatefulWidget {
  final AdSize adSize;
  /// When true, keeps ad height reserved so feed layout does not jump.
  final bool reserveSpace;

  const GoogleAdBanner({
    super.key,
    this.adSize = AdSize.mediumRectangle,
    this.reserveSpace = false,
  });

  @override
  State<GoogleAdBanner> createState() => _GoogleAdBannerState();
}

class _GoogleAdBannerState extends State<GoogleAdBanner> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  int _retryCount = 0;
  static const int _maxRetries = 3;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _bannerAd?.dispose();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdHelper.adRequest,
      size: widget.adSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) return;
          setState(() {
            _isLoaded = true;
            _retryCount = 0;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
          if (!mounted) return;
          setState(() {
            _isLoaded = false;
            _bannerAd = null;
          });
          if (_retryCount < _maxRetries) {
            _retryCount++;
            Future.delayed(Duration(seconds: _retryCount * 2), () {
              if (mounted) _loadAd();
            });
          }
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.adSize.height.toDouble();
    final width = widget.adSize.width.toDouble();

    if (_isLoaded && _bannerAd != null) {
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: SizedBox(
          width: width,
          height: height,
          child: AdWidget(ad: _bannerAd!),
        ),
      );
    }

    if (widget.reserveSpace) {
      return SizedBox(height: height + 24);
    }
    return const SizedBox.shrink();
  }
}
