//
//  DiceView.m
//  Dice
//
//  Created by Bruce on 14-7-2.
//  Copyright (c) 2014年 Bruce. All rights reserved.
//

#import "DiceView.h"

@interface DiceView () {
    
    int _flagY;
}

@end

@implementation DiceView

/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}
 */

- (void)updateDice:(NSArray *)points {
    
    [_diceNo1View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[0]]]];
    [_diceNo2View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[1]]]];
    [_diceNo3View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[2]]]];
    [_diceNo4View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[3]]]];
    [_diceNo5View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[4]]]];
}


- (void)updateBox:(int)status {
    
	
	if (status == 0) {
		
		_flag = _flag + 1;
		
		if (_flag > 22) {
			
			_flag = 22;
		}
		
	}
	
	if (status == 2) {
		
		_flag = _flag - 1;
		
		if (_flag < 1) {
			
			_flag = 1;
		}
		
	}
	
    
    if (_flag >= 15 && _flag <= 22) {
        
        UIImage *boxBottomImg = [UIImage imageNamed:[NSString stringWithFormat:@"dicebox-back-%d", (_flag)]];
        [_diceboxBottomView setImage:boxBottomImg];
    
    } else {
        
        [_diceboxBottomView setImage:nil];
    }

	
	UIImage *boxImg = [UIImage imageNamed:[NSString stringWithFormat:@"dicebox-%d", (_flag)]];
	[_diceboxView setImage:boxImg];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
	UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	//NSLog(@"x:%f,y:%f",point.x,point.y);
	
	
	if (point.y < _flagY) {
        
		if (abs((int)(point.y - _flagY)) > 2) {
			
			[self updateBox:0];
			_flagY = point.y;
		}
        
	} else {
		
		if (abs((int)(point.y - _flagY)) > 2) {
			
			[self updateBox:2];
			_flagY = point.y;
		}
	}
	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
	UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
	_flagY = point.y;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
