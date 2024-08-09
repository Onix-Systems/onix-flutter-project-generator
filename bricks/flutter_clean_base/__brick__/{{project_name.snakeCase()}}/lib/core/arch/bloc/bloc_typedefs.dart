import 'package:flutter/material.dart';

typedef ListenDelegate<S> = void Function(BuildContext context, S state);
typedef StateListener<S> = Widget Function(S state);
typedef SingleResultListener<SR> = void Function(
  BuildContext context,
  SR singleResult,
);
