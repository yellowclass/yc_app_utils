import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSkeleton {
  List<BootstrapSectionModel> sections = [
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
                label: V2StyledTextModel(
                  text: 'Gender',
                  textColor: '#000',
                ),
              ),
            ),
          ),
        ],
      ),
      containsForm: false,
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
                label: V2StyledTextModel(
                  text: 'Gender',
                  textColor: '#000',
                ),
              ),
            ),
          ),
        ],
      ),
      containsForm: false,
    )
  ];
}
