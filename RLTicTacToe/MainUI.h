//
//  MainUI.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 04/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"

@interface MainUI : UIViewController <UIActionSheetDelegate,GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate>
{
    GameCenterManager *gameCenterManager;
    int64_t currentScore;
    NSString * currentLeaderBoard;
}
@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) NSString* currentLeaderBoard;

@property (weak, nonatomic) IBOutlet UIButton *singleVSNpc;
@property (weak, nonatomic) IBOutlet UIButton *singleVSYourself;
@property (weak, nonatomic) IBOutlet UIButton *multiVSOthers;

@property(assign,nonatomic)BOOL npcShouldPlay;


@property (weak, nonatomic) IBOutlet UILabel *score;
- (IBAction)increaseBtn:(id)sender;
- (IBAction)submitBtn:(id)sender;
- (IBAction)showlbBtn:(id)sender;
- (IBAction)showAbtn:(id)sender;
- (IBAction)resetBtn:(id)sender;
- (void) checkAchievements;


- (IBAction)segueAction:(id)sender;
@end
