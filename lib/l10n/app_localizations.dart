import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('te')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'PROPERTIFY'**
  String get appName;

  /// No description provided for @feeds.
  ///
  /// In en, this message translates to:
  /// **'Feeds'**
  String get feeds;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @welcomeToPropertify.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Propertify'**
  String get welcomeToPropertify;

  /// No description provided for @signInToSync.
  ///
  /// In en, this message translates to:
  /// **'Sign in to sync your favorites and manage your listings across devices'**
  String get signInToSync;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @myCompany.
  ///
  /// In en, this message translates to:
  /// **'My Company'**
  String get myCompany;

  /// No description provided for @verificationInProgress.
  ///
  /// In en, this message translates to:
  /// **'Verification in progress'**
  String get verificationInProgress;

  /// No description provided for @usuallyTakes24Hours.
  ///
  /// In en, this message translates to:
  /// **'Usually takes 24 hours'**
  String get usuallyTakes24Hours;

  /// No description provided for @gstRejected.
  ///
  /// In en, this message translates to:
  /// **'GST Verification is Rejected'**
  String get gstRejected;

  /// No description provided for @pleaseUpdateGst.
  ///
  /// In en, this message translates to:
  /// **'Please update the GST again'**
  String get pleaseUpdateGst;

  /// No description provided for @verifyGst.
  ///
  /// In en, this message translates to:
  /// **'Verify GST'**
  String get verifyGst;

  /// No description provided for @verifyGstToCreate.
  ///
  /// In en, this message translates to:
  /// **'Verify GST to start creating projects'**
  String get verifyGstToCreate;

  /// No description provided for @wantToCreateProject.
  ///
  /// In en, this message translates to:
  /// **'Want to create a Project!'**
  String get wantToCreateProject;

  /// No description provided for @createCompanyByGst.
  ///
  /// In en, this message translates to:
  /// **'First Create a company by Verifying GST'**
  String get createCompanyByGst;

  /// No description provided for @createCompany.
  ///
  /// In en, this message translates to:
  /// **'Create Company'**
  String get createCompany;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboard;

  /// No description provided for @homeLoansDashboard.
  ///
  /// In en, this message translates to:
  /// **'Home Loans Dashboard'**
  String get homeLoansDashboard;

  /// No description provided for @interiorDesignDashboard.
  ///
  /// In en, this message translates to:
  /// **'Interior Design Dashboard'**
  String get interiorDesignDashboard;

  /// No description provided for @myDashboard.
  ///
  /// In en, this message translates to:
  /// **'My Dashboard'**
  String get myDashboard;

  /// No description provided for @suggestionsFeedback.
  ///
  /// In en, this message translates to:
  /// **'Suggestions & Feedback'**
  String get suggestionsFeedback;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get inviteFriends;

  /// No description provided for @followUs.
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get followUs;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutConfirm;

  /// No description provided for @madeWith.
  ///
  /// In en, this message translates to:
  /// **'Made with '**
  String get madeWith;

  /// No description provided for @inIndia.
  ///
  /// In en, this message translates to:
  /// **' in India'**
  String get inIndia;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPost;

  /// No description provided for @postedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Posted Successfully!'**
  String get postedSuccessfully;

  /// No description provided for @postCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your Post has been created Successfully\nwould You Like to boost Your Post'**
  String get postCreatedSuccess;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all the fields'**
  String get fillAllFields;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @titleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get titleRequired;

  /// No description provided for @enterPropertyTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter property title'**
  String get enterPropertyTitle;

  /// No description provided for @propertyType.
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get propertyType;

  /// No description provided for @propertyTypeRequired.
  ///
  /// In en, this message translates to:
  /// **'Property type is required'**
  String get propertyTypeRequired;

  /// No description provided for @lookingFor.
  ///
  /// In en, this message translates to:
  /// **'Looking For'**
  String get lookingFor;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressRequired;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @priceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price is required'**
  String get priceRequired;

  /// No description provided for @addImages.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get addImages;

  /// No description provided for @uploadImages.
  ///
  /// In en, this message translates to:
  /// **'Upload images'**
  String get uploadImages;

  /// No description provided for @justTapToHere.
  ///
  /// In en, this message translates to:
  /// **'Just tap to Here to '**
  String get justTapToHere;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @galleryToUpload.
  ///
  /// In en, this message translates to:
  /// **' the Gallery to\nUpload image'**
  String get galleryToUpload;

  /// No description provided for @addMoreImages.
  ///
  /// In en, this message translates to:
  /// **'Add more images +'**
  String get addMoreImages;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @writeDescription.
  ///
  /// In en, this message translates to:
  /// **'Write a description for your property...'**
  String get writeDescription;

  /// No description provided for @acceptPolicies.
  ///
  /// In en, this message translates to:
  /// **'By Creating this post you are accepting our Generated policies'**
  String get acceptPolicies;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @errorPickingImages.
  ///
  /// In en, this message translates to:
  /// **'Error picking images'**
  String get errorPickingImages;

  /// No description provided for @homeLoansNotSupportedIos.
  ///
  /// In en, this message translates to:
  /// **'Home Loans are not supported on iOS'**
  String get homeLoansNotSupportedIos;

  /// No description provided for @createRequest.
  ///
  /// In en, this message translates to:
  /// **'Create a Request'**
  String get createRequest;

  /// No description provided for @enterRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter request title'**
  String get enterRequestTitle;

  /// No description provided for @pleaseEnterTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get pleaseEnterTitle;

  /// No description provided for @enterRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter request description'**
  String get enterRequestDescription;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get pleaseEnterDescription;

  /// No description provided for @budgetPrice.
  ///
  /// In en, this message translates to:
  /// **'Budget Price'**
  String get budgetPrice;

  /// No description provided for @enterBudgetPrice.
  ///
  /// In en, this message translates to:
  /// **'Enter your budget price'**
  String get enterBudgetPrice;

  /// No description provided for @pleaseEnterBudgetPrice.
  ///
  /// In en, this message translates to:
  /// **'Please enter budget price'**
  String get pleaseEnterBudgetPrice;

  /// No description provided for @pleaseSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select a request category'**
  String get pleaseSelectCategory;

  /// No description provided for @pleaseEnterAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter an address'**
  String get pleaseEnterAddress;

  /// No description provided for @createSalesProject.
  ///
  /// In en, this message translates to:
  /// **'Create Sales Project'**
  String get createSalesProject;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @reraNumber.
  ///
  /// In en, this message translates to:
  /// **'RERA Number'**
  String get reraNumber;

  /// No description provided for @noOfFloors.
  ///
  /// In en, this message translates to:
  /// **'No of Floors'**
  String get noOfFloors;

  /// No description provided for @noOfUnits.
  ///
  /// In en, this message translates to:
  /// **'No of Units'**
  String get noOfUnits;

  /// No description provided for @noOfFlats.
  ///
  /// In en, this message translates to:
  /// **'No of Flats'**
  String get noOfFlats;

  /// No description provided for @noOfVillas.
  ///
  /// In en, this message translates to:
  /// **'No of Villas'**
  String get noOfVillas;

  /// No description provided for @noOfPlots.
  ///
  /// In en, this message translates to:
  /// **'No of Plots'**
  String get noOfPlots;

  /// No description provided for @totalBuiltUpArea.
  ///
  /// In en, this message translates to:
  /// **'Total Built-up Area'**
  String get totalBuiltUpArea;

  /// No description provided for @totalProjectArea.
  ///
  /// In en, this message translates to:
  /// **'Total Project Area'**
  String get totalProjectArea;

  /// No description provided for @measurement.
  ///
  /// In en, this message translates to:
  /// **'Measurement'**
  String get measurement;

  /// No description provided for @saleSpecification.
  ///
  /// In en, this message translates to:
  /// **'Sale Specification'**
  String get saleSpecification;

  /// No description provided for @saleSpecHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 2BHK, 3BHK starting from ₹45L'**
  String get saleSpecHint;

  /// No description provided for @possessionDate.
  ///
  /// In en, this message translates to:
  /// **'Possession Date'**
  String get possessionDate;

  /// No description provided for @selectPossessionDate.
  ///
  /// In en, this message translates to:
  /// **'Select possession date'**
  String get selectPossessionDate;

  /// No description provided for @pleaseChooseAddress.
  ///
  /// In en, this message translates to:
  /// **'Please choose address'**
  String get pleaseChooseAddress;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @specifications.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specifications;

  /// No description provided for @enterSpecification.
  ///
  /// In en, this message translates to:
  /// **'Enter a specification'**
  String get enterSpecification;

  /// No description provided for @publicFacilities.
  ///
  /// In en, this message translates to:
  /// **'Public Facilities'**
  String get publicFacilities;

  /// No description provided for @enterPublicFacility.
  ///
  /// In en, this message translates to:
  /// **'Enter a public facility'**
  String get enterPublicFacility;

  /// No description provided for @createServiceAgent.
  ///
  /// In en, this message translates to:
  /// **'Create Service Agent'**
  String get createServiceAgent;

  /// No description provided for @agentDetails.
  ///
  /// In en, this message translates to:
  /// **'Agent Details'**
  String get agentDetails;

  /// No description provided for @agentShopName.
  ///
  /// In en, this message translates to:
  /// **'Agent / Shop Name'**
  String get agentShopName;

  /// No description provided for @enterServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter service title'**
  String get enterServiceTitle;

  /// No description provided for @pleaseEnterServiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter service title'**
  String get pleaseEnterServiceTitle;

  /// No description provided for @pleaseEnterPinCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter pin code'**
  String get pleaseEnterPinCode;

  /// No description provided for @enterPinCode.
  ///
  /// In en, this message translates to:
  /// **'Enter pin code'**
  String get enterPinCode;

  /// No description provided for @pinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin Code'**
  String get pinCode;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @selectAtLeastOneCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one category'**
  String get selectAtLeastOneCategory;

  /// No description provided for @createReel.
  ///
  /// In en, this message translates to:
  /// **'Create Reel'**
  String get createReel;

  /// No description provided for @reelPostedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reel Posted Successfully!'**
  String get reelPostedSuccess;

  /// No description provided for @reelCreatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Reel has been created Successfully\nwould You Like to boost Your Reel'**
  String get reelCreatedMessage;

  /// No description provided for @failedToCreateReel.
  ///
  /// In en, this message translates to:
  /// **'Failed to create reel'**
  String get failedToCreateReel;

  /// No description provided for @uploadVideoFile.
  ///
  /// In en, this message translates to:
  /// **'Upload Video File'**
  String get uploadVideoFile;

  /// No description provided for @maxVideoDuration.
  ///
  /// In en, this message translates to:
  /// **'Maximum 30 sec. Preferred format mp4 or webm (≤5MB)'**
  String get maxVideoDuration;

  /// No description provided for @enterDescriptionHere.
  ///
  /// In en, this message translates to:
  /// **'Enter your description here'**
  String get enterDescriptionHere;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @pleaseSelectVideo.
  ///
  /// In en, this message translates to:
  /// **'Please select a video'**
  String get pleaseSelectVideo;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @shareProperties.
  ///
  /// In en, this message translates to:
  /// **'Share your properties with\nthe community'**
  String get shareProperties;

  /// No description provided for @showcaseProperties.
  ///
  /// In en, this message translates to:
  /// **'Showcase properties with\nshort videos'**
  String get showcaseProperties;

  /// No description provided for @registerAsAgent.
  ///
  /// In en, this message translates to:
  /// **'Register as Service Agent'**
  String get registerAsAgent;

  /// No description provided for @offerProfessionalServices.
  ///
  /// In en, this message translates to:
  /// **'Offer your professional\nservices'**
  String get offerProfessionalServices;

  /// No description provided for @createBannerAd.
  ///
  /// In en, this message translates to:
  /// **'Create a Banner Ad'**
  String get createBannerAd;

  /// No description provided for @promoteBusiness.
  ///
  /// In en, this message translates to:
  /// **'Promote your business with\nadvertisements'**
  String get promoteBusiness;

  /// No description provided for @findMatchNeeds.
  ///
  /// In en, this message translates to:
  /// **'Find properties that match\nyour needs'**
  String get findMatchNeeds;

  /// No description provided for @hours24.
  ///
  /// In en, this message translates to:
  /// **'24 HOURS'**
  String get hours24;

  /// No description provided for @canCreateAfter24.
  ///
  /// In en, this message translates to:
  /// **'You can create a project\nafter 24 hours'**
  String get canCreateAfter24;

  /// No description provided for @verificationWait24.
  ///
  /// In en, this message translates to:
  /// **'Verification is in progress. Please wait up to 24 hours.'**
  String get verificationWait24;

  /// No description provided for @createProject.
  ///
  /// In en, this message translates to:
  /// **'Create Project'**
  String get createProject;

  /// No description provided for @listProjectsSales.
  ///
  /// In en, this message translates to:
  /// **'List your projects for\nsales'**
  String get listProjectsSales;

  /// No description provided for @verifyCompanyGst.
  ///
  /// In en, this message translates to:
  /// **'Verify company GST to\nstart posting projects'**
  String get verifyCompanyGst;

  /// No description provided for @registerCompanyToCreate.
  ///
  /// In en, this message translates to:
  /// **'Register your company to\ncreate projects'**
  String get registerCompanyToCreate;

  /// No description provided for @minPrice.
  ///
  /// In en, this message translates to:
  /// **'Min Price'**
  String get minPrice;

  /// No description provided for @maxPrice.
  ///
  /// In en, this message translates to:
  /// **'Max Price'**
  String get maxPrice;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @reels.
  ///
  /// In en, this message translates to:
  /// **'Reels'**
  String get reels;

  /// No description provided for @builderSmart.
  ///
  /// In en, this message translates to:
  /// **'BuilderSmart'**
  String get builderSmart;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @spamMisleading.
  ///
  /// In en, this message translates to:
  /// **'Spam or Misleading'**
  String get spamMisleading;

  /// No description provided for @incorrectDetailsPrice.
  ///
  /// In en, this message translates to:
  /// **'Incorrect details/Price'**
  String get incorrectDetailsPrice;

  /// No description provided for @inappropriateContent.
  ///
  /// In en, this message translates to:
  /// **'Inappropriate content'**
  String get inappropriateContent;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @reportProperty.
  ///
  /// In en, this message translates to:
  /// **'Report Property'**
  String get reportProperty;

  /// No description provided for @whyReporting.
  ///
  /// In en, this message translates to:
  /// **'Why are you reporting this property?'**
  String get whyReporting;

  /// No description provided for @enterReasonHere.
  ///
  /// In en, this message translates to:
  /// **'Enter reason here...'**
  String get enterReasonHere;

  /// No description provided for @pleaseEnterReason.
  ///
  /// In en, this message translates to:
  /// **'Please enter a reason'**
  String get pleaseEnterReason;

  /// No description provided for @postReportedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Post reported, we will investigate further'**
  String get postReportedSuccess;

  /// No description provided for @promotionExpired.
  ///
  /// In en, this message translates to:
  /// **'Promotion Expired'**
  String get promotionExpired;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} Days Left'**
  String daysLeft(int count);

  /// No description provided for @promotedUntil.
  ///
  /// In en, this message translates to:
  /// **'Promoted until {date}'**
  String promotedUntil(String date);

  /// No description provided for @likes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get likes;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get views;

  /// No description provided for @postNotFound.
  ///
  /// In en, this message translates to:
  /// **'Post not found'**
  String get postNotFound;

  /// No description provided for @deleteProperty.
  ///
  /// In en, this message translates to:
  /// **'Delete Property'**
  String get deleteProperty;

  /// No description provided for @deleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this property?'**
  String get deleteConfirm;

  /// No description provided for @pleaseLoginToReport.
  ///
  /// In en, this message translates to:
  /// **'please login to report'**
  String get pleaseLoginToReport;

  /// No description provided for @pleaseLoginToLike.
  ///
  /// In en, this message translates to:
  /// **'Please login to like'**
  String get pleaseLoginToLike;

  /// No description provided for @pleaseLoginToFavorite.
  ///
  /// In en, this message translates to:
  /// **'Please login to add to favorites'**
  String get pleaseLoginToFavorite;

  /// No description provided for @couldNotOpenWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Could not open WhatsApp'**
  String get couldNotOpenWhatsapp;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get somethingWentWrong;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noPropertiesFound.
  ///
  /// In en, this message translates to:
  /// **'No properties found'**
  String get noPropertiesFound;

  /// No description provided for @newListing.
  ///
  /// In en, this message translates to:
  /// **'New Listing'**
  String get newListing;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;

  /// No description provided for @gridView.
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get gridView;

  /// No description provided for @boostYourProperty.
  ///
  /// In en, this message translates to:
  /// **'Boost Your Property'**
  String get boostYourProperty;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @homeLoan.
  ///
  /// In en, this message translates to:
  /// **'Home Loan'**
  String get homeLoan;

  /// No description provided for @homeLoanCaption.
  ///
  /// In en, this message translates to:
  /// **'Need a home Loan Raise a\nRequest'**
  String get homeLoanCaption;

  /// No description provided for @interiorDesign.
  ///
  /// In en, this message translates to:
  /// **'Interior Design'**
  String get interiorDesign;

  /// No description provided for @interiorDesignCaption.
  ///
  /// In en, this message translates to:
  /// **'Design your dream home\nRaise a Request'**
  String get interiorDesignCaption;

  /// No description provided for @failedToLoadRequests.
  ///
  /// In en, this message translates to:
  /// **'Failed to load requests'**
  String get failedToLoadRequests;

  /// No description provided for @noRequestsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No requests available. Be the first to create one!'**
  String get noRequestsAvailable;

  /// No description provided for @noRequestsInCategory.
  ///
  /// In en, this message translates to:
  /// **'No requests available for category: {category}'**
  String noRequestsInCategory(String category);

  /// No description provided for @deleteRequest.
  ///
  /// In en, this message translates to:
  /// **'Delete Request'**
  String get deleteRequest;

  /// No description provided for @deleteRequestConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this request?'**
  String get deleteRequestConfirm;

  /// No description provided for @noSalesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No sales available'**
  String get noSalesAvailable;

  /// No description provided for @noServicesFound.
  ///
  /// In en, this message translates to:
  /// **'No services found'**
  String get noServicesFound;

  /// No description provided for @deleteService.
  ///
  /// In en, this message translates to:
  /// **'Delete Service'**
  String get deleteService;

  /// No description provided for @deleteServiceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this service?'**
  String get deleteServiceConfirm;

  /// No description provided for @addedToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addedToFavorites;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @boostYourPropertyTitle.
  ///
  /// In en, this message translates to:
  /// **'Boost Your Property'**
  String get boostYourPropertyTitle;

  /// No description provided for @createBannerAdButton.
  ///
  /// In en, this message translates to:
  /// **'Create Banner Ad'**
  String get createBannerAdButton;

  /// No description provided for @topAds.
  ///
  /// In en, this message translates to:
  /// **'Top Ads'**
  String get topAds;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @started.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get started;

  /// No description provided for @expires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get expires;

  /// No description provided for @like.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get like;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @pleaseLoginToLikePosts.
  ///
  /// In en, this message translates to:
  /// **'Please login to like posts'**
  String get pleaseLoginToLikePosts;

  /// No description provided for @noReelsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No reels available'**
  String get noReelsAvailable;

  /// No description provided for @searchReels.
  ///
  /// In en, this message translates to:
  /// **'Search reels...'**
  String get searchReels;

  /// No description provided for @promoted.
  ///
  /// In en, this message translates to:
  /// **'Promoted'**
  String get promoted;

  /// No description provided for @boost.
  ///
  /// In en, this message translates to:
  /// **'Boost'**
  String get boost;

  /// No description provided for @contactOwner.
  ///
  /// In en, this message translates to:
  /// **'Contact Owner'**
  String get contactOwner;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @contactNumberNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Contact number not available'**
  String get contactNumberNotAvailable;

  /// No description provided for @less.
  ///
  /// In en, this message translates to:
  /// **'less'**
  String get less;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get more;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @expiresReel.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get expiresReel;

  /// No description provided for @marketPriceTracker.
  ///
  /// In en, this message translates to:
  /// **'Market Price Tracker'**
  String get marketPriceTracker;

  /// No description provided for @refreshTrends.
  ///
  /// In en, this message translates to:
  /// **'Refresh Trends'**
  String get refreshTrends;

  /// No description provided for @buildingInsights.
  ///
  /// In en, this message translates to:
  /// **'Building Insights'**
  String get buildingInsights;

  /// No description provided for @expertGuidance.
  ///
  /// In en, this message translates to:
  /// **'Expert Guidance'**
  String get expertGuidance;

  /// No description provided for @smartDecisions.
  ///
  /// In en, this message translates to:
  /// **'Smart Decisions'**
  String get smartDecisions;

  /// No description provided for @smartDecisionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Material prices & expert insights.'**
  String get smartDecisionsSubtitle;

  /// No description provided for @costEstimator.
  ///
  /// In en, this message translates to:
  /// **'Cost Estimator'**
  String get costEstimator;

  /// No description provided for @qualityGuide.
  ///
  /// In en, this message translates to:
  /// **'Quality Guide'**
  String get qualityGuide;

  /// No description provided for @vastuTips.
  ///
  /// In en, this message translates to:
  /// **'Vastu Tips'**
  String get vastuTips;

  /// No description provided for @contractors.
  ///
  /// In en, this message translates to:
  /// **'Contractors'**
  String get contractors;

  /// No description provided for @materialMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Material Marketplace'**
  String get materialMarketplace;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Wholesale prices coming soon!'**
  String get comingSoon;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer: These building insights are collected from various internet sources and may be right or wrong. Please verify with a professional before making construction decisions.'**
  String get disclaimer;

  /// No description provided for @similarProperties.
  ///
  /// In en, this message translates to:
  /// **'Similar Properties'**
  String get similarProperties;

  /// No description provided for @requestsFilter.
  ///
  /// In en, this message translates to:
  /// **'Requests Filter'**
  String get requestsFilter;

  /// No description provided for @categoryType.
  ///
  /// In en, this message translates to:
  /// **'Category Type'**
  String get categoryType;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @feedsFilter.
  ///
  /// In en, this message translates to:
  /// **'Feeds Filter'**
  String get feedsFilter;

  /// No description provided for @salesFilter.
  ///
  /// In en, this message translates to:
  /// **'Projects Filter'**
  String get salesFilter;

  /// No description provided for @servicesFilter.
  ///
  /// In en, this message translates to:
  /// **'Services Filter'**
  String get servicesFilter;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @minRating.
  ///
  /// In en, this message translates to:
  /// **'Min Rating'**
  String get minRating;

  /// No description provided for @minimumRating.
  ///
  /// In en, this message translates to:
  /// **'Minimum Rating'**
  String get minimumRating;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// No description provided for @myPosts.
  ///
  /// In en, this message translates to:
  /// **'My Posts'**
  String get myPosts;

  /// No description provided for @noPostsYet.
  ///
  /// In en, this message translates to:
  /// **'No posts yet'**
  String get noPostsYet;

  /// No description provided for @myServices.
  ///
  /// In en, this message translates to:
  /// **'My Services'**
  String get myServices;

  /// No description provided for @myReels.
  ///
  /// In en, this message translates to:
  /// **'My Reels'**
  String get myReels;

  /// No description provided for @myRequests.
  ///
  /// In en, this message translates to:
  /// **'My Requests'**
  String get myRequests;

  /// No description provided for @bannerPromotions.
  ///
  /// In en, this message translates to:
  /// **'Banner Promotions'**
  String get bannerPromotions;

  /// No description provided for @myFavourites.
  ///
  /// In en, this message translates to:
  /// **'My Favourites'**
  String get myFavourites;

  /// No description provided for @deleteCompany.
  ///
  /// In en, this message translates to:
  /// **'Delete Company'**
  String get deleteCompany;

  /// No description provided for @deleteCompanyConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your company? This action cannot be undone.'**
  String get deleteCompanyConfirm;

  /// No description provided for @myFeedbacks.
  ///
  /// In en, this message translates to:
  /// **'My Feedbacks'**
  String get myFeedbacks;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @postedBy.
  ///
  /// In en, this message translates to:
  /// **'Posted By'**
  String get postedBy;

  /// No description provided for @writeReview.
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get writeReview;

  /// No description provided for @tellUsExperience.
  ///
  /// In en, this message translates to:
  /// **'Tell us Your Experience'**
  String get tellUsExperience;

  /// No description provided for @createReview.
  ///
  /// In en, this message translates to:
  /// **'Create Review'**
  String get createReview;

  /// No description provided for @yourReview.
  ///
  /// In en, this message translates to:
  /// **'Your Review'**
  String get yourReview;

  /// No description provided for @independentHouse.
  ///
  /// In en, this message translates to:
  /// **'Independent House'**
  String get independentHouse;

  /// No description provided for @villa.
  ///
  /// In en, this message translates to:
  /// **'Villa'**
  String get villa;

  /// No description provided for @villas.
  ///
  /// In en, this message translates to:
  /// **'Villas'**
  String get villas;

  /// No description provided for @apartment.
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartment;

  /// No description provided for @apartments.
  ///
  /// In en, this message translates to:
  /// **'Apartments'**
  String get apartments;

  /// No description provided for @flats.
  ///
  /// In en, this message translates to:
  /// **'Flats'**
  String get flats;

  /// No description provided for @apartmentFlat.
  ///
  /// In en, this message translates to:
  /// **'Apartment Flat'**
  String get apartmentFlat;

  /// No description provided for @openPlot.
  ///
  /// In en, this message translates to:
  /// **'Open Plot'**
  String get openPlot;

  /// No description provided for @openPlots.
  ///
  /// In en, this message translates to:
  /// **'Open Plots'**
  String get openPlots;

  /// No description provided for @agricultureLand.
  ///
  /// In en, this message translates to:
  /// **'Agriculture Land'**
  String get agricultureLand;

  /// No description provided for @commercial.
  ///
  /// In en, this message translates to:
  /// **'Commercial'**
  String get commercial;

  /// No description provided for @industrial.
  ///
  /// In en, this message translates to:
  /// **'Industrial'**
  String get industrial;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sell;

  /// No description provided for @rent.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get rent;

  /// No description provided for @lease.
  ///
  /// In en, this message translates to:
  /// **'Lease'**
  String get lease;

  /// No description provided for @sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// No description provided for @sale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get sale;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @loan.
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get loan;

  /// No description provided for @realEstate.
  ///
  /// In en, this message translates to:
  /// **'Real estate'**
  String get realEstate;

  /// No description provided for @plots.
  ///
  /// In en, this message translates to:
  /// **'Plots'**
  String get plots;

  /// No description provided for @sand.
  ///
  /// In en, this message translates to:
  /// **'Sand'**
  String get sand;

  /// No description provided for @rocks.
  ///
  /// In en, this message translates to:
  /// **'Rocks'**
  String get rocks;

  /// No description provided for @steel.
  ///
  /// In en, this message translates to:
  /// **'Steel'**
  String get steel;

  /// No description provided for @cement.
  ///
  /// In en, this message translates to:
  /// **'Cement'**
  String get cement;

  /// No description provided for @buildingMaterialSupply.
  ///
  /// In en, this message translates to:
  /// **'Building Material Supply'**
  String get buildingMaterialSupply;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @documentVerification.
  ///
  /// In en, this message translates to:
  /// **'Document Verification'**
  String get documentVerification;

  /// No description provided for @advocate.
  ///
  /// In en, this message translates to:
  /// **'Advocate'**
  String get advocate;

  /// No description provided for @constructionContractor.
  ///
  /// In en, this message translates to:
  /// **'Construction Contractor'**
  String get constructionContractor;

  /// No description provided for @propertyValuation.
  ///
  /// In en, this message translates to:
  /// **'Property valuation'**
  String get propertyValuation;

  /// No description provided for @leasing.
  ///
  /// In en, this message translates to:
  /// **'Leasing'**
  String get leasing;

  /// No description provided for @house.
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get house;

  /// No description provided for @land.
  ///
  /// In en, this message translates to:
  /// **'Land'**
  String get land;

  /// No description provided for @construction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get construction;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
