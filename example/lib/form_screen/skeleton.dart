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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  "isRequired": {"value": true, "msg": "This field is required"}
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
                  {"value": "Flameless Cooking", "label": "Flameless Cooking"},
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
