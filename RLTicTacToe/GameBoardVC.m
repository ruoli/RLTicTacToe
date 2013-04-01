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
        [self.gridModel addItemToGridOnX:0 OnY:0];
        
    }
    
}
- (IBAction)topMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:1] isEqual:@"empty"]) {
        [self.gridModel addItemToGridOnX:0 OnY:1];
        
    }
}
- (IBAction)topRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:0 onCol:2] isEqual:@"empty"]) {
        [self.gridModel addItemToGridOnX:0 OnY:2];
        
    }

}
- (IBAction)midLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:0] isEqual:@"empty"]) {
        [self.gridModel addItemToGridOnX:1 OnY:0];
        
    }
}
- (IBAction)midMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:1] isEqual:@"empty"]) {
        [self.gridModel addItemToGridOnX:1 OnY:1];

    }

}
- (IBAction)midRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:1 onCol:2] isEqual:@"empty"]) {
        [self.gridModel addItemToGridOnX:1 OnY:2];

    }
}
- (IBAction)buttonLeftAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:0] isEqual:@"empty"]) {
        [self drawItemToBoardOnX:2 OnY:0 WithImageButton:(UIButton *)sender];
    }
}
- (IBAction)buttonMidAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:1] isEqual:@"empty"]) {
        [self drawItemToBoardOnX:2 OnY:1 WithImageButton:(UIButton *)sender];
    }
}
- (IBAction)buttonRightAction:(id)sender {
    if ([[self.gridModel getItemFromMapOnRow:2 onCol:2] isEqual:@"empty"]) {
        [self drawItemToBoardOnX:2 OnY:2 WithImageButton:(UIButton *)sender];
    }
}

- (void)drawItemToBoardOnX:(NSUInteger)x
                       OnY:(NSUInteger)y
           WithImageButton:(UIButton *)btn
{
    [btn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:x onColumn:y withItem:@"X"];
  
}


@end
