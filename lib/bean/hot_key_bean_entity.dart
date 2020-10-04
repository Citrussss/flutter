import 'package:arakawa/generated/json/base/json_convert_content.dart';

class HotKeyBeanEntity with JsonConvert<HotKeyBeanEntity> {
	List<HotKeyBeanData> data;
	int errorCode;
	String errorMsg;
}

class HotKeyBeanData with JsonConvert<HotKeyBeanData> {
	int id;
	String link;
	String name;
	int order;
	int visible;
}
