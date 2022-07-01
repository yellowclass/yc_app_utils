import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSkeleton {
  List<BootstrapSectionModel> sections = [
    BootstrapSectionModel(
      key: 't1',
      padding: [24, 0],
      data: BSWidgetModel(
        bsWidget: BootstrapChildModel(
          height: 100,
          borderRadius: [20],
          background: SectionBackground(
            backgroundType: SectionBgType.IMAGE,
            backgroundImgUrl: 'https://picsum.photos/200/300',
          ),
          boxAlignment: Alignment.centerLeft,
          classes: 'col-8 offset-2',
          child: BootstrapSectionModel(
            key: 't2',
            containsForm: false,
            data: BSWidgetModel(
              bsWidget: BootstrapSectionLayerModel(
                children: [
                  BootstrapChildModel(
                    height: 24,
                    classes: 'col-2 offset-10',
                    padding: [
                      4,
                      4,
                      0,
                      0,
                    ],
                    child: StyledComponentModel(
                      scData: SCDataModel(
                        scType: StyledComponentEnum.IMAGE,
                        data: StyledImageModel(
                          url: 'https://i.ibb.co/PhFDqp2/like.png',
                        ),
                      ),
                    ),
                  ),
                  BootstrapChildModel(
                    height: 46,
                    classes: 'col-12',
                  ),
                  BootstrapChildModel(
                    // height: 28,
                    classes: 'col-10',
                    padding: [
                      0,
                      0,
                      0,
                      4,
                    ],
                    child: StyledComponentModel(
                      scData: SCDataModel(
                        scType: StyledComponentEnum.TEXT,
                        data: V2StyledTextModel(
                          text: 'Raju Vaishno Dhaba',
                          textColor: '#FFF',
                          tStyle: TStyle.H5_600,
                        ),
                      ),
                    ),
                  ),
                  BootstrapChildModel(
                    classes: 'col-2',
                    height: 24,
                    boxAlignment: Alignment.center,
                    padding: [
                      0,
                      4,
                      4,
                      0,
                    ],
                    child: StyledComponentModel(
                      scData: SCDataModel(
                        scType: StyledComponentEnum.IMAGE,
                        data: StyledImageModel(
                          url: 'https://i.ibb.co/PhFDqp2/like.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      containsForm: false,
    ),
    BootstrapSectionModel(
      key: 't1',
      padding: [24, 0],
      data: BSWidgetModel(
        bsWidget: BootstrapChildModel(
          height: 100,
          borderRadius: [20],
          background: SectionBackground(
            backgroundType: SectionBgType.IMAGE,
            backgroundImgUrl: 'https://picsum.photos/200/300',
          ),
          boxAlignment: Alignment.centerLeft,
          classes: 'col-8 offset-2',
          child: BootstrapSectionModel(
            key: 't2',
            containsForm: false,
            data: BSWidgetModel(
              bsWidget: BootstrapSectionLayerModel(
                children: [
                  BootstrapChildModel(
                    classes: 'col-10',
                    child: StyledComponentModel(
                        // scData: SCDataModel(
                        //   scType: StyledComponentEnum.IMAGE,
                        //   data: StyledImageModel(
                        //     url: 'https://i.ibb.co/PhFDqp2/like.png',
                        //   ),
                        // ),
                        ),
                  ),
                  BootstrapChildModel(
                    classes: 'col-2',
                    child: BootstrapSectionModel(
                      key: 't2',
                      height: 20,
                      containsForm: false,
                      data: BSWidgetModel(
                        bsWidget: BootstrapSectionLayerModel(
                          children: [
                            BootstrapChildModel(
                              classes: 'col-12',
                              height: 20,
                              child: StyledComponentModel(
                                scData: SCDataModel(
                                  scType: StyledComponentEnum.IMAGE,
                                  data: StyledImageModel(
                                    url: 'https://i.ibb.co/PhFDqp2/like.png',
                                  ),
                                ),
                              ),
                            ),
                            BootstrapChildModel(
                              classes: 'col-12',
                              height: 20,
                              child: StyledComponentModel(
                                scData: SCDataModel(
                                  scType: StyledComponentEnum.IMAGE,
                                  data: StyledImageModel(
                                    url: 'https://i.ibb.co/PhFDqp2/like.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
        ),
      ),
      containsForm: false,
    )
  ];
}
