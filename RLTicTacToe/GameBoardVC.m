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
    [self.topLeftBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:0 onColumn:0 withItem:@"X"];
    NSLog(@"at (0,0) is %@",[self.gridModel getItemFromMapOnRow:0 onCol:0]);
}
- (IBAction)topMidAction:(id)sender {
    [self.topMidBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:1 onColumn:0 withItem:@"X"];
    NSLog(@"at (1,0) is %@",[self.gridModel getItemFromMapOnRow:1 onCol:0]);
}
- (IBAction)topRightAction:(id)sender {
    [self.topRightBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:0 onColumn:2 withItem:@"X"];
    NSLog(@"at (0,2) is %@",[self.gridModel getItemFromMapOnRow:0 onCol:2]);

}
- (IBAction)midLeftAction:(id)sender {
    [self.midLeftBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:0 onColumn:1 withItem:@"X"];
    NSLog(@"at (0,1) is %@",[self.gridModel getItemFromMapOnRow:0 onCol:1]);
}
- (IBAction)midMidAction:(id)sender {
    [self.midMidBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:1 onColumn:1 withItem:@"X"];
    NSLog(@"at (1,1) is %@",[self.gridModel getItemFromMapOnRow:1 onCol:1]);

}
- (IBAction)midRightAction:(id)sender {
    [self.midRightBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:1 onColumn:2 withItem:@"X"];
    NSLog(@"at (1,2) is %@",[self.gridModel getItemFromMapOnRow:1 onCol:2]);
}
- (IBAction)buttonLeftAction:(id)sender {
    [self.buttonLeftBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:2 onColumn:0 withItem:@"X"];
    NSLog(@"at (2,0) is %@",[self.gridModel getItemFromMapOnRow:2 onCol:0]);
}
- (IBAction)buttonMidAction:(id)sender {
    [self.buttonMidBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:2 onColumn:1 withItem:@"X"];
    NSLog(@"at (2,1) is %@",[self.gridModel getItemFromMapOnRow:2 onCol:1]);
}
- (IBAction)buttonRightAction:(id)sender {
    [self.buttonRightBtn setImage:[UIImage imageNamed:@"cheese.png"] forState:UIControlStateNormal];
    [self.gridModel setItemOnRow:2 onColumn:2 withItem:@"X"];
    NSLog(@"at (2,2) is %@",[self.gridModel getItemFromMapOnRow:2 onCol:2]);
}
@end
