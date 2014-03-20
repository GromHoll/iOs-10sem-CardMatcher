#import "Card.h"


@interface GameBoard : NSObject
    @property (nonatomic) NSUInteger score;

    - (instancetype) initWithSize: (NSInteger)boardSize matchCount:(NSInteger)match;

    - (void)findMatch;
    - (Card *)getCardAtIndex: (int)index;
    - (void)chooseCardAtIndex: (int)index;
@end
