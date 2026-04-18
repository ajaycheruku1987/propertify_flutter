/// Enum representing different types of content that can be boosted/promoted
enum ContentType {
  /// Feed post content
  FEED,

  /// Reels/video content
  REEL,

  /// Sales/product listing
  SALES,

  /// Service/expert listing
  SERVICE,

  /// Banner/advertisement
  BANNER_AD,

  /// Company content
  COMPANY,

  /// Subscription
  SUBSCRIPTION,

  /// Service verification
  SERVICE_VERIFICATION,

  /// Ads (legacy/compatibility)
  ADS,

  /// Featured listing (legacy/compatibility)
  FEATURED_LISTING,

  GST_VERIFICATION;

  /// Convert enum to string for API/URL parameters
  String get value {
    switch (this) {
      case ContentType.FEED:
        return 'FEED';
      case ContentType.REEL:
        return 'REEL';
      case ContentType.SALES:
        return 'SALES';
      case ContentType.SERVICE:
        return 'SERVICE';
      case ContentType.BANNER_AD:
        return 'BANNER_AD';
      case ContentType.COMPANY:
        return 'COMPANY';
      case ContentType.SUBSCRIPTION:
        return 'SUBSCRIPTION';
      case ContentType.SERVICE_VERIFICATION:
        return 'SERVICE_VERIFICATION';
      case ContentType.ADS:
        return 'ADS';
      case ContentType.FEATURED_LISTING:
        return 'FEATURED_LISTING';
      case ContentType.GST_VERIFICATION:
        return 'GST_VERIFICATION';
    }
  }

  /// Get display name for the content type
  String get displayName {
    switch (this) {
      case ContentType.FEED:
        return 'Post';
      case ContentType.REEL:
        return 'Reel';
      case ContentType.SALES:
        return 'Product';
      case ContentType.SERVICE:
        return 'Service';
      case ContentType.BANNER_AD:
        return 'Banner';
      case ContentType.COMPANY:
        return 'Company';
      case ContentType.SUBSCRIPTION:
        return 'Subscription';
      case ContentType.SERVICE_VERIFICATION:
        return 'Service Verification';
      case ContentType.ADS:
        return 'Ad';
      case ContentType.FEATURED_LISTING:
        return 'Featured Listing';
      case ContentType.GST_VERIFICATION:
        return 'GST Verification';
    }
  }

  /// Get the boost screen title for this content type
  String get boostTitle {
    switch (this) {
      case ContentType.FEED:
        return 'Boost Post';
      case ContentType.REEL:
        return 'Boost Reel';
      case ContentType.SALES:
        return 'Boost Product';
      case ContentType.SERVICE:
        return 'Boost Service';
      case ContentType.BANNER_AD:
        return 'Boost Banner';
      case ContentType.COMPANY:
        return 'Boost Company';
      case ContentType.SUBSCRIPTION:
        return 'Subscription';
      case ContentType.SERVICE_VERIFICATION:
        return 'Service Verification';
      case ContentType.ADS:
        return 'Boost Ad';
      case ContentType.FEATURED_LISTING:
        return 'Featured Listing';
      case ContentType.GST_VERIFICATION:
        return 'GST Verification';
    }
  }

  /// Parse string value to enum
  static ContentType fromString(String value) {
    switch (value.toUpperCase()) {
      case 'FEED':
      case 'POST': // Legacy support
        return ContentType.FEED;
      case 'REEL':
      case 'REELS': // Legacy support
        return ContentType.REEL;
      case 'SALES':
        return ContentType.SALES;
      case 'SERVICE':
        return ContentType.SERVICE;
      case 'BANNER_AD':
      case 'BANNER': // Legacy support
        return ContentType.BANNER_AD;
      case 'COMPANY':
        return ContentType.COMPANY;
      case 'SUBSCRIPTION':
        return ContentType.SUBSCRIPTION;
      case 'SERVICE_VERIFICATION':
        return ContentType.SERVICE_VERIFICATION;
      case 'ADS':
        return ContentType.ADS;
      case 'FEATURED_LISTING':
        return ContentType.FEATURED_LISTING;
      case 'GST_VERIFICATION':
        return ContentType.GST_VERIFICATION;
      default:
        return ContentType.FEED; // Default fallback
    }
  }
}
