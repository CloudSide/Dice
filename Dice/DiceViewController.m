//
//  DiceViewController.m
//  Dice
//
//  Created by Bruce on 14-7-2.
//  Copyright (c) 2014年 Bruce. All rights reserved.
//

#import "DiceViewController.h"
#import "DiceView.h"

@interface DiceViewController ()

@end

@implementation DiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [(DiceView *)[self view] setFlag:0];
    [(DiceView *)[self view] updateBox:0];
    [(DiceView *)[self view] updateDice:@[
        @1, @2, @3, @4, @5]];
    
    
    CGRect desktopFrame = [(DiceView *)[self view] desktopView].frame;
    desktopFrame.origin.y = self.view.frame.size.height - desktopFrame.size.height;
    [[(DiceView *)[self view] desktopView] setFrame:desktopFrame];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
