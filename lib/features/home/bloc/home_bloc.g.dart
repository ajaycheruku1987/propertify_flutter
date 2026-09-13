// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      homeIndex: (json['homeIndex'] as num?)?.toInt() ?? 0,
      bottomNavIndex: (json['bottomNavIndex'] as num?)?.toInt() ?? 0,
      showAddButton: json['showAddButton'] as bool? ?? false,
      currentLat: (json['currentLat'] as num?)?.toDouble() ?? 0.0,
      currentLng: (json['currentLng'] as num?)?.toDouble() ?? 0.0,
      currentCity: json['currentCity'] as String? ?? '',
      currentState: json['currentState'] as String? ?? '',
      currentVillage: json['currentVillage'] as String? ?? '',
      activeFeedsFilter: json['activeFeedsFilter'] as Map<String, dynamic>?,
      activeServicesFilter:
          json['activeServicesFilter'] as Map<String, dynamic>?,
      activeRequestsFilter:
          json['activeRequestsFilter'] as Map<String, dynamic>?,
      activeSalesFilter: json['activeSalesFilter'] as Map<String, dynamic>?,
      searchQuery: json['searchQuery'] as String? ?? '',
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'homeIndex': instance.homeIndex,
      'bottomNavIndex': instance.bottomNavIndex,
      'showAddButton': instance.showAddButton,
      'currentLat': instance.currentLat,
      'currentLng': instance.currentLng,
      'currentCity': instance.currentCity,
      'currentState': instance.currentState,
      'currentVillage': instance.currentVillage,
      'activeFeedsFilter': instance.activeFeedsFilter,
      'activeServicesFilter': instance.activeServicesFilter,
      'activeRequestsFilter': instance.activeRequestsFilter,
      'activeSalesFilter': instance.activeSalesFilter,
      'searchQuery': instance.searchQuery,
    };
