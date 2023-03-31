{{#isGoRouter}}import 'package:go_router/go_router.dart';{{/isGoRouter}}
{{^isGoRouter}}import 'package:auto_route/auto_route.dart';
import 'package:{{project_name}}/core/router/app_router.dart';{{/isGoRouter}}
import 'package:{{project_name}}/app/bloc/app_bloc_imports.dart';
import 'package:{{project_name}}/core/arch/bloc/base_block_state.dart';
import 'package:{{project_name}}/core/arch/widget/common/misk.dart';
import 'package:{{project_name}}/presentation/screen/splash/bloc/splash_bloc_imports.dart';
import 'package:{{project_name}}/util/dimensions.dart';
{{#theme_generate}}import 'package:{{project_name}}/presentation/style/theme/theme_imports.dart';{{/theme_generate}}
{{^theme_generate}}import 'package:{{project_name}}/presentation/style/theme/theme_extension/ext.dart';{{/theme_generate}}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
{{^web_only}}import 'package:flutter_screenutil/flutter_screenutil.dart';{{/web_only}}

{{^isGoRouter}}@RoutePage(){{/isGoRouter}}
class SplashScreen extends StatefulWidget {
const SplashScreen({
super.key,
});

@override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState
extends BaseState<SplashScreenState, SplashBloc, SplashSR, SplashScreen> {
@override
Widget buildWidget(BuildContext context) {
return srObserver(
context: context,
child: Scaffold(
backgroundColor: context.themeColors.backgroundColor,
body: SizedBox.expand(
child: blocConsumer(
stateListener: (state) => _buildMainContainer(context, state),
),
),
),
onSR: _onSingleResult,
);
}

AppBloc _appBlocOf(BuildContext context) => BlocProvider.of<AppBloc>(context);

void _onSingleResult(BuildContext context, SplashSR singleResult) {
singleResult.when(
loadFinished: () {
{{^isGoRouter}}context.replaceRoute(const HomeRoute());{{/isGoRouter}}
{{#isGoRouter}}context.go('/home');{{/isGoRouter}}
},
);
}

Widget _buildMainContainer(
BuildContext context,
SplashScreenState _,
) {
final button18 = context.themeTextStyles.button18;
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'Splash screen',
style: context.themeTextStyles.fs28,
),
Delimiter.height(Dimensions.delimiterH10),
Text(
'Auto navigate next after 20 seconds',
style: context.themeTextStyles.bodyText16,
),
Delimiter.height(Dimensions.delimiterH10),
OutlinedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(
context.themeColors.buttonColor,
),
),
onPressed: () {
{{^isGoRouter}}context.replaceRoute(const HomeRoute());{{/isGoRouter}}
{{#isGoRouter}}context.go('/home');{{/isGoRouter}}
},
child: Text(
'Navigate Next',
style: button18,
),
),
Delimiter.height(Dimensions.delimiterH10),
OutlinedButton(
onPressed: () {
_appBlocOf(context)
    .add(const AppEvent.changeTheme(ThemeMode.dark));
},
child: Text(
'Theme dark',
style: button18,
),
),
Delimiter.height(Dimensions.delimiterH10),
OutlinedButton(
onPressed: () {
_appBlocOf(context)
    .add(const AppEvent.changeTheme(ThemeMode.light));
},
child: Text(
'Theme light',
style: button18,
),
),
Delimiter.height(Dimensions.delimiterH10),
OutlinedButton(
onPressed: () {
_appBlocOf(context)
    .add(const AppEvent.changeTheme(ThemeMode.system));
},
child: Text(
'Theme system',
style: button18,
),
),
],
),
);
}
}
