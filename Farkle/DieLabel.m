//
//  DieLabel.m
//  Farkle
//
//  Created by David Warner on 5/21/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel ()
@end

@implementation DieLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];

        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

-(NSString *)sideLabel
{
    return self.text;
}


-(IBAction)onTapped:(id)sender
{
    [self.delegate didChooseDie:self];
}


-(void)roll
{
    int x = arc4random_uniform(5) + 1;
    self.text = [NSString stringWithFormat:@"%i", x];
}





@end
