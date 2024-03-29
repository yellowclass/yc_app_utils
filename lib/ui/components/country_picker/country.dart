class Country {
  final String label;
  final String value;
  final String code;

  const Country({
    required this.label,
    required this.value,
    required this.code,
  });

  @override
  bool operator ==(o) => o is Country && o.label == label && o.value == value;

  int get hashCode {
    int hash = 7;
    hash = 31 * hash + label.hashCode;
    hash = 31 * hash + value.hashCode;
    return hash;
  }

  Map<String, dynamic> toMap() {
    return {
      'label': this.label,
      'value': this.value,
      'code': this.code,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      label: map['label'],
      value: map['value'],
      code: map['code'].toString().toUpperCase(),
    );
  }

  /// All the countries in the picker list
  static List<Country> allCountries = [
    const Country(label: "Afghanistan", value: "+93", code: "AF"),
    const Country(label: "Albania", value: "+355", code: "AL"),
    const Country(label: "Algeria", value: "+213", code: "DZ"),
    const Country(label: "American Samoa", value: "+1684", code: "AS"),
    const Country(label: "Andorra", value: "+376", code: "AD"),
    const Country(label: "Angola", value: "+244", code: "AO"),
    const Country(label: "Anguilla", value: "+1264", code: "AI"),
    const Country(label: "Antigua and Barbuda", value: "+1268", code: "AG"),
    const Country(label: "Argentina", value: "+54", code: "AR"),
    const Country(label: "Armenia", value: "+374", code: "AM"),
    const Country(label: "Aruba", value: "+297", code: "AW"),
    const Country(label: "Australia", value: "+61", code: "AU"),
    const Country(label: "Austria", value: "+43", code: "AT"),
    const Country(label: "Azerbaijan", value: "+994", code: "AZ"),
    const Country(label: "Bahamas", value: "+1242", code: "BS"),
    const Country(label: "Bahrain", value: "+973", code: "BH"),
    const Country(label: "Bangladesh", value: "+880", code: "BD"),
    const Country(label: "Barbados", value: "+1246", code: "BB"),
    const Country(label: "Belarus", value: "+375", code: "BY"),
    const Country(label: "Belgium", value: "+32", code: "BE"),
    const Country(label: "Belize", value: "+501", code: "BZ"),
    const Country(label: "Benin", value: "+229", code: "BJ"),
    const Country(label: "Bermuda", value: "+1441", code: "BM"),
    const Country(label: "Bhutan", value: "+975", code: "BT"),
    const Country(label: "Bolivia", value: "+591", code: "BO"),
    const Country(label: "Bosnia and Herzegovina", value: "+387", code: "BA"),
    const Country(label: "Botswana", value: "+267", code: "BW"),
    const Country(label: "Brazil", value: "+55", code: "BR"),
    const Country(
        label: "British Indian Ocean Territory", value: "+246", code: "IO"),
    const Country(label: "Bulgaria", value: "+359", code: "BG"),
    const Country(label: "Burkina Faso", value: "+226", code: "BF"),
    const Country(label: "Burundi", value: "+257", code: "BI"),
    const Country(label: "Cambodia", value: "+855", code: "KH"),
    const Country(label: "Cameroon", value: "+237", code: "CM"),
    const Country(label: "Cape Verde", value: "+238", code: "CV"),
    const Country(label: "Cayman Islands", value: "+345", code: "KY"),
    const Country(label: "Central African Republic", value: "+236", code: "CF"),
    const Country(label: "Chad", value: "+235", code: "TD"),
    const Country(label: "Chile", value: "+56", code: "CL"),
    const Country(label: "China", value: "+86", code: "CN"),
    const Country(label: "Colombia", value: "+57", code: "CO"),
    const Country(label: "Comoros", value: "+269", code: "KM"),
    const Country(label: "Congo", value: "+242", code: "CG"),
    const Country(
      label: "Congo, The Democratic Republic of the Congo",
      value: "+243",
      code: "CD",
    ),
    const Country(label: "Cook Islands", value: "+682", code: "CK"),
    const Country(label: "Costa Rica", value: "+506", code: "CR"),
    const Country(label: "Cote d'Ivoire", value: "+225", code: "CI"),
    const Country(label: "Croatia", value: "+385", code: "HR"),
    const Country(label: "Cuba", value: "+53", code: "CU"),
    const Country(label: "Cyprus", value: "+357", code: "CY"),
    const Country(label: "Czech Republic", value: "+420", code: "CZ"),
    const Country(label: "Denmark", value: "+45", code: "DK"),
    const Country(label: "Djibouti", value: "+253", code: "DJ"),
    const Country(label: "Dominica", value: "+1767", code: "DM"),
    const Country(label: "Dominican Republic", value: "+1849", code: "DO"),
    const Country(label: "Ecuador", value: "+593", code: "EC"),
    const Country(label: "Egypt", value: "+20", code: "EG"),
    const Country(label: "El Salvador", value: "+503", code: "SV"),
    const Country(label: "Equatorial Guinea", value: "+240", code: "GQ"),
    const Country(label: "Eritrea", value: "+291", code: "ER"),
    const Country(label: "Estonia", value: "+372", code: "EE"),
    const Country(label: "Ethiopia", value: "+251", code: "ET"),
    const Country(
        label: "Falkland Islands (Malvinas)", value: "+500", code: "FK"),
    const Country(label: "Faroe Islands", value: "+298", code: "FO"),
    const Country(label: "Fiji", value: "+679", code: "FJ"),
    const Country(label: "Finland", value: "+358", code: "FI"),
    const Country(label: "France", value: "+33", code: "FR"),
    const Country(label: "French Guiana", value: "+594", code: "GF"),
    const Country(label: "French Polynesia", value: "+689", code: "PF"),
    const Country(label: "Gabon", value: "+241", code: "GA"),
    const Country(label: "Gambia", value: "+220", code: "GM"),
    const Country(label: "Georgia", value: "+995", code: "GE"),
    const Country(label: "Germany", value: "+49", code: "DE"),
    const Country(label: "Ghana", value: "+233", code: "GH"),
    const Country(label: "Gibraltar", value: "+350", code: "GI"),
    const Country(label: "Greece", value: "+30", code: "GR"),
    const Country(label: "Greenland", value: "+299", code: "GL"),
    const Country(label: "Grenada", value: "+1473", code: "GD"),
    const Country(label: "Guadeloupe", value: "+590", code: "GP"),
    const Country(label: "Guam", value: "+1671", code: "GU"),
    const Country(label: "Guatemala", value: "+502", code: "GT"),
    const Country(label: "Guinea", value: "+224", code: "GN"),
    const Country(label: "Guinea-Bissau", value: "+245", code: "GW"),
    const Country(label: "Guyana", value: "+592", code: "GY"),
    const Country(label: "Haiti", value: "+509", code: "HT"),
    const Country(label: "Honduras", value: "+504", code: "HN"),
    const Country(label: "Hong Kong", value: "+852", code: "HK"),
    const Country(label: "Hungary", value: "+36", code: "HU"),
    const Country(label: "Iceland", value: "+354", code: "IS"),
    const Country(label: "India", value: "+91", code: "IN"),
    const Country(label: "Indonesia", value: "+62", code: "ID"),
    const Country(label: "Iran", value: "+98", code: "IR"),
    const Country(label: "Iraq", value: "+964", code: "IQ"),
    const Country(label: "Ireland", value: "+353", code: "IE"),
    const Country(label: "Israel", value: "+972", code: "IL"),
    const Country(label: "Italy", value: "+39", code: "IT"),
    const Country(label: "Jamaica", value: "+1876", code: "JM"),
    const Country(label: "Japan", value: "+81", code: "JP"),
    const Country(label: "Jordan", value: "+962", code: "JO"),
    const Country(label: "Kenya", value: "+254", code: "KE"),
    const Country(label: "Kiribati", value: "+686", code: "KI"),
    const Country(label: "North Korea", value: "+850", code: "KP"),
    const Country(
        label: "Korea, Republic of South Korea", value: "+82", code: "KR"),
    const Country(label: "Kosovo", value: "+383", code: "XK"),
    const Country(label: "Kuwait", value: "+965", code: "KW"),
    const Country(label: "Kyrgyzstan", value: "+996", code: "KG"),
    const Country(label: "Laos", value: "+856", code: "LA"),
    const Country(label: "Latvia", value: "+371", code: "LV"),
    const Country(label: "Lebanon", value: "+961", code: "LB"),
    const Country(label: "Lesotho", value: "+266", code: "LS"),
    const Country(label: "Liberia", value: "+231", code: "LR"),
    const Country(label: "Libyan Arab Jamahiriya", value: "+218", code: "LY"),
    const Country(label: "Liechtenstein", value: "+423", code: "LI"),
    const Country(label: "Lithuania", value: "+370", code: "LT"),
    const Country(label: "Luxembourg", value: "+352", code: "LU"),
    const Country(label: "Macao", value: "+853", code: "MO"),
    const Country(label: "Macedonia", value: "+389", code: "MK"),
    const Country(label: "Madagascar", value: "+261", code: "MG"),
    const Country(label: "Malawi", value: "+265", code: "MW"),
    const Country(label: "Malaysia", value: "+60", code: "MY"),
    const Country(label: "Maldives", value: "+960", code: "MV"),
    const Country(label: "Mali", value: "+223", code: "ML"),
    const Country(label: "Malta", value: "+356", code: "MT"),
    const Country(label: "Marshall Islands", value: "+692", code: "MH"),
    const Country(label: "Martinique", value: "+596", code: "MQ"),
    const Country(label: "Mauritania", value: "+222", code: "MR"),
    const Country(label: "Mauritius", value: "+230", code: "MU"),
    const Country(label: "Mexico", value: "+52", code: "MX"),
    const Country(
      label: "Micronesia, Federated States of Micronesia",
      value: "+691",
      code: "FM",
    ),
    const Country(label: "Moldova", value: "+373", code: "MD"),
    const Country(label: "Monaco", value: "+377", code: "MC"),
    const Country(label: "Mongolia", value: "+976", code: "MN"),
    const Country(label: "Montenegro", value: "+382", code: "ME"),
    const Country(label: "Montserrat", value: "+1664", code: "MS"),
    const Country(label: "Morocco", value: "+212", code: "MA"),
    const Country(label: "Mozambique", value: "+258", code: "MZ"),
    const Country(label: "Myanmar", value: "+95", code: "MM"),
    const Country(label: "Namibia", value: "+264", code: "NA"),
    const Country(label: "Nauru", value: "+674", code: "NR"),
    const Country(label: "Nepal", value: "+977", code: "NP"),
    const Country(label: "Netherlands", value: "+31", code: "NL"),
    const Country(label: "New Caledonia", value: "+687", code: "NC"),
    const Country(label: "New Zealand", value: "+64", code: "NZ"),
    const Country(label: "Nicaragua", value: "+505", code: "NI"),
    const Country(label: "Niger", value: "+227", code: "NE"),
    const Country(label: "Nigeria", value: "+234", code: "NG"),
    const Country(label: "Niue", value: "+683", code: "NU"),
    const Country(label: "Norfolk Island", value: "+672", code: "NF"),
    const Country(
        label: "Northern Mariana Islands", value: "+1670", code: "MP"),
    const Country(label: "Norway", value: "+47", code: "NO"),
    const Country(label: "Oman", value: "+968", code: "OM"),
    const Country(label: "Pakistan", value: "+92", code: "PK"),
    const Country(label: "Palau", value: "+680", code: "PW"),
    const Country(label: "Palestine", value: "+970", code: "PS"),
    const Country(label: "Panama", value: "+507", code: "PA"),
    const Country(label: "Papua New Guinea", value: "+675", code: "PG"),
    const Country(label: "Paraguay", value: "+595", code: "PY"),
    const Country(label: "Peru", value: "+51", code: "PE"),
    const Country(label: "Philippines", value: "+63", code: "PH"),
    const Country(label: "Poland", value: "+48", code: "PL"),
    const Country(label: "Portugal", value: "+351", code: "PT"),
    const Country(label: "Puerto Rico", value: "+1939", code: "PR"),
    const Country(label: "Qatar", value: "+974", code: "QA"),
    const Country(label: "Romania", value: "+40", code: "RO"),
    const Country(label: "Russia", value: "+7", code: "RU"),
    const Country(label: "Rwanda", value: "+250", code: "RW"),
    const Country(label: "Reunion", value: "+262", code: "RE"),
    const Country(
      label: "Saint Helena, Ascension and Tristan Da Cunha",
      value: "+290",
      code: "SH",
    ),
    const Country(label: "Saint Kitts and Nevis", value: "+1869", code: "KN"),
    const Country(label: "Saint Lucia", value: "+1758", code: "LC"),
    const Country(
        label: "Saint Pierre and Miquelon", value: "+508", code: "PM"),
    const Country(
      label: "Saint Vincent and the Grenadines",
      value: "+1784",
      code: "VC",
    ),
    const Country(label: "Samoa", value: "+685", code: "WS"),
    const Country(label: "San Marino", value: "+378", code: "SM"),
    const Country(label: "Sao Tome and Principe", value: "+239", code: "ST"),
    const Country(label: "Saudi Arabia", value: "+966", code: "SA"),
    const Country(label: "Senegal", value: "+221", code: "SN"),
    const Country(label: "Serbia", value: "+381", code: "RS"),
    const Country(label: "Seychelles", value: "+248", code: "SC"),
    const Country(label: "Sierra Leone", value: "+232", code: "SL"),
    const Country(label: "Singapore", value: "+65", code: "SG"),
    const Country(label: "Slovakia", value: "+421", code: "SK"),
    const Country(label: "Slovenia", value: "+386", code: "SI"),
    const Country(label: "Solomon Islands", value: "+677", code: "SB"),
    const Country(label: "Somalia", value: "+252", code: "SO"),
    const Country(label: "South Africa", value: "+27", code: "ZA"),
    const Country(label: "South Sudan", value: "+211", code: "SS"),
    const Country(label: "Spain", value: "+34", code: "ES"),
    const Country(label: "Sri Lanka", value: "+94", code: "LK"),
    const Country(label: "Sudan", value: "+249", code: "SD"),
    const Country(label: "Suriname", value: "+597", code: "SR"),
    const Country(label: "Swaziland", value: "+268", code: "SZ"),
    const Country(label: "Sweden", value: "+46", code: "SE"),
    const Country(label: "Switzerland", value: "+41", code: "CH"),
    const Country(label: "Syria", value: "+963", code: "SY"),
    const Country(label: "Taiwan", value: "+886", code: "TW"),
    const Country(label: "Tajikistan", value: "+992", code: "TJ"),
    const Country(
      label: "Tanzania, United Republic of Tanzania",
      value: "+255",
      code: "TZ",
    ),
    const Country(label: "Thailand", value: "+66", code: "TH"),
    const Country(label: "Timor-Leste", value: "+670", code: "TL"),
    const Country(label: "Togo", value: "+228", code: "TG"),
    const Country(label: "Tokelau", value: "+690", code: "TK"),
    const Country(label: "Tonga", value: "+676", code: "TO"),
    const Country(label: "Trinidad and Tobago", value: "+1868", code: "TT"),
    const Country(label: "Tunisia", value: "+216", code: "TN"),
    const Country(label: "Turkey", value: "+90", code: "TR"),
    const Country(label: "Turkmenistan", value: "+993", code: "TM"),
    const Country(
        label: "Turks and Caicos Islands", value: "+1649", code: "TC"),
    const Country(label: "Tuvalu", value: "+688", code: "TV"),
    const Country(label: "Uganda", value: "+256", code: "UG"),
    const Country(label: "Ukraine", value: "+380", code: "UA"),
    const Country(label: "United Arab Emirates", value: "+971", code: "AE"),
    const Country(label: "United Kingdom", value: "+44", code: "GB"),
    const Country(
      label: "United States of America (USA)/Canada",
      value: "+1",
      code: "US",
    ),
    const Country(label: "Uruguay", value: "+598", code: "UY"),
    const Country(label: "Uzbekistan", value: "+998", code: "UZ"),
    const Country(label: "Vanuatu", value: "+678", code: "VU"),
    const Country(label: "Venezuela", value: "+58", code: "VE"),
    const Country(label: "Vietnam", value: "+84", code: "VN"),
    const Country(label: "Wallis and Futuna", value: "+681", code: "WF"),
    const Country(label: "Yemen", value: "+967", code: "YE"),
    const Country(label: "Zambia", value: "+260", code: "ZM"),
    const Country(label: "Zimbabwe", value: "+263", code: "ZW"),
  ];

  /// returns a country with the specified [value] or ```null``` if none or more than 1 are found

  static Country? findByCountryCode(String value) {
    return allCountries.singleWhere(
      (item) => item.value == value,
    );
  }
}
