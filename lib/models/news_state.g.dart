// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsState _$_$_NewsStateFromJson(Map<String, dynamic> json) {
  return _$_NewsState(
    categoryNames: (json['categoryNames'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    articles: (json['articles'] as List<dynamic>)
        .map((e) => CategoryArticles.fromJson(e))
        .toList(),
    currentTabIndex: json['currentTabIndex'] as int,
    isRefreshing: json['isRefreshing'] as bool,
  );
}

Map<String, dynamic> _$_$_NewsStateToJson(_$_NewsState instance) =>
    <String, dynamic>{
      'categoryNames': instance.categoryNames,
      'articles': instance.articles.map((e) => e.toJson()).toList(),
      'currentTabIndex': instance.currentTabIndex,
      'isRefreshing': instance.isRefreshing,
    };
