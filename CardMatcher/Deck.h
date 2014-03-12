@import Foundation;
#import "Card.h"

@interface Deck : NSObject

    - (void)addCard: (Card *)card;
    - (void)addCardAtTop: (Card *)card;

    - (Card *)drawRandomCard;

@end