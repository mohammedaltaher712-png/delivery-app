import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/constant/AppImages.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
          color: Colors.white,
          child: Center(
            child: Lottie.asset(Appimages.loading, width: 250, height: 250),
          ),
        )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
          child: Lottie.asset(Appimages.offline, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(Appimages.server, width: 250, height: 250))
        : statusRequest == StatusRequest.failure
        ? Center(
          child: Lottie.asset(
            Appimages.nodata,
            width: 250,
            height: 250,
            repeat: true,
          ),
        )
        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
          child: Lottie.asset(Appimages.loading, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
          child: Lottie.asset(Appimages.offline, width: 250, height: 250),
        )
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Lottie.asset(Appimages.server, width: 250, height: 250))
        : widget;
  }
}
