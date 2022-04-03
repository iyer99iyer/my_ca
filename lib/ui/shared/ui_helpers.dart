import 'package:flutter/material.dart';

import 'dart:ui';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0,);
const Widget horizontalSpaceSmall = SizedBox(width: 8.0,);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0,);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0,);
const Widget horizontalSpaceLarge = SizedBox(width: 42.0,);

const Widget verticalSpaceTiny = SizedBox(height: 5.0,);
const Widget verticalSpaceSmall = SizedBox(height: 8.0,);
const Widget verticalSpaceRegular = SizedBox(height: 18.0,);
const Widget verticalSpaceMedium = SizedBox(height: 25.0,);
const Widget verticalSpaceLarge = SizedBox(height: 42.0,);

var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;