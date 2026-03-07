

import 'package:go_router/go_router.dart';

void customNavigate(context, String path, ) {
  GoRouter.of(context).push(path,);
}

void customNavigatepushReplacement(context, String path, )async {
 await Future.delayed(Duration(seconds: 2));
  GoRouter.of(context).pushReplacement(path,);
}