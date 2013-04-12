//
//  MainUI.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 04/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "MainUI.h"
#import "GameBoardVC.h"
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    [super viewDidUnload];
}
@end
