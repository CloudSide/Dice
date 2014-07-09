//
//  DiceView.m
//  Dice
//
//  Created by Bruce on 14-7-2.
//  Copyright (c) 2014年 Bruce. All rights reserved.
//

#import "DiceView.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DiceView () {
    
    int _flagY;
    BOOL _isShake;
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

- (void)setIsShakeNo {

    _isShake = NO;
}

- (IBAction)shake:(id)sender {
    
    _flag = 0;
    [self updateBox:0];
    
    _isShake = YES;
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:-M_PI/32];
    shake.toValue = [NSNumber numberWithFloat:+M_PI/32];
    shake.duration = 0.1;
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 10;
    [self.diceboxView.layer addAnimation:shake forKey:@"shakeAnimation"];
    self.diceboxView.alpha = 1.0;
    
    /*
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction animations:^{
        
        //self.diceboxView.alpha = 0.0;   //透明度变0则消失
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            _isShake = NO;
        }
    }];
     */
    
    [self performSelector:@selector(setIsShakeNo) withObject:nil afterDelay:2.5];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"rolling" ofType:@"aiff"];
    NSError *error = nil;
    AVAudioPlayer *switchAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
    
    NSLog(@"%@", error);
    
    [switchAudio play];
    
}

- (void)updateDice:(NSArray *)points {
    
    [_diceNo1View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[0]]]];
    [_diceNo2View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[1]]]];
    [_diceNo3View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[2]]]];
    [_diceNo4View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[3]]]];
    [_diceNo5View setImage:[UIImage imageNamed:[NSString stringWithFormat:@"dice-%@", points[4]]]];
}


- (void)updateBox:(int)status {
    
    if (_isShake) {
        
        return;
    }
	
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
