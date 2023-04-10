import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hsca/common/constant/color_constants.dart';
import 'package:hsca/common/constant/text_style_common.dart';
import 'package:injectable/injectable.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shimmer/shimmer.dart';

import '../router/router.gr.dart';

@lazySingleton
class DialogService {
  final AppRouter _router;

  DialogService(this._router);

  ProgressDialog? _pr;
  CustomProgressDialog? _cpr;

  BuildContext _getSafeContext() {
    final context = _router.navigatorKey.currentContext;
    return context != null
        ? context
        : throw ('Have you forgot to setup routes?');
  }

  // Future<void> show(
  //     {String? title,
  //       String? message,
  //       String? okLabel,
  //       bool isDismissible = true,
  //       VoidCallback? onOkBtnPressed}) async {
  //   SchedulerBinding.instance!.addPostFrameCallback((_) async {
  //     return await showOkAlertDialog(
  //         context: _getSafeContext(),
  //         title: title,
  //         message: message,
  //         okLabel: okLabel,
  //         barrierDismissible: isDismissible)
  //         .then((value) {
  //       if (value == OkCancelResult.ok) onOkBtnPressed?.call();
  //     });
  //   });
  // }

  // Future<void> confirm(
  //     {String? title,
  //       String? message,
  //       String okButton = 'Yes',
  //       String cancelButton = 'No',
  //       VoidCallback? onPositiveBtnPressed,
  //       VoidCallback? onNegativeBtnPressed}) async {
  //   SchedulerBinding.instance!.addPostFrameCallback((_) async {
  //     return await showOkCancelAlertDialog(
  //         context: _getSafeContext(),
  //         title: title,
  //         message: message,
  //         okLabel: okButton,
  //         cancelLabel: cancelButton)
  //         .then((value) {
  //       if (value == OkCancelResult.ok)
  //         onPositiveBtnPressed?.call();
  //       else
  //         onNegativeBtnPressed?.call();
  //     });
  //   });
  // }

  void showLoader({String? message}) {
    if (message == null) {
      _cpr = CustomProgressDialog(_getSafeContext(),
          loadingWidget: Container(
            padding: const EdgeInsets.all(20),
            // child: AppProgressIndicator(),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: const CircularProgressIndicator(color: Colors.grey),
          ),
          dismissable: true
      );
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _cpr!.show();
      });
    } else {
      _pr = ProgressDialog(_getSafeContext(),
          title: null,
          dialogStyle: DialogStyle(
            borderRadius: BorderRadius.circular(10.0),
            backgroundColor: Colors.white,
            elevation: 10.0,
          ),
          // defaultLoadingWidget: AppProgressIndicator(),
          message: Text(message),
          dismissable: true
      );
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _pr!.show();
      });
    }
  }

  void hideLoader() {
    if (_pr?.isShowed ?? false) {
      _pr?.dismiss();
    }
    if (_cpr?.isShowed ?? false) {
      _cpr?.dismiss();
    }
  }


  Widget shimmerEffectUIWidget(BuildContext context){
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 30.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }

}

viewLoader() {
  return const Center(
    child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(color: ColorConstants.themeColor),
        )),
  );
}



