// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:arakawa/bean/article_list_entity.dart';
import 'package:arakawa/bean/banner_entity.dart';
import 'package:arakawa/bean/hot_key_bean_entity.dart';
import 'package:arakawa/bean/search_result_entity.dart';
import 'package:arakawa/generated/json/article_list_entity_helper.dart';
import 'package:arakawa/generated/json/banner_entity_helper.dart';
import 'package:arakawa/generated/json/hot_key_bean_entity_helper.dart';
import 'package:arakawa/generated/json/search_result_entity_helper.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case ArticleListEntity:
        return articleListEntityFromJson(data as ArticleListEntity, json) as T;
      case ArticleListData:
        return articleListDataFromJson(data as ArticleListData, json) as T;
      case ArticleListDataData:
        return articleListDataDataFromJson(data as ArticleListDataData, json)
            as T;
      case HotKeyBeanEntity:
        return hotKeyBeanEntityFromJson(data as HotKeyBeanEntity, json) as T;
      case HotKeyBeanData:
        return hotKeyBeanDataFromJson(data as HotKeyBeanData, json) as T;
      case SearchResultEntity:
        return searchResultEntityFromJson(data as SearchResultEntity, json)
            as T;
      case SearchResultData:
        return searchResultDataFromJson(data as SearchResultData, json) as T;
      case BannerEntity:
        return bannerEntityFromJson(data as BannerEntity, json) as T;
      case BannerData:
        return bannerDataFromJson(data as BannerData, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case ArticleListEntity:
        return articleListEntityToJson(data as ArticleListEntity);
      case ArticleListData:
        return articleListDataToJson(data as ArticleListData);
      case ArticleListDataData:
        return articleListDataDataToJson(data as ArticleListDataData);
      case HotKeyBeanEntity:
        return hotKeyBeanEntityToJson(data as HotKeyBeanEntity);
      case HotKeyBeanData:
        return hotKeyBeanDataToJson(data as HotKeyBeanData);
      case SearchResultEntity:
        return searchResultEntityToJson(data as SearchResultEntity);
      case SearchResultData:
        return searchResultDataToJson(data as SearchResultData);
      case BannerEntity:
        return bannerEntityToJson(data as BannerEntity);
      case BannerData:
        return bannerDataToJson(data as BannerData);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'ArticleListEntity':
        return ArticleListEntity().fromJson(json);
      case 'ArticleListData':
        return ArticleListData().fromJson(json);
      case 'ArticleListDataData':
        return ArticleListDataData().fromJson(json);
      case 'HotKeyBeanEntity':
        return HotKeyBeanEntity().fromJson(json);
      case 'HotKeyBeanData':
        return HotKeyBeanData().fromJson(json);
      case 'SearchResultEntity':
        return SearchResultEntity().fromJson(json);
      case 'SearchResultData':
        return SearchResultData().fromJson(json);
      case 'BannerEntity':
        return BannerEntity().fromJson(json);
      case 'BannerData':
        return BannerData().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'ArticleListEntity':
        return List<ArticleListEntity>();
      case 'ArticleListData':
        return List<ArticleListData>();
      case 'ArticleListDataData':
        return List<ArticleListDataData>();
      case 'HotKeyBeanEntity':
        return List<HotKeyBeanEntity>();
      case 'HotKeyBeanData':
        return List<HotKeyBeanData>();
      case 'SearchResultEntity':
        return List<SearchResultEntity>();
      case 'SearchResultData':
        return List<SearchResultData>();
      case 'BannerEntity':
        return List<BannerEntity>();
      case 'BannerData':
        return List<BannerData>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
