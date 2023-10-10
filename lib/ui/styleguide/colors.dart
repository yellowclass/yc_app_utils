import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static Color parseStringToColor(String? str) {
    if (str == null) {
      return AppColors.cBLACK;
    }
    var hexColor = str.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return AppColors.cBLACK;
  }

  static Color parseRGBOStringToColor(String str) {
    var rgbColor = str.replaceAll("rgba(", "").replaceAll(")", "");
    // var rgbArray = rgbColor.split(",");
    var rgbRed = rgbColor.split(",")[0];
    var rgbGreen = rgbColor.split(",")[1];
    var rgbBlue = rgbColor.split(",")[2];
    var rgbOpacity = rgbColor.split(",")[3];

    return Color.fromRGBO(int.parse(rgbRed), int.parse(rgbGreen),
        int.parse(rgbBlue), double.parse(rgbOpacity));
  }

  static const Map<String, Color> colors = {
    'A': Color(0xFF5A8770),
    'B': Color(0xFFB2B7BB),
    'C': Color(0xFF6FA9AB),
    'D': Color(0xFFB2AF29),
    'E': Color(0xFF0189B9),
    'F': Color(0xFFF18636),
    'G': Color(0xFFD93A37),
    'H': Color(0xFFA6B12E),
    'I': Color(0xFF5C9BBC),
    'J': Color(0xFFF5898E),
    'K': Color(0xFF9A89B5),
    'L': Color(0xFF5A8770),
    'M': Color(0xFF9988B4),
    'N': Color(0xFF5A8770),
    'O': Color(0xFFD33F33),
    'P': Color(0xFFA2B01F),
    'Q': Color(0xFFFfe126),
    'R': Color(0xFF0188BF),
    'S': Color(0xFFF18636),
    'T': Color(0xFF0087BF),
    'U': Color(0xFFB2B7BB),
    'V': Color(0xFF72ACAE),
    'W': Color(0xFF9C8AB4),
    'X': Color(0xFF5A8770),
    'Y': Color(0xFFEEB424),
    'Z': Color(0xFF407887),
    '0': Color(0xFF0188BF),
    '1': Color(0xFFF18636),
    '2': Color(0xFF0087BF),
    '3': Color(0xFFB2B7BB),
    '4': Color(0xFF72ACAE),
    '5': Color(0xFF9C8AB4),
    '6': Color(0xFF5A8770),
    '7': Color(0xFFEEB424),
    '8': Color(0xFF407887),
    '9': Color(0xFFA2B01F),
  };

  static const List<Color> redGreenDivergentRange_10 = <Color>[
    Color(0xFFff0000),
    Color(0xFFff6a00),
    Color(0xFFfe9b19),
    Color(0xFFfcc54b),
    Color(0xFFfdea80),
    Color(0xFFf5fb8b),
    Color(0xFFdbfb6a),
    Color(0xFFb7fc4a),
    Color(0xFF84fe2a),
    Color(0xFF00ff00),
  ];

  static const Color cGREEN_TEXT = Color(0xFF009955);
  static const Color cGREEN_100 = Color(0xFF00BD90);
  static const Color cGREEN_50 = Color(0xFF8EEAB4);
  static const Color cGREEN_25 = Color(0xFFC2F2E5);
  static const Color cGREEN_15 = Color(0xFFDEF7F2);
  static const Color cGREEN_06 = Color(0xFFF0FBF9);
  static const Color cGREEN_NEON = Color(0xFF0ACE2A);

  static const Color cGREY = Color(0xff81848b);
  static const Color cGREY_25 = Color(0xffDDDEE2);

  static const Color cYELLOW_TEXT = Color(0xFFea9219);
  static const Color cYELLOW_100 = Color(0xFFFFB61E);
  static const Color cYELLOW_50 = Color(0xFFFEDC4D);
  static const Color cYELLOW_25 = Color(0xFFF7DD9A);
  static const Color cYELLOW_15 = Color(0xFFfff6cf);
  static const Color cYELLOW_06 = Color(0xFFfefae9);

  static const Color cPINK_TEXT = Color(0xFFCB2E9C);
  static const Color cPINK_100 = Color(0xFFF180CF);
  static const Color cPINK_50 = Color(0xFFFDC2EB);
  static const Color cPINK_25 = Color(0xFFFFDBFF);
  static const Color cPINK_15 = Color(0xFFFDEFFA);
  static const Color cPINK_06 = Color(0xFFFEF8FC);

  static const Color cPURPLE_TEXT = Color(0xFF4153B9);
  static const Color cPURPLE_100 = Color(0xFF7789EE);
  static const Color cPURPLE_75 = Color(0xFF8fa0ff);
  static const Color cPURPLE_50 = Color(0xFFC5CDFB);
  static const Color cPURPLE_25 = Color(0xFFE1E5FF);
  static const Color cPURPLE_15 = Color(0xFFEEF0FD);
  static const Color cPURPLE_06 = Color(0xFFF7F8FE);

  static const Color cBLUE_TEXT = Color(0xFF187CC9);
  static const Color cBLUE_100 = Color(0xFF2AAAEE);
  static const Color cBLUE_50 = Color(0xFF8ED6FE);
  static const Color cBLUE_25 = Color(0xFFD1EFFF);
  static const Color cBLUE_15 = Color(0xFFE3F5FD);
  static const Color cBLUE_06 = Color(0xFFF3FAFE);

  static const Color cBODY_TEXT = Color(0xFF212A39);
  static const Color cBODY_TEXT_75 = Color(0xFF59606b);
  static const Color cBODY_TEXT_50 = Color(0xFF81848B);
  static const Color cBODY_TEXT_25 = Color(0xFFC7CACD);

  static const Color cBLACK = Color(0xFF000000);
  static const Color cBLACK_40 = Color(0xFF979797);
  static const Color cBLACK_20 = Color(0xFFCECECE);
  static const Color cBLACK_10 = Color(0xFFE8E8E8);
  static const Color cBLACK_05 = Color(0xFFF3F3F3);

  static const Color cWHITE_100 = Color(0xFFFFFFFF);
  static const Color cWHITE_50 = Color(0xFFF9F9F9);

  static const Color cORANGE_TEXT = Color(0xFFEA8731);

  static const Color cORANGE_100 = Color(0xFFFCAB64);
  static const Color cORANGE_50 = Color(0xFFFDD5B1);
  static const Color cORANGE_25 = Color(0xFFFEEAD8);
  static const Color cORANGE_15 = Color(0xFFFFF3E8);
  static const Color cORANGE_06 = Color(0xFFFFF9F3);

  static const Color cTEAL_TEXT = Color(0xFF0E918C);

  static const Color cTEAL_100 = Color(0xFF28ABB9);
  static const Color cTEAL_50 = Color(0xFF93D5DC);
  static const Color cTEAL_25 = Color(0xFFC9EAED);
  static const Color cTEAL_15 = Color(0xFFDFF3F5);
  static const Color cTEAL_06 = Color(0xFFF2FAFB);

  static const Color cRED_15 = Color(0xFFFFDCDC);
  static const Color cRed_25 = Color(0xFFFFBEBE);
  static const Color cRed_100 = Color(0xFFED695F);
  static const Color cRED_TEXT = Color(0xFFCC3E3E);

  static const Color cERROR = Color(0xFFED695F);
  static const Color cERROR_LIGHT = Color(0xFFF8a7a1);
  static const Color cERROR_DARK = Color(0xFFB8463D);

  static const Color cBUTTONS_GREEN_PRESSED = Color(0xFF069F7E);

  static const Color cPURPLE_STARKID_1 = Color(0xFF475EDD);
  static const Color cPURPLE_STARKID_2 = Color(0xFF7960F8);

  //CODE: LG -> LINEAR GRADIENT
  static const Color cPURPLE_TXN_LG_COLOR1 = Color(0xFF451e86);
  static const Color cPURPLE_TXN_LG_COLOR2 = Color(0xFF3f4be5);

  //CODE: GAME-ALERT GRADIENT
  static const Color cGAME_LIGHT_BLUE = Color(0xff1fafff);
  static const Color cGAME_DARK_BLUE = Color(0xff3047ea);
  static const Color cGAME_BLUE_SHADE = Color(0xffcfebf2);

  // LINEAR GRADIENT
  static const Color cNAVY_BLUE_LG_COLOR3 = Color(0xFF100735);

  static const Color cDEFAULT_URGENCY = Color(0xFFE74337);

  static const Color cBUTTONS_GREEN_HOVER = Color(0xFF29C8A2);
  static const Color cSEA_GREEN = Color(0xFF2CBA7C);
  static const Color cMEDIUM_BLUE = Color(0xFF439EF9);
  static const Color cShadow = Color.fromARGB(18, 33, 42, 57);
  static const Color cMISC_SEPARATOR_BLUE = Color(0xFFF4F6FB);
  static const Color cREFERRAL_BLUE_TEXT = Color(0xFF4883ad);
  static const Color cREFERRAL_YELLOW_TEXT = Color(0xFFbb750f);
  static const Color cMUDDY_BROWN = Color(0xFFbb750f);
  static const Color cDividerColor = Color(0xFFdcdcdc);
  static const Color cChatBgColor = Color(0xFF383838);
  static const Color cChatReplyBgColor = Color(0xFF484848);

  static const Color cWHATSAPP_BACKGROUND_COLOR = Color(0x1d41d053);
  static const Color cFACEBOOK_BACKGROUND_COLOR = Color(0x2f83b7f9);
  static const Color cINSTAGRAM_BACKGROUND_COLOR = Color(0x25f85bd3);

  static const Color cPlanet_Transaction_Gradient_1 = Color(0xFF100735);
  static const Color cPlanet_Transaction_Gradient_2 = Color(0xFF1E0B6A);
  static const Color cPlanet_Transaction_Gradient_3 = Color(0xFF4B0694);

  static const Color cGAME_TRANSACTION_HEADER_BG = Color(0xFF3260EF);

  static const Color cTRANSPARENT = Colors.transparent;

  static const Color cTANGERINE_TEXT = Color(0xFFFF6600);
  static const Color cTANGERINE_100 = Color(0xFFFF7100);
  static const Color cTANGERINE_50 = Color(0xFFFF8D33);
  static const Color cTANGERINE_25 = Color(0xFFFFAA66);
  static const Color cTANGERINE_15 = Color(0xFFFFC699);
  static const Color cTANGERINE_06 = Color(0xFFFFE3CC);

  static const Color cDISABLED_COLOR = Color(0xFFB5B5B5);
  static const Color cBLUEBERRY = Color(0xFF3A7EF7);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

var colorsMap = {
  'GREEN': {
    'text': AppColors.cGREEN_TEXT,
    100: AppColors.cGREEN_100,
    50: AppColors.cGREEN_50,
    25: AppColors.cGREEN_25,
    15: AppColors.cGREEN_15,
    06: AppColors.cGREEN_06,
  },
  'YELLOW': {
    'text': AppColors.cYELLOW_TEXT,
    100: AppColors.cYELLOW_100,
    50: AppColors.cYELLOW_50,
    25: AppColors.cYELLOW_25,
    15: AppColors.cYELLOW_15,
    06: AppColors.cYELLOW_06,
  },
  'TEAL': {
    'text': AppColors.cTEAL_TEXT,
    100: AppColors.cTEAL_100,
    50: AppColors.cTEAL_50,
    25: AppColors.cTEAL_25,
    15: AppColors.cTEAL_15,
    06: AppColors.cTEAL_06,
  },
  'PINK': {
    'text': AppColors.cPINK_TEXT,
    100: AppColors.cPINK_100,
    50: AppColors.cPINK_50,
    25: AppColors.cPINK_25,
    15: AppColors.cPINK_15,
    06: AppColors.cPINK_06,
  },
  'ORANGE': {
    'text': AppColors.cORANGE_TEXT,
    100: AppColors.cORANGE_100,
    50: AppColors.cORANGE_50,
    25: AppColors.cORANGE_25,
    15: AppColors.cORANGE_15,
    06: AppColors.cORANGE_06,
  },
  'BLUE': {
    'text': AppColors.cBLUE_TEXT,
    100: AppColors.cBLUE_100,
    50: AppColors.cBLUE_50,
    25: AppColors.cBLUE_25,
    15: AppColors.cBLUE_15,
    06: AppColors.cBLUE_06,
  },
  'PURPLE': {
    'text': AppColors.cPURPLE_TEXT,
    100: AppColors.cPURPLE_100,
    50: AppColors.cPURPLE_50,
    25: AppColors.cPURPLE_25,
    15: AppColors.cPURPLE_15,
    06: AppColors.cPURPLE_06,
  },
};

var categoryColorMapping = {
  "Performing Art": {
    100: AppColors.cGREEN_100,
    50: AppColors.cGREEN_50,
    25: AppColors.cGREEN_25,
    15: AppColors.cGREEN_15,
    06: AppColors.cGREEN_06,
  },
  "Literature": {
    100: AppColors.cPURPLE_100,
    50: AppColors.cPURPLE_50,
    25: AppColors.cPURPLE_25,
    15: AppColors.cPURPLE_15,
    06: AppColors.cPURPLE_06,
  },
  "Visual Art": {
    100: AppColors.cPINK_100,
    50: AppColors.cPINK_50,
    25: AppColors.cPINK_25,
    15: AppColors.cPINK_15,
    06: AppColors.cPINK_06,
  },
  "Brainiac": {
    100: AppColors.cBLUE_100,
    50: AppColors.cBLUE_50,
    25: AppColors.cBLUE_25,
    15: AppColors.cBLUE_15,
    06: AppColors.cBLUE_06,
  },
  "Mind, Body and Soul": {
    100: AppColors.cORANGE_100,
    50: AppColors.cORANGE_50,
    25: AppColors.cORANGE_25,
    15: AppColors.cORANGE_15,
    06: AppColors.cORANGE_06,
  },
  "Parenting": {
    100: AppColors.cTEAL_100,
    50: AppColors.cTEAL_50,
    25: AppColors.cTEAL_25,
    15: AppColors.cTEAL_15,
    06: AppColors.cTEAL_06,
  },
};
