import 'dart:async';

import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    required this.onChanged,
    this.nameTextStyle,
    this.selectedCountry,
    this.dialingCodeTextStyle,
    this.showName = true,
    this.showDialingCode = false,
    Key? key,
  }) : super(key: key);

  final Country? selectedCountry;
  final ValueChanged<Country> onChanged;
  final bool showDialingCode;
  final bool showName;
  final TextStyle? nameTextStyle;
  final TextStyle? dialingCodeTextStyle;

  @override
  Widget build(BuildContext context) {
    Country? displayCountry = selectedCountry;

    return _renderDefaultDisplay(context, displayCountry);
  }

  InkWell _renderDefaultDisplay(BuildContext context, Country? displayCountry) {
    return InkWell(
      splashColor: AppColors.cGREEN_06,
      highlightColor: AppColors.cGREEN_06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (showName)
            Text(
              displayCountry?.label ?? '',
              style: nameTextStyle,
            ),
          if (showDialingCode)
            Text(
              displayCountry!.value,
              style: dialingCodeTextStyle,
            ),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.cBLACK_40,
          ),
        ],
      ),
      onTap: () {
        _selectCountry(context, displayCountry!);
      },
    );
  }

  Future<Null> _selectCountry(
      BuildContext context, Country defaultCountry) async {
    final Country? picked = await showCountryPicker(
      context: context,
      defaultCountry: defaultCountry,
    );

    if (picked != null && picked != selectedCountry) {
      onChanged(picked);
    }
  }
}

/// Display a [Dialog] with the country list to selection
/// you can pass and [defaultCountry], see [Country.findByIsoCode]
Future<Country?> showCountryPicker({
  required BuildContext context,
  required Country defaultCountry,
}) async {
  assert(Country.findByCountryCode(defaultCountry.value) != null);

  return await showDialog<Country>(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext context) => _CountryPickerDialog(
      defaultCountry: defaultCountry,
    ),
  );
}

class _CountryPickerDialog extends StatefulWidget {
  const _CountryPickerDialog({
    Key? key,
    Country? defaultCountry,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<_CountryPickerDialog> {
  TextEditingController controller = TextEditingController();
  String? filter;
  List<Country> countries = Country.allCountries;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget? tabletContainer({Widget? child}) {
    return (YCMediaQuery.isTablet ?? false)
        ? SizedBox(
            width: YCMediaQuery.getScreenWidth(divideBy: 1.5),
            height: YCMediaQuery.getScreenHeight(divideBy: 2),
            child: child,
          )
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: tabletContainer(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Search country',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: filter == null || filter == ""
                    ? InkWell(
                        child: const Icon(
                          Icons.clear,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    : InkWell(
                        child: const Icon(
                          Icons.clear,
                        ),
                        onTap: () {
                          controller.clear();
                        },
                      ),
              ),
              controller: controller,
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    Country country = countries[index];
                    if (filter == null ||
                        filter == "" ||
                        country.label
                            .toLowerCase()
                            .contains(filter!.toLowerCase())) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: AppColors.cBLACK_10),
                          ),
                        ),
                        child: InkWell(
                          splashColor: AppColors.cGREEN_06,
                          highlightColor: AppColors.cGREEN_06,
                          child: ListTile(
                            hoverColor: AppColors.cGREEN_50,
                            trailing: Text(
                              country.value,
                              style: CommonHelpers.getTextStyle(
                                TStyle.B1_600,
                              ),
                            ),
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      country.label,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CommonHelpers.getTextStyle(
                                        TStyle.B1_600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context, country);
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
