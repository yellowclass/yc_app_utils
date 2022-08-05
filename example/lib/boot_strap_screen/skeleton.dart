import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSkeleton {
  List<BootstrapSectionModel> programSections = [
    BootstrapSectionModel(
      key: 'program_features',
      background: SectionBackground(
        backgroundType: SectionBgType.FLAT_COLOR,
        backgroundColor: '#e3f5fd',
      ),
      padding: [16],
      bsData: BootstrapSectionLayerModel(
        children: [
          BootstrapSectionChildModel(
            classes: 'col-sm-4',
            padding: [0, 4, 0, 0],
            bcData: BootstrapSectionModel(
              key: 'avg_class_time',
              containsForm: false,
              borderRadius: [8],
              background: SectionBackground(
                backgroundType: SectionBgType.FLAT_COLOR,
                backgroundColor: '#ffffff',
              ),
              padding: [16, 0],
              bsData: BootstrapSectionLayerModel(
                children: [
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    padding: [0, 0, 8, 0],
                    bcData: StyledComponentModel(
                      scData: StyledImageModel(
                        url:
                            'https://cdn.zeplin.io/6048a06dc02abf07e7104e72/assets/EF54598C-4D8B-4FDF-A553-83B6D111BEFE.svg',
                      ),
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    bcData: StyledComponentModel(
                      scData: V2StyledTextModel(
                        text: '40 min avg\nper class',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-4',
            padding: [0, 4, 0, 4],
            bcData: BootstrapSectionModel(
              key: 'classes_count',
              containsForm: false,
              borderRadius: [8],
              background: SectionBackground(
                backgroundType: SectionBgType.FLAT_COLOR,
                backgroundColor: '#ffffff',
              ),
              padding: [16, 0],
              bsData: BootstrapSectionLayerModel(
                children: [
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    padding: [0, 0, 8, 0],
                    bcData: StyledComponentModel(
                      scData: StyledImageModel(
                        url:
                            'https://cdn.zeplin.io/6048a06dc02abf07e7104e72/assets/EF54598C-4D8B-4FDF-A553-83B6D111BEFE.svg',
                      ),
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    bcData: StyledComponentModel(
                      scData: V2StyledTextModel(
                        text: '30\nClasses',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-4',
            padding: [0, 0, 0, 4],
            bcData: BootstrapSectionModel(
              key: 'appreciation_certificate',
              containsForm: false,
              borderRadius: [8],
              background: SectionBackground(
                backgroundType: SectionBgType.FLAT_COLOR,
                backgroundColor: '#ffffff',
              ),
              padding: [16, 0],
              bsData: BootstrapSectionLayerModel(
                children: [
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    padding: [0, 0, 8, 0],
                    bcData: StyledComponentModel(
                      scData: StyledImageModel(
                        url:
                            'https://cdn.zeplin.io/6048a06dc02abf07e7104e72/assets/EF54598C-4D8B-4FDF-A553-83B6D111BEFE.svg',
                      ),
                    ),
                  ),
                  BootstrapSectionChildModel(
                    classes: 'col-sm-12',
                    bcData: StyledComponentModel(
                      scData: V2StyledTextModel(
                        text: 'Appreciation\nCertificate',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      containsForm: false,
    ),
    BootstrapSectionModel(
      key: 'appreciation_certificate',
      background: SectionBackground(
        backgroundType: SectionBgType.IMAGE,
        backgroundImgUrl: 'https://i.ibb.co/wrxdLD2/group-22-3x.png',
      ),
      bsData: BootstrapSectionLayerModel(
        children: [
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            padding: [36, 0, 4, 0],
            bcData: StyledComponentModel(
              scData: V2StyledTextModel(
                text: 'Appreciation Certificate',
                textColor: '#FFFFFF',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            padding: [0, 0, 36, 0],
            bcData: StyledComponentModel(
              scData: V2StyledTextModel(
                text:
                    'You\'ll get certificate as a recognition for your effort and mastering the skill',
                textColor: '#FFFFFF',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            padding: [0, 32],
            bcData: StyledComponentModel(
              scData: StyledImageModel(
                borderRadius: [8, 0],
                url:
                    'https://ycimg-dev.imgix.net/PROGRAM_CERTIFICATE/61138970509ce570bb91c301/fb6f12a2-74ec-4cc0-8062-be7929b639cd/BASE/blob.jpg',
              ),
            ),
          ),
        ],
      ),
      containsForm: false,
    ),
    BootstrapSectionModel(
      key: 'form',
      bsData: BootstrapSectionLayerModel(
        children: [
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: FormComponentModel(
              fcData: StyledDateTimeFieldModel(
                  name: 'dob',
                  isDisabled: false,
                  dateTimeFieldType: DateTimeFieldTypeEnum.DATE,
                  placeholder: 'Date of Birth',
                  firstDate: DateTime.now().toIso8601String(),
                  lastDate: DateTime(2022, 12).toIso8601String(),
                  validation: Validation(
                    isRequired: BooleanValidation.fromMap({
                      'msg': 'requried',
                      'value': true,
                    }),
                  )),
            ),
          ),
          BootstrapSectionChildModel(
            classes: 'col-sm-12',
            bcData: StyledComponentModel(
                scData: V2StyledTextModel(
                  text: 'Submit',
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
                )),
          ),
        ],
      ),
      containsForm: true,
    ),
  ];
}
