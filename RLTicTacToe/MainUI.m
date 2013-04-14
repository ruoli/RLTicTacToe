//
//  MainUI.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 04/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "MainUI.h"
#import "GameBoardVC.h"
#import "GameCenterManager.h"
#import "AppSpecificValues.h"
@interface MainUI ()

@end

@implementation MainUI

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.currentLeaderBoard = kLeaderboardID;
    self.currentScore = 0;
    if ([GameCenterManager isGameCenterAvailable]) {
        self.gameCenterManager = [[GameCenterManager alloc] init];
        self.gameCenterManager.gameCenterDelegate = self;
        [self.gameCenterManager authenticateLocalUser];
    } else {
        // The current device does not support Game Center.
    }}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)increaseBtn:(id)sender {
    self.currentScore = self.currentScore +1;
    self.score.text = [NSString stringWithFormat:@"%lld", self.currentScore];
    [self checkAchievements];
}

-(void)checkAchievements
{
    NSString* identifier = NULL;
    double percentComplete = 0;
    switch(self.currentScore)
    {
        case 10:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 100.0;
            break;
        }
    }
    if(identifier!= NULL)
    {
        [self.gameCenterManager submitAchievement: identifier percentComplete: percentComplete];
    }
}

- (IBAction)submitBtn:(id)sender {
    if (self.score > 0 ) {
        [self.gameCenterManager reportScore:self.currentScore forCategory:self.currentLeaderBoard];
    }
}

- (IBAction)showlbBtn:(id)sender {
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != NULL)
    {
        leaderboardController.category = self.currentLeaderBoard;
        leaderboardController.timeScope = GKLeaderboardTimeScopeWeek;
        /*three time scope:
        GKLeaderboardTimeScopeToday
        GKLeaderboardTimeScopeWeek
        GKLeaderboardTimeScopeAllTime
         */
        leaderboardController.leaderboardDelegate = self;
        [self presentModalViewController: leaderboardController animated: YES];
    }
}

-(void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showAbtn:(id)sender {
    GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
    if (achievements != NULL) {
        achievements.achievementDelegate = self;
        [self presentModalViewController:achievements animated:YES];
    }
}

-(void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)resetBtn:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to reset your score and achievements?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Reset"
                                                    otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [gameCenterManager resetAchievements];
        self.currentScore = 0;
        self.score.text = [NSString stringWithFormat:@"%lld", self.currentScore];
    }
}

-(void)achievementSubmitted:(GKAchievement *)ach error:(NSError *)error
{
    if((error == NULL) && (ach != NULL))
    {
        if (ach.percentComplete == 100.0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement Earned!"
                                                            message:(@"%@", ach.identifier)
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else
    {
        NSLog(@"something");
    }
}



//proper game ui
- (IBAction)segueAction:(id)sender {
    if ([(UIButton *)sender isEqual:self.singleVSNpc]) {
        [self performSegueWithIdentifier:@"singleVSNpcSegue" sender:self];
    }
    else if([(UIButton *)sender isEqual:self.singleVSYourself])
    {
        [self performSegueWithIdentifier:@"singleVSYourself" sender:self];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"singleVSNpcSegue"]) {
        self.npcShouldPlay = true;
        GameBoardVC * gbvc = [segue destinationViewController];
        gbvc.npcShouldPlay = self.npcShouldPlay;
        
    }
    else if ([segue.identifier isEqualToString:@"singleVSYourself"])
    {
        self.npcShouldPlay = false;
        GameBoardVC * gbvc = [segue destinationViewController];
        gbvc.npcShouldPlay = self.npcShouldPlay;
    }
}
- (void)viewDidUnload {
    [self setSingleVSNpc:nil];
    [self setSingleVSYourself:nil];
    [self setMultiVSOthers:nil];
    [self setScore:nil];
    [super viewDidUnload];
}
@end
