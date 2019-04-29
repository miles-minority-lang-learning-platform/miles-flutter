import 'package:flutter/material.dart';
import 'tomato-agency/agency.dart';
import 'tomato-agency/confirm_solo.dart';
import 'tomato-agency/confirm_multi.dart';
import 'tomato-agency/keep_focus.dart';
import 'tomato-agency/tomato_period_solo.dart';
import 'tomato-agency/failed.dart';
import 'tomato-agency/gived_up.dart';
import 'tomato-agency/succeeded.dart';
import 'tomato-agency/result.dart';

routes(BuildContext context) => {
      "/tomato": (context) => AgencyPage(),
      "/tomato/solo": (context) => ConfirmSoloPage(),
      "/tomato/multi": (context) => ConfirmMultiPage(),
      "/tomato/focus": (context) => KeepFocusPage(),
      "/tomato/solo/period": (context) => TomatoPeriodSoloPage(),
      "/tomato/failed": (context) => FailedPage(),
      "/tomato/gived_up": (context) => GivedUp(),
      "/tomato/succeeded": (context) => SucceededPage(),
      "/tomato/result": (context) => ResultPage(),
      
    };
