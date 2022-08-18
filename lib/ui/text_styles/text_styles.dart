import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';
import 'package:yc_app_utils/ui/text_styles/yc_fonts.dart';

class TextStyles {
  static const Map<TStyle, TextStyle> mobTextStyle = {
    TStyle.H1_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H1_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H1_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H1_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.RH3_700: TextStyle(
      fontFamily: 'Roboto-Slab',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_800: TextStyle(
      fontFamily: YCFonts.nunitoExtraBold,
      fontSize: 8,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 8,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 8,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 8,
      color: AppColors.cBODY_TEXT,
    ),
  };

  static const Map<TStyle, TextStyle> tabTextStyle = {
    TStyle.H1_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 32,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H1_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 32,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H1_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 32,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H2_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 28,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.RH3_700: TextStyle(
      fontFamily: YCFonts.robotoSlab,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H3_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 24,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H4_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 20,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.H5_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 18,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B1_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 16,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B2_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 14,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B3_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 12,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_700: TextStyle(
      fontFamily: YCFonts.nunitoBold,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_600: TextStyle(
      fontFamily: YCFonts.nunitoSemiBold,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
    TStyle.B4_400: TextStyle(
      fontFamily: YCFonts.nunitoRegular,
      fontSize: 10,
      color: AppColors.cBODY_TEXT,
    ),
  };
}
