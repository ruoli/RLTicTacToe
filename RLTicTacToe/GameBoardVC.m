//
//  ViewController.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "GameBoardVC.h"

@interface GameBoardVC ()
@property(strong,nonatomic)NSMutableArray *gameButtonArray;
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

//top
- (IBAction)topLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :0 :(UIButton*)sender];
        [self npcMoves];
    }
    
}
- (IBAction)topMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :1 :(UIButton*)sender];
        [self npcMoves];
    }
}
- (IBAction)topRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:0 :2 :(UIButton*)sender];
        [self npcMoves];
    }
}

//mid
- (IBAction)midLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :0 :(UIButton*)sender];
        [self npcMoves];
    }
}
- (IBAction)midMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :1 :(UIButton*)sender];
        [self npcMoves];
    }

}
- (IBAction)midRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:1 :2 :(UIButton*)sender];
        [self npcMoves];
    }
}

//buttom
- (IBAction)buttonLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:0] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :0 :(UIButton*)sender];
        [self npcMoves];
    }
}
- (IBAction)buttonMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:1] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :1 :(UIButton*)sender];
        [self npcMoves];
    }
}
- (IBAction)buttonRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:2] isEqual:@"empty"]) {
        [self gameStatusOberser:2 :2 :(UIButton*)sender];
        [self npcMoves];
    }
}


//messy logic
-(void)initButtomMapForNpcMove
{
    self.gameButtonArray = [[NSMutableArray alloc] initWithX:3 withY:3];
    //top
    [self.gameButtonArray setObject:self.topLeftBtn withX:0 withY:0];
    [self.gameButtonArray setObject:self.topMidBtn withX:1 withY:0];
    [self.gameButtonArray setObject:self.topRightBtn withX:2 withY:0];
    //mid
    [self.gameButtonArray setObject:self.midLeftBtn withX:0 withY:1];
    [self.gameButtonArray setObject:self.midMidBtn withX:1 withY:1];
    [self.gameButtonArray setObject:self.midRightBtn withX:2 withY:1];
    //buttom
    [self.gameButtonArray setObject:self.buttonLeftBtn withX:0 withY:2];
    [self.gameButtonArray setObject:self.buttonMidBtn withX:1 withY:2];
    [self.gameButtonArray setObject:self.buttonRightBtn withX:2 withY:2];
}

-(void)npcMoves
{
    if ([[self.gridModel checkWinner] isEqualToString:@"No Winner"]) {
        NPCMaker *npc = [[NPCMaker alloc] init];
        int x,y;
        do {
            x = npc.npcOnX;
            y = npc.npcOnY;
        } while (![[self.gridModel getItemFromMapOnRow:x onCol:y] isEqualToString:@"empty"]);
        [self initButtomMapForNpcMove];
        UIButton *btn = [self.gameButtonArray getObjectInX:x withY:y];
        [self gameStatusOberser:x :y :btn];
    }
}


-(void)gameStatusOberser:(NSUInteger)x :(NSUInteger)y :(UIButton *)btn
{
    if (![self isRatAlreadyHasFood:x :y]) {
        [self.gridModel addItemToGridOnX:x OnY:y];
        [self drawImageToBoardWithItem:self.gridModel.foodOfGui WithImageButton:btn];
        [self winningMessage];
        [self.gridModel isGameEndedCleanMapCache];
//        if (self.gridModel.gameEnd) {
//            
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                UIAlertView *alert;
//                sleep(3);
//                alert = [[UIAlertView alloc] initWithTitle:@"Game Ended!" message:@"You may play again, or quit :P" delegate:nil cancelButtonTitle:@"Play Again!" otherButtonTitles:@"Quit!", nil];
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [alert show];
//                });
//            });
//        }
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OMG BEAN!" message:@"Rat eats bean" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([[self.gridModel checkWinner] isEqualToString:@"X is the winner"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OMG CHEESE!" message:@"Rat eats cheese" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([[self.gridModel checkWinner] isEqualToString:@"Draw Game"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Winner!" message:@"Draw Game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)goBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)reset:(id)sender {
    [self.gridModel cleanMap];
    [self.topLeftBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.topMidBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.topRightBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    
    [self.midLeftBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.midMidBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.midRightBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    
    [self.buttonLeftBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.buttonMidBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    [self.buttonRightBtn setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
}


@end
