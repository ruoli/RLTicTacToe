//
//  MainUI.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 04/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainUI : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *singleVSNpc;
@property (weak, nonatomic) IBOutlet UIButton *singleVSYourself;
@property (weak, nonatomic) IBOutlet UIButton *multiVSOthers;


@property(assign,nonatomic)BOOL npcShouldPlay;

- (IBAction)segueAction:(id)sender;
@end
