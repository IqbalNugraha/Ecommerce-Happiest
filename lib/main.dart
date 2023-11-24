import 'package:ecommerce_final_task/common/constans/colors.dart';
import 'package:ecommerce_final_task/presentation/auth/bloc/login/login_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/add_address/add_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/address_by_default/address_by_default_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/edit_address/edit_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/order/order_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/shipping_cost/shipping_cost_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/product/product_bloc.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/promotion/promotion_bloc.dart';
import 'package:ecommerce_final_task/presentation/payment/bloc/order_detail/order_detail_bloc.dart';
import 'package:ecommerce_final_task/presentation/splash_page.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/city/city_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/province/province_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:ecommerce_final_task/presentation/voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/cart/bloc/cart/cart_bloc.dart';
import 'presentation/cart/bloc/list_cart/cart_list_bloc.dart';
import 'presentation/user_address/bloc/raja_ongkir/raja_ongkir_bloc.dart';

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
        BlocProvider(
          create: (context) => AddressByDefaultBloc(),
        ),
        BlocProvider(
          create: (context) => RajaOngkirBloc(),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(),
        ),
        BlocProvider(
          create: (context) => CityBloc(),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(),
        ),
        BlocProvider(
          create: (context) => ShippingCostBloc(),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(),
        ),
        BlocProvider(
          create: (context) => EditAddressBloc(),
        ),

        //order
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(),
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
