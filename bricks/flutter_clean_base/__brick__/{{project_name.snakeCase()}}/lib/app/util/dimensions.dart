{{^web_only}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/web_only}}

final class Dimensions {
{{^web_only}} static final delimiterH10 = 10.h;{{/web_only}}
{{#web_only}} static final delimiterH10 = 10.0;{{/web_only}}

  const Dimensions._();
}
