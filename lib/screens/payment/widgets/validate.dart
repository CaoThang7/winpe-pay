import 'package:flutter/material.dart';

String? validAccNo(value) {
  if (value!.isEmpty) {
    return "Bạn chưa điền số tài khoản";
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
    return "Chỉ được nhập số";
  } else {
    return null;
  }
}

String? validMoney(value) {
  if (value!.isEmpty) {
    return "Bạn chưa điền số tiền";
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
    return "Không được chứa chữ và ký tự đặc biệt";
  } else {
    return null;
  }
}

String? validContent(value) {
  if (value!.isEmpty) {
    return "Bạn chưa điền nội dung";
  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
    return "Không được chứa số và ký tự đặc biệt";
  } else if (value!.length > 25) {
    return "Nội dung quá dài";
  } else {
    return null;
  }
}
