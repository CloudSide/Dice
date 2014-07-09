//
//  DiceViewController.m
//  Dice
//
//  Created by Bruce on 14-7-2.
//  Copyright (c) 2014年 Bruce. All rights reserved.
//

#import "DiceViewController.h"
#import "DiceView.h"

@interface DiceViewController () <UIAccelerometerDelegate>

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
    
    
    NSMutableArray *points = [NSMutableArray array];
    
    for (int i=0; i<6; i++) {
        
        int p = (arc4random() % 6) + 1;
        [points addObject:[NSNumber numberWithInt:p]];
    }
    
    [(DiceView *)[self view] updateDice:points];
    
    
    CGRect desktopFrame = [(DiceView *)[self view] desktopView].frame;
    desktopFrame.origin.y = self.view.frame.size.height - desktopFrame.size.height;
    [[(DiceView *)[self view] desktopView] setFrame:desktopFrame];
    
    UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
    acc.delegate = self;
    acc.updateInterval = 1.0 / 6.0;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//ACC DELEGATE

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    
	if (fabsf(acceleration.x) > 2.0 || fabsf(acceleration.y) > 2.0 || fabsf(acceleration.z) > 2.0) {
        
		[(DiceView *)[self view] shake:nil];
	}
}

@end
