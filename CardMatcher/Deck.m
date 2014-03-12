#import "Deck.h"

@interface Deck()
    @property (strong, nonatomic) NSMutableArray * cards;
@end

@implementation Deck

    - (NSMutableArray *)cards {
        if (!_cards) {
            _cards = [[NSMutableArray alloc] init];
        }
        return _cards;
    }

    - (void)addCard: (Card *)card {
        [self.cards addObject:card];
    }

    - (void)addCardAtTop: (Card *)card {
        [self.cards insertObject:card atIndex:0];
    }


    - (Card *)drawRandomCard {
        Card *randomCard = nil;
        if ([self.cards count]) {
            unsigned index = arc4random()%[self.cards count];
            randomCard = self.cards[index];
            [self.cards removeObjectAtIndex:index];
        }
        return randomCard;
    }

@end
