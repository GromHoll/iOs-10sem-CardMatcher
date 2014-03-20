#import "GameBoard.h"
#import "PlayingCardDeck.h"
#import "CardMatcher.h"

@interface GameBoard()
    @property (strong, nonatomic) NSMutableArray * cards;
    @property (strong, nonatomic) NSMutableArray * chosenCards;

    @property (strong, nonatomic) CardMatcher * cardMatcher;

    @property (nonatomic) NSInteger size;
    @property (nonatomic) NSInteger matchCount;

    - (void)resetGame;
    - (BOOL)hasMatches;
@end

@implementation GameBoard

    - (instancetype) initWithSize: (NSInteger)boardSize matchCount: (NSInteger)match {
        _size = boardSize;
        _matchCount = match;
        [self resetGame];
        return self;
    }

    - (NSMutableArray *)cards {
        if (!_cards) {
            _cards = [[NSMutableArray alloc] init];
        }
        return _cards;
    }

    - (NSMutableArray *)chosenCards {
        if (!_chosenCards) {
            _chosenCards = [[NSMutableArray alloc] init];
        }
        return _chosenCards;
    }

    - (CardMatcher *)cardMatcher {
        if (!_cardMatcher) {
            _cardMatcher = [[CardMatcher alloc] init];
        }
        return _cardMatcher;
    }

    - (void)resetGame {
        [self.cards removeAllObjects];
        Deck * deck = [[PlayingCardDeck alloc] init];
        for(NSUInteger i = 0; i < self.size; i++) {
            [self.cards addObject: [deck drawRandomCard]];
        }
        
        if (![self hasMatches]) {
            [self resetGame];
        }
    }

    - (BOOL)hasMatches {
        NSMutableArray * notMatched = [[NSMutableArray alloc] init];
        for (Card * card in self.cards) {
            if (!card.matched) {
                [notMatched addObject:card];
            }
        }
        return [self.cardMatcher match:notMatched] != 0;
    }

    - (Card *)getCardAtIndex: (int)index {
        return self.cards[index];
    }

    - (void)chooseCardAtIndex: (int)index; {
        Card * newChoosenCard = self.cards[index];
        if (!newChoosenCard.chosen && [self.chosenCards count] < self.matchCount) {
            [self.chosenCards addObject: newChoosenCard];
            newChoosenCard.chosen = YES;
            self.score--;
        }
    }

    - (void)findMatch {
        if ([self.chosenCards count] == self.matchCount) {
            int matchScore = [self.cardMatcher match:self.chosenCards];
            self.score += matchScore;
            
            for (Card * card in self.chosenCards) {
                card.chosen = (matchScore != 0);
                card.matched = (matchScore != 0);
            }
            [self.chosenCards removeAllObjects];
            
            if (![self hasMatches]) {
                [self resetGame];
            }
        }
    }


@end
