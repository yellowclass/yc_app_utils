import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSkeleton {
  final Map<String, dynamic> formSkeleton = {
    "title": "Teacher Onboarding",
    "slug": "teacher_onboarding",
    "appBar": {
      "title": {"text": "YellowClass", "textColor": "#000000"},
      "backgroundColor": "#FFFFFF",
      "leading": {
        "icon": {
          "url": "https://dev-imagic.yellowclass.com/assets/explore/yc-logo.png"
        }
      }
    },
    "sections": [
      {
        "key": "t1",
        "type": "BOOTSTRAP_SECTION",
        "containsForm": true,
        "bsData": {
          "type": "LAYER",
          "children": [
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "STYLED_COMPONENT",
                "scData": {
                  "type": "TEXT",
                  "text": "Teacher Onboarding",
                  "tStyle": "H1_700"
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "inputFieldType": "STRING",
                  "type": "FORM_INPUT",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Full Name"
                  },
                  "name": "fullName",
                  "placeholder": "Enter your full name",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  }
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "inputFieldType": "NUMBER",
                  "type": "FORM_INPUT",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Contact number"
                  },
                  "name": "contactNumber",
                  "placeholder": "Enter your contact number",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  }
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "type": "FORM_RADIO",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Gender"
                  },
                  "name": "gender",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  },
                  "options": [
                    {"value": "MALE", "label": "MALE"},
                    {"value": "FEMALE", "label": "FEMALE"}
                  ]
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "inputFieldType": "STRING",
                  "type": "FORM_INPUT",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "City"
                  },
                  "name": "city",
                  "placeholder": "Enter your city",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  }
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "type": "FORM_RADIO",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Age group"
                  },
                  "name": "ageGroup",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  },
                  "options": [
                    {"value": "Below 20", "label": "Below 20"},
                    {"value": "21-30", "label": "21-30"},
                    {"value": "31-40", "label": "31-40"},
                    {"value": "40+", "label": "40+"}
                  ]
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "type": "FORM_RADIO",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Highest Qualification"
                  },
                  "name": "qualification",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  },
                  "options": [
                    {"value": "Masters & Above", "label": "Masters & Above"},
                    {"value": "Bachelors", "label": "Bachelors"},
                    {"value": "Not a graduate", "label": "Not a graduate"}
                  ]
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "offset-2 col-8 offset-2",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "selectType": "SINGLE",
                  "type": "FORM_CHECKBOX",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Past experience with teaching"
                  },
                  "name": "pastExpTeaching",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  },
                  "options": [
                    {"value": "K-6", "label": "K-6"},
                    {"value": "7th-10th", "label": "7th-10th"},
                    {"value": "11th-12th", "label": "11th-12th"}
                  ],
                  "defaultValue": []
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "FORM_COMPONENT",
                "fcData": {
                  "selectType": "MULTIPLE",
                  "type": "FORM_SELECT",
                  "label": {
                    "textColor": "#000000",
                    "type": "TEXT",
                    "text": "Past experience with subjects"
                  },
                  "name": "pastExpSubjects",
                  "validation": {
                    "isRequired": {
                      "value": true,
                      "msg": "This field is required"
                    }
                  },
                  "options": [
                    {"value": "Math", "label": "Math"},
                    {"value": "Science", "label": "Science"},
                    {"value": "Coding", "label": "Coding"},
                    {"value": "English", "label": "English"},
                    {"value": "Hindi", "label": "Hindi"},
                    {"value": "GK", "label": "GK"},
                    {"value": "Art & Craft", "label": "Art & Craft"},
                    {"value": "Dance & Fitness", "label": "Dance & Fitness"},
                    {
                      "value": "Flameless Cooking",
                      "label": "Flameless Cooking"
                    },
                    {"value": "Music", "label": "Music"}
                  ],
                  "isSearchable": true,
                  "defaultValue": []
                }
              }
            },
            {
              "type": "BOOTSTRAP_WIDGET",
              "classes": "col-sm-12",
              "bcData": {
                "type": "STYLED_COMPONENT",
                "scData": {
                  "type": "TEXT",
                  "text": "Submit",
                  "textColor": "#fff",
                  "tStyle": "H4_700",
                  "background": {
                    "gradientColors": [],
                    "backgroundType": "FLAT_COLOR",
                    "backgroundColor": "00BD90"
                  },
                  "padding": [10]
                },
                "clickAction": {
                  "sequenceType": "SEQUENTIAL",
                  "showRippleEffect": true,
                  "actions": [
                    {"type": "APP_CUSTOM", "functionType": "SUBMIT_FORM"}
                  ]
                }
              }
            }
          ]
        }
      }
    ],
  };

  List<BootstrapSectionModel> sections = [
    BootstrapSectionModel(
      key: 't1',
      padding: [24, 0],
      bsData: BootstrapSectionChildModel(
        height: 100,
        boxAlignment: Alignment.centerLeft,
        classes: 'col-8 offset-2',
        bcData: BootstrapSectionModel(
          key: 't2',
          clickAction: V2ClickAction(
            sequenceType: SequenceTypeEnum.SEQUENTIAL,
            showRippleEffect: true,
            actions: [],
          ),
          background: SectionBackground(
            backgroundType: SectionBgType.IMAGE,
            backgroundImgUrl: 'https://picsum.photos/200/300',
          ),
          containsForm: false,
          bsData: BootstrapSectionLayerModel(
            children: [
              BootstrapSectionChildModel(
                height: 24,
                classes: 'col-2 offset-10',
                padding: [
                  4,
                  4,
                  0,
                  0,
                ],
                bcData: StyledComponentModel(
                  scData: StyledImageModel(
                    url: 'https://i.ibb.co/PhFDqp2/like.png',
                  ),
                ),
              ),
              BootstrapSectionChildModel(
                height: 46,
                classes: 'col-12',
              ),
              BootstrapSectionChildModel(
                // height: 28,
                classes: 'col-10',
                padding: [
                  0,
                  0,
                  0,
                  4,
                ],
                bcData: StyledComponentModel(
                  scData: V2StyledTextModel(
                    text: 'Raju Vaishno Dhaba',
                    textColor: '#FFF',
                    tStyle: TStyle.H5_600,
                  ),
                ),
              ),
              BootstrapSectionChildModel(
                classes: 'col-2',
                height: 24,
                boxAlignment: Alignment.center,
                padding: [
                  0,
                  4,
                  4,
                  0,
                ],
                bcData: StyledComponentModel(
                  scData: StyledImageModel(
                    url: 'https://i.ibb.co/PhFDqp2/like.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      containsForm: false,
    ),
    BootstrapSectionModel(
      key: 't1',
      padding: [24, 0],
      bsData: BootstrapSectionChildModel(
        height: 100,
        borderRadius: [20],
        background: SectionBackground(
          backgroundType: SectionBgType.IMAGE,
          backgroundImgUrl: 'https://picsum.photos/200/300',
        ),
        boxAlignment: Alignment.centerLeft,
        classes: 'col-8 offset-2',
        bcData: BootstrapSectionModel(
          key: 't2',
          containsForm: false,
          bsData: BootstrapSectionLayerModel(
            children: [
              BootstrapSectionChildModel(
                classes: 'col-10',
              ),
              BootstrapSectionChildModel(
                classes: 'col-2',
                bcData: BootstrapSectionModel(
                  key: 't2',
                  height: 20,
                  containsForm: false,
                  bsData: BootstrapSectionLayerModel(
                    children: [
                      BootstrapSectionChildModel(
                        classes: 'col-12',
                        height: 20,
                        bcData: StyledComponentModel(
                          scData: StyledImageModel(
                            url: 'https://i.ibb.co/PhFDqp2/like.png',
                          ),
                        ),
                      ),
                      BootstrapSectionChildModel(
                        classes: 'col-12',
                        height: 20,
                        bcData: StyledComponentModel(
                          scData: StyledImageModel(
                            url: 'https://i.ibb.co/PhFDqp2/like.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // BootstrapChildModel(
              //   // height: 28,
              //   classes: 'col-10',
              //   padding: [
              //     0,
              //     0,
              //     0,
              //     4,
              //   ],
              //   child: StyledComponentModel(
              //     scData: SCDataModel(
              //       scType: StyledComponentEnum.TEXT,
              //       data: V2StyledTextModel(
              //         text: 'Raju Vaishno Dhaba',
              //         textColor: '#FFF',
              //         tStyle: TStyle.H5_600,
              //       ),
              //     ),
              //   ),
              // ),
              // BootstrapChildModel(
              //   classes: 'col-2',
              //   height: 24,
              //   boxAlignment: Alignment.center,
              //   padding: [
              //     0,
              //     4,
              //     4,
              //     0,
              //   ],
              //   child: StyledComponentModel(
              //     scData: SCDataModel(
              //       scType: StyledComponentEnum.IMAGE,
              //       data: StyledImageModel(
              //         url: 'https://i.ibb.co/PhFDqp2/like.png',
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      containsForm: false,
    ),
    BootstrapSectionModel(
      key: 't1',
      padding: [34, 16],
      background: SectionBackground(
        backgroundType: SectionBgType.FLAT_COLOR,
      ),
      bsData: BootstrapSectionLayerModel(
        children: [
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: FormComponentModel(
              fcData: StyledInputFieldModel(
                name: 'name',
                label: V2StyledTextModel(
                  text: 'Name',
                  textColor: '#000',
                ),
                validation: Validation(
                  isRequired: BooleanValidation.fromMap(
                    {
                      'value': true,
                      'msg': 'Required',
                    },
                  ),
                ),
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: FormComponentModel(
              fcData: StyledInputFieldModel(
                name: 'phone',
                label: V2StyledTextModel(
                  text: 'Phone',
                  textColor: '#000',
                ),
                inputFieldType: InputFieldEnum.MOBILE,
                validation: Validation(
                  isRequired: BooleanValidation.fromMap(
                    {
                      'value': true,
                      'msg': 'Required',
                    },
                  ),
                ),
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: StyledComponentModel(
              scData: V2StyledTextModel(
                text: 'Submit',
                background: SectionBackground(
                  backgroundType: SectionBgType.FLAT_COLOR,
                  backgroundColor: '#ff0000',
                ),
                textAlign: TextAlign.center,
                padding: [12, 0],
              ),
              clickAction: V2ClickAction(
                sequenceType: SequenceTypeEnum.SEQUENTIAL,
                actions: [
                  OneClickAction(
                    type: V2ClickActionTypesEnum.APP_CUSTOM,
                    functionType: V2FunctionTypesEnum.SUBMIT_FORM,
                  ),
                ],
                showRippleEffect: true,
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: StyledComponentModel(
              scData: V2StyledTextModel(
                text: 'Click Me',
                textColor: '#000',
              ),
              clickAction: V2ClickAction(
                sequenceType: SequenceTypeEnum.SEQUENTIAL,
                actions: [],
                showRippleEffect: true,
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: FormComponentModel(
              padding: [8, 0, 0, 0],
              fcData: StyledSelectFieldModel(
                name: 'gender',
                options: [
                  OptionModel(
                    label: 'Male',
                    value: 'male',
                  ),
                  OptionModel(
                    label: 'Female',
                    value: 'female',
                  ),
                ],
                selectType: SelectType.MULTIPLE,
                isSearchable: true,
                label: V2StyledTextModel(
                  text: 'Gender',
                  textColor: '#000',
                ),
              ),
            ),
          ),
        ],
      ),
      containsForm: true,
    ),
    BootstrapSectionModel(
      key: 't1',
      background: SectionBackground(
        backgroundType: SectionBgType.FLAT_COLOR,
      ),
      bsData: BootstrapSectionLayerModel(
        children: [
          BootstrapSectionChildModel(
            classes: 'col-sm-6',
            bcData: BootstrapSectionModel(
              key: '',
              containsForm: false,
              bsData: BootstrapSectionLayerModel(
                children: [
                  BootstrapSectionChildModel(
                    classes: 'col-sm-6',
                    height: 100,
                    background: SectionBackground(
                      backgroundType: SectionBgType.FLAT_COLOR,
                      backgroundColor: '#FF0000',
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-6',
                    height: 100,
                    background: SectionBackground(
                      backgroundType: SectionBgType.FLAT_COLOR,
                      backgroundColor: '#00FF00',
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-6',
                    height: 100,
                    background: SectionBackground(
                      backgroundType: SectionBgType.FLAT_COLOR,
                      backgroundColor: '#00FF00',
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-6',
                    height: 100,
                    background: SectionBackground(
                      backgroundType: SectionBgType.FLAT_COLOR,
                      backgroundColor: '#FF0000',
                    ),
                  ),
                ],
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-6',
            height: 200,
            background: SectionBackground(
              backgroundType: SectionBgType.FLAT_COLOR,
              backgroundColor: '#00FF00',
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: FormComponentModel(
              padding: [8, 0, 0, 0],
              fcData: StyledSelectFieldModel(
                name: 'gender',
                options: [
                  OptionModel(
                    label: 'Male',
                    value: 'male',
                  ),
                  OptionModel(
                    label: 'Female',
                    value: 'female',
                  ),
                ],
                selectType: SelectType.MULTIPLE,
                isSearchable: true,
                label: V2StyledTextModel(
                  text: 'Gender',
                  textColor: '#000',
                ),
              ),
            ),
          ),
        ],
      ),
      clickAction: V2ClickAction(
        sequenceType: SequenceTypeEnum.SEQUENTIAL,
        actions: [],
        showRippleEffect: true,
      ),
      containsForm: false,
    )
  ];
}
