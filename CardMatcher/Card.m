#import "Card.h"

@interface Card()

@end

@implementation Card

    - (int)match: (NSArray *)otherCards {
        int score = 0;
    
        for (Card * card in otherCards) {
            NSLog(@"Mathing %@ with %@", self.contents, card.contents);
            if ([card.contents isEqualToString:self.contents]) {
                score = 1;
            }
        }
        return score;
    }

@end
