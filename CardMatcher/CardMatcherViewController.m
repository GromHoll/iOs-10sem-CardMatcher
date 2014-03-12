//
//  CardMatcherViewController.m
//  CardMatcher
//
//  Created by Admin on 13.03.14.
//  Copyright (c) 2014 NTSU. All rights reserved.
//

#import "CardMatcherViewController.h"

@interface CardMatcherViewController ()

@end

@implementation CardMatcherViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        UIImage * cardImage = [UIImage imageNamed:@"CardBack"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle: @"" forState:UIControlStateNormal];
    } else {
        UIImage * cardImage = [UIImage imageNamed:@"CardBlank"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle: @"qwe" forState:UIControlStateNormal];
    }
}


@end
