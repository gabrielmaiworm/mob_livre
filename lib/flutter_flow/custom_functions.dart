import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/supabase/supabase.dart';
import '../../auth/auth_util.dart';

bool validaNumeros(String password) {
  if (password.contains(new RegExp(r'[0-9]'))) {
    return true;
  } else {
    return false;
  }
}

bool validaUpperCase(String password) {
  if (password.contains(new RegExp(r'[A-Z]'))) {
    return true;
  } else {
    return false;
  }
}

bool validaLowerCase(String password) {
  if (password.contains(new RegExp(r'[a-z]'))) {
    return true;
  } else {
    return false;
  }
}

bool validaSpecialCharecters(String password) {
  if (password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return true;
  } else {
    return false;
  }
}

bool validaMinLength(String password) {
  if (password.length > 8) {
    return true;
  } else {
    return false;
  }
}

bool validaPasswordMatch(
  String password,
  String passwordTwo,
) {
  if (password == passwordTwo && password.length > 8) {
    return true;
  } else {
    return false;
  }
}

LatLng? transformPosition(
  String? latitude,
  String? longitude,
) {
  // transforma latitude and longitude string in one location LatLng
  if ((latitude == null) || (longitude == null)) {
    return null;
  } else {
    try {
      final latlng = LatLng(double.parse(latitude), double.parse(longitude));
      return latlng;
    } catch (e) {
      return null;
    }
  }
}

String formatDateTime(String date) {
  DateTime parseDate = DateTime.parse(date);
  DateFormat format = DateFormat('dd/MM/yyyy');
  String formatedDate = format.format(parseDate);
  return formatedDate;
}

List<LatLng>? parseLatLng(
  List<dynamic> latitude,
  List<dynamic> longitude,
) {
  if ((latitude == null) | (longitude == null)) {
    return null;
  } else {
    var latlngs = <LatLng>[];
    for (var i = 0; i < latitude.length; i++) {
      latlngs.add(LatLng(latitude[i], longitude[i]));
    }
    return latlngs;
  }
}

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}
