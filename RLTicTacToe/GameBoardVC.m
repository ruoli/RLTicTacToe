//
//  ViewController.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "GameBoardVC.h"

@interface GameBoardVC ()

@end

@implementation GameBoardVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	//a centered and stretched image
	UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"gamegrid.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.gridModel = [[GridModel alloc] init];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTopLeftBtn:nil];
    [self setTopMidBtn:nil];
    [self setTopRightBtn:nil];
    [self setMidLeftBtn:nil];
    [self setMidMidBtn:nil];
    [self setMidRightBtn:nil];
    [self setButtonLeftBtn:nil];
    [self setButtonMidBtn:nil];
    [self setButtonRightBtn:nil];
    [super viewDidUnload];
}

- (IBAction)topLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :0 :(UIButton*)sender];
    }
    
}
- (IBAction)topMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :1 :(UIButton*)sender];
    }
}
- (IBAction)topRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :2 :(UIButton*)sender];
    }

}
- (IBAction)midLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :0 :(UIButton*)sender];
    }
}
- (IBAction)midMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :1 :(UIButton*)sender];
    }

}
- (IBAction)midRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :2 :(UIButton*)sender];
    }
}
- (IBAction)buttonLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :0 :(UIButton*)sender];
    }
}
- (IBAction)buttonMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :1 :(UIButton*)sender];
    }
}
- (IBAction)buttonRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :2 :(UIButton*)sender];
    }
}



-(void)gameStatusOberser:(NSUInteger)x :(NSUInteger)y :(UIButton *)btn
{
    if (![self isRatAlreadyHasFood:x :y]) {
        [self.gridModel addItemToGridOnX:x OnY:y];
        [self drawImageToBoardWithItem:self.gridModel.foodOfGui WithImageButton:btn];
        [self winningMessage];
        [self.gridModel isGameEndedCleanMapCache];
        if (self.gridModel.gameEnd) {
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                UIAlertView *alert;
                sleep(3);
                alert = [[UIAlertView alloc] initWithTitle:@"Game Ended!" message:@"You may play again, or quit :P" delegate:nil cancelButtonTitle:@"Play Again!" otherButtonTitles:@"Quit!", nil];
                

                dispatch_async(dispatch_get_main_queue(), ^{
                    [alert show];
                });
            });
        }
    }
}

-(BOOL)isRatAlreadyHasFood:(NSUInteger)x :(NSUInteger)y
{
    return (![[self.gridModel getItemFromMapOnRow:x onCol:y] isEqualToString:@"empty"]);
}

- (void)drawImageToBoardWithItem:(NSString *)item
                 WithImageButton:(UIButton *)btn
{
    if ([item isEqualToString:@"O"]) {
        [btn setImage:[UIImage imageNamed:@"bean.png"] forState:UIControlStateNormal];
    }else if([item isEqualToString:@"X"]){
        [btn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    }
}

-(void)winningMessage
{
    if ([[self.gridModel checkWinner] isEqualToString:@"O is the winner"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOU WIN!" message:@"Rat eats bean" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([[self.gridModel checkWinner] isEqualToString:@"X is the winner"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YOU WIN!" message:@"Rat eats cheese" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([[self.gridModel checkWinner] isEqualToString:@"Draw Game"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Winner!" message:@"Draw Game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
