//
//  DieLabel.h
//  Farkle
//
//  Created by David Warner on 5/21/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate

-(void)didChooseDie:(id)DieLabel;

@end

@interface DieLabel : UILabel


@property id<DieLabelDelegate> delegate;

@property (readonly) NSString *sideLabel;

-(void)roll;


@end
