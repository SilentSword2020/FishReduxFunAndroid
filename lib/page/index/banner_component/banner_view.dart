import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 10),
        color: ColorConf.ColorF6f6f6,
        child: Swiper(
          viewportFraction: 0.88,
          scale: 0.95,
          duration: 800,
          transformer: ScaleAndFadeTransformer(),
          autoplay: state.bannerDataSource.isNotEmpty,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            '${state.bannerDataSource[index].imagePath}'))),
                margin: const EdgeInsets.all(8),
              ),
              onTap: () {
                dispatch(BannerActionCreator.onToWebView({
                  'url': state.bannerDataSource[index]?.url,
                  'title': state.bannerDataSource[index]?.title,
                  'id': -1
                }));
              },
            );
          },
          itemCount: state.bannerDataSource.length,
        ),
        height: 180,
      ),
      // Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(colors: <Color>[
      //     Color(0xff18C8A1),
      //     Color(0XFF7EE3B8),
      //   ])),
      //   padding: const EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
      //   child: state.loginStatus == null || !state.loginStatus
      //       ? GestureDetector(
      //           child: Container(
      //             alignment: Alignment.centerLeft,
      //             child: Text(
      //               '点击登录',
      //               style: TextStyle(fontSize: 13, color: Colors.white),
      //             ),
      //           ),
      //           onTap: () {
      //             dispatch(BannerActionCreator.onToLogin());
      //           },
      //         )
      //       : GestureDetector(
      //           child: Row(
      //             children: <Widget>[
      //               Text(
      //                 '您的积分：${state.userPoint}',
      //                 style: TextStyle(fontSize: 13, color: Colors.white),
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   alignment: Alignment.centerRight,
      //                   child: Text(
      //                     '获取记录',
      //                     style: TextStyle(fontSize: 13, color: Colors.white),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //           onTap: () {
      //             dispatch(BannerActionCreator.onToPointPage());
      //           },
      //         ),
      // )
    ],
  );
}
