import 'package:ecommerce_final_task/common/constans/colors.dart';
import 'package:ecommerce_final_task/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/product/product_bloc.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/promotion/promotion_bloc.dart';
import 'package:ecommerce_final_task/presentation/splash_page.dart';
import 'package:ecommerce_final_task/presentation/voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/cart/bloc/cart/cart_bloc.dart';
import 'presentation/cart/bloc/list_cart/cart_list_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.brandColor,
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //auth
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),

        //promotion
        BlocProvider(
          create: (context) =>
              PromotionBloc()..add(const PromotionEvent.getAllPromotions()),
        ),
        BlocProvider(
          create: (context) => PromotionByIdBloc()
            ..add(const PromotionByIdEvent.getPromotionById(0)),
        ),

        //product
        BlocProvider(
          create: (context) =>
              ProductBloc()..add(const ProductEvent.getAllProducts()),
        ),

        //user_address
        BlocProvider(
          create: (context) => UserAddressBloc(),
        ),

        //util
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => CartListBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
