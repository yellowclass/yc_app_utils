final Map<String, dynamic> formSkeleton = {
  'key': 'claim_gift_address_form',
  'padding': [24, 16],
  'layers': [
    {
      'rows': [
        {
          'columns': [
            {
              'data': {
                'type': 'TEXT',
                'textDetails': {
                  'text': "Click Me",
                  'textColor': '#000',
                },
                'clickAction': {
                  'sequenceType': 'SEQUENTIAL',
                  // 'showRippleEffect': true,
                },
              },
            },
          ],
        },
        // {
        //   'mainAxisAlignment': 'SPACE_BETWEEN',
        //   'crossAxisAlignment': 'START',
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'gridSection': {
        //         'layers': [
        //           {
        //             'rows': [
        //               {
        //                 'mainAxisAlignment': 'START',
        //                 'columns': [
        //                   {
        //                     'crossAxisAlignment': 'START',
        //                     'data': {
        //                       'type': 'TEXT',
        //                       'textDetails': {
        //                         'text': 'Welcome',
        //                         'textColor': '#000000',
        //                         'tStyle': 'H3_700',
        //                       },
        //                     },
        //                   },
        //                 ]
        //               },
        //               {
        //                 'mainAxisAlignment': 'START',
        //                 'columns': [
        //                   {
        //                     'crossAxisAlignment': 'START',
        //                     'data': {
        //                       'type': 'TEXT',
        //                       'textDetails': {
        //                         'text': 'Back',
        //                         'textColor': '#000000',
        //                         'tStyle': 'H3_700',
        //                         'textAlign': 'RIGHT',
        //                       },
        //                     },
        //                   },
        //                 ]
        //               }
        //             ]
        //           }
        //         ],
        //       },
        //     },
        //     {
        //       'data': {
        //         'type': 'TEXT',
        //         'textDetails': {
        //           'text': 'Sign Up',
        //           'textColor': '#000000',
        //           'tStyle': 'H3_700',
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_INPUT',
        //         'inputField': {
        //           'name': 'fullName',
        //           'type': 'STRING',
        //           'label': {
        //             'text': 'Full Name',
        //             'textColor': '#000000',
        //           },
        //           'placeholder': 'Your Full Name',
        //           'validate': {
        //             'isRequired': {
        //               'value': true,
        //               'msg': 'This field is required',
        //             },
        //           },
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_INPUT',
        //         'inputField': {
        //           'name': 'age',
        //           'type': 'NUMBER',
        //           'label': {
        //             'text': 'Age',
        //             'textColor': '#000000',
        //           },
        //           'placeholder': 'Your Age',
        //           'validate': {
        //             'isRequired': {
        //               'value': true,
        //               'msg': 'This field is required',
        //             },
        //             'min': {
        //               'value': 18,
        //               'msg': 'You must be atleast 18 years old',
        //             },
        //           },
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'crossAxisAlignment': 'START',
        //       'data': {
        //         'type': 'FORM_RADIO',
        //         'radioField': {
        //           'name': 'gender',
        //           'label': {
        //             'text': 'Gender',
        //             'textColor': '#000000',
        //           },
        //           'defaultValue': {
        //             'label': 'Male',
        //             'value': 'male',
        //           },
        //           'options': [
        //             {
        //               'label': 'Male',
        //               'value': 'male',
        //             },
        //             {
        //               'label': 'Female',
        //               'value': 'female',
        //             },
        //           ],
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'crossAxisAlignment': 'START',
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_CHECKBOX',
        //         'checkboxField': {
        //           'name': 'gender',
        //           'label': {
        //             'text': 'Gender',
        //             'textColor': '#000000',
        //           },
        //           'defaultValue': [
        //             {
        //               'label': 'Male',
        //               'value': 'male',
        //             },
        //           ],
        //           'options': [
        //             {
        //               'label': 'Male',
        //               'value': 'male',
        //             },
        //             {
        //               'label': 'Female',
        //               'value': 'female',
        //             },
        //           ],
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_SELECT',
        //         'selectField': {
        //           'selectType': 'MULTIPLE',
        //           'name': 'gender',
        //           'label': {
        //             'text': 'Gender',
        //             'textColor': '#000000',
        //           },
        //           'defaultValue': [
        //             {
        //               'label': 'Male',
        //               'value': 'male',
        //             },
        //           ],
        //           'options': [
        //             {
        //               'label': 'Male',
        //               'value': 'male',
        //             },
        //             {
        //               'label': 'Female',
        //               'value': 'female',
        //             },
        //           ],
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_INPUT',
        //         'inputField': {
        //           'name': 'school',
        //           'type': 'STRING',
        //           'placeholder': 'School Name',
        //           'validate': {
        //             'isRequired': {
        //               'value': true,
        //               'msg': 'This field is required',
        //             },
        //           },
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_INPUT',
        //         'inputField': {
        //           'name': 'classGrade',
        //           'type': 'STRING',
        //           'placeholder': 'Class Grade',
        //           'validate': {
        //             'isRequired': {
        //               'value': true,
        //               'msg': 'This field is required',
        //             },
        //           },
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'flexFactor': 1,
        //       'data': {
        //         'type': 'FORM_TEXTAREA',
        //         'textAreaField': {
        //           'name': 'about',
        //           'placeholder': 'Tell About Yourself',
        //           'validate': {
        //             'isRequired': {
        //               'value': true,
        //               'msg': 'This field is required',
        //             },
        //           },
        //         },
        //       },
        //     },
        //   ],
        // },
        // {
        //   'padding': [0, 0, 16, 0],
        //   'columns': [
        //     {
        //       'key': 'test_gs_1_r3_c1',
        //       'data': {
        //         'type': 'BUTTON',
        //         'buttonDetails': {
        //           'key': 'submit_form',
        //           'buttonRows': [
        //             {
        //               'mainAxisAlignment': 'CENTER',
        //               'buttonColumnData': [
        //                 {
        //                   'text': 'Submit',
        //                   'textColor': '#FFFFFF',
        //                 },
        //               ],
        //             },
        //           ],
        //           'clickAction': {
        //             'clickActionType': 'APP_CUSTOM',
        //             'functiontype': 'SUBMIT_FORM',
        //           },
        //           'backgroundColor': '#00BD90',
        //         },
        //       },
        //     },
        //   ],
        // },
      ],
    },
  ],
};
