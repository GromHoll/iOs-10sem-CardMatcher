#import "CardMatcher.h"
#import "PlayingCard.h"

@implementation CardMatcher

    - (int) match: (NSArray *)otherCard {
        int score = 0;
        
        for (int i = 0; i < [otherCard count] - 1; i++) {
            for (int j = i + 1; j < [otherCard count]; j++) {
                PlayingCard * firstCard = otherCard[i];
                PlayingCard * secondCard = otherCard[j];
                if (firstCard.rank == secondCard.rank) {
                    score += 13;
                }
                if ([firstCard.suit isEqual:secondCard.suit]) {
                    score += 4;
                }
            }
        }
        return score;
    }

@end
