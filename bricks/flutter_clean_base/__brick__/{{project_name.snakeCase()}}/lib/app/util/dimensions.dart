{{#screen_util}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/screen_util}}

class Dimensions {
{{#screen_util}} static final delimiterH10 = 10.h;{{/screen_util}}
{{^screen_util}} static const delimiterH10 = 10.0;{{/screen_util}}

  const Dimensions._();
}
