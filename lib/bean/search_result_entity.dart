import 'package:arakawa/bean/article_list_entity.dart';
import 'package:arakawa/generated/json/base/json_convert_content.dart';

class SearchResultEntity with JsonConvert<SearchResultEntity> {
	SearchResultData data;
	int errorCode;
	String errorMsg;
}

class SearchResultData with JsonConvert<SearchResultData> {
	int curPage;
	List<ArticleListDataData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

