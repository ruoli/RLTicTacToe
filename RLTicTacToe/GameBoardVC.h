//
//  ViewController.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridModel.h"
#import "NSMutableArray+MultidimensionalAdditions.h"
#import "NPCMaker.h"

@interface GameBoardVC : UIViewController
//top
@property (weak, nonatomic) IBOutlet UIButton *topLeftBtn;
- (IBAction)topLeftAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *topMidBtn;
- (IBAction)topMidAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *topRightBtn;
- (IBAction)topRightAction:(id)sender;

//mid
@property (weak, nonatomic) IBOutlet UIButton *midLeftBtn;
- (IBAction)midLeftAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *midMidBtn;
- (IBAction)midMidAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *midRightBtn;
- (IBAction)midRightAction:(id)sender;

//button
@property (weak, nonatomic) IBOutlet UIButton *buttonLeftBtn;
- (IBAction)buttonLeftAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonMidBtn;
- (IBAction)buttonMidAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *buttonRightBtn;
- (IBAction)buttonRightAction:(id)sender;

@property(assign,nonatomic)BOOL npcShouldPlay;
@property(strong,nonatomic)GridModel *gridModel;

- (IBAction)goBackBtn:(id)sender;

- (IBAction)reset:(id)sender;



@end
