//
//  DiceView.h
//  Dice
//
//  Created by Bruce on 14-7-2.
//  Copyright (c) 2014年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiceView : UIView

@property (nonatomic, strong) IBOutlet UIImageView *diceNo1View;
@property (nonatomic, strong) IBOutlet UIImageView *diceNo2View;
@property (nonatomic, strong) IBOutlet UIImageView *diceNo3View;
@property (nonatomic, strong) IBOutlet UIImageView *diceNo4View;
@property (nonatomic, strong) IBOutlet UIImageView *diceNo5View;
@property (nonatomic, strong) IBOutlet UIImageView *diceboxView;
@property (nonatomic, strong) IBOutlet UIImageView *diceboxBottomView;
@property (nonatomic, strong) IBOutlet UIImageView *desktopView;

@property (nonatomic, assign) int flag;


- (void)updateBox:(int)status;
- (void)updateDice:(NSArray *)points;

@end
