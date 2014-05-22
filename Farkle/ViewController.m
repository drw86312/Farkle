//
//  ViewController.m
//  Farkle
//
//  Created by David Warner on 5/21/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieLabel1;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel2;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel3;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel4;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel5;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel6;

@property (strong, nonatomic) NSMutableArray *clickedLabels;
@property (strong, nonatomic) NSMutableArray *unclickedLabels;

@property (strong, nonatomic) NSMutableArray *clickedLabelsText;
@property (strong, nonatomic) NSMutableArray *unclickedLabelsText;

@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;

@property (weak, nonatomic) IBOutlet UILabel *player1IndicatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2IndicatorLabel;

@property BOOL player1Turn;

@property NSInteger p1turnScoreCounter;
@property NSInteger p2turnScoreCounter;

@property NSInteger p1overallScoreCounter;
@property NSInteger p2overallScoreCounter;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dieLabel1.delegate = self;
    self.dieLabel2.delegate = self;
    self.dieLabel3.delegate = self;
    self.dieLabel4.delegate = self;
    self.dieLabel5.delegate = self;
    self.dieLabel6.delegate = self;

    self.clickedLabels = [[NSMutableArray alloc] init];
    self.unclickedLabels = [[NSMutableArray alloc] initWithObjects:self.dieLabel1, self.dieLabel2, self.dieLabel3, self.dieLabel4, self.dieLabel5, self.dieLabel6,nil];

    self.clickedLabelsText = [[NSMutableArray alloc] init];

    self.unclickedLabelsText = [[NSMutableArray alloc] initWithObjects:self.dieLable.text, self.dieLabel2.text, self.dieLabel3.text, self.dieLabel4.text, self.dieLabel5.text, self.dieLabel6.text, nil];


    self.player1Turn = YES;

}

-(void)didChooseDie:(DieLabel *)label
{
    [self.clickedLabels addObject:label];
    [self.unclickedLabels removeObject:label];


    label.backgroundColor = [UIColor redColor];
}


- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    for (DieLabel *die in self.unclickedLabels) {
        [die roll];
    }
//    [self checkFarkle];

//    NSLog(@"%@, %@, %@, %@, %@, %@", [self.unclickedLabelsText objectAtIndex:0], [self.unclickedLabelsText objectAtIndex:1], [self.unclickedLabelsText objectAtIndex:2],[self.unclickedLabelsText objectAtIndex:3], [self.unclickedLabelsText objectAtIndex:4], [self.unclickedLabelsText objectAtIndex:5]);

        NSLog(@"%@, %@, %@, %@, %@, %@", [self.unclickedLabels objectAtIndex:0], [self.unclickedLabels objectAtIndex:1], [self.unclickedLabels objectAtIndex:2],[self.unclickedLabels objectAtIndex:3], [self.unclickedLabels objectAtIndex:4], [self.unclickedLabels objectAtIndex:5]);

}

- (IBAction)startGame:(id)sender
{
    self.player1Turn = YES;
    self.player1IndicatorLabel.backgroundColor = [UIColor redColor];
    self.player2IndicatorLabel.backgroundColor = [UIColor whiteColor];

}

//- (IBAction)logScore:(id)sender
//{
//    if (self.player1Turn)
//        {
//        self.player2IndicatorLabel.backgroundColor = [UIColor redColor];
//        self.player1IndicatorLabel.backgroundColor = [UIColor whiteColor];
//
//        self.p1turnScoreCounter = 0;
//            for (DieLabel *die in self.totalLabels) {
//                self.p1turnScoreCounter += [die.text intValue];
//                self.player1Score.text = [NSString stringWithFormat:@"%li", (long)self.p1turnScoreCounter];
//        }
//        self.player1Turn = !self.player1Turn;
//    }
//    else
//
//    {
//        self.player2IndicatorLabel.backgroundColor = [UIColor whiteColor];
//        self.player1IndicatorLabel.backgroundColor = [UIColor redColor];
//
//        self.p2turnScoreCounter = 0;
//        for (DieLabel *die in self.totalLabels) {
//            self.p2turnScoreCounter += [die.text intValue];
//            self.player2Score.text = [NSString stringWithFormat:@"%li", (long)self.p2turnScoreCounter];
//        }
//        self.player1Turn = !self.player1Turn;
//
//    }
//}
//
-(void)checkFarkle
{
    NSInteger x = 0;
    for (NSString *die in self.unclickedLabelsText) {
        if ([die  isEqual: @"1"]) {
            x = x + 1;
            if (x < 3) {
                NSLog(@"Farkle");
            }
        }
    }
}



@end
