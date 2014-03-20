#import "CardMatcherViewController.h"
#import "GameBoard.h"

@interface CardMatcherViewController ()
    @property (strong, nonatomic) IBOutletCollection(UIButton) NSArray * cardsButtons;
    @property (weak, nonatomic) IBOutlet UILabel * score;

    @property (strong, nonatomic) GameBoard * gameBoard;

    - (void)update;
    - (void)updateScore;
    - (void)updateCards;
    - (void)updateCard: (UIButton *)button;
@end

@implementation CardMatcherViewController

    - (GameBoard *)gameBoard {
        if (!_gameBoard) {
            _gameBoard = [[GameBoard alloc] initWithSize:9 matchCount:2];
        }
        return _gameBoard;
    }

    - (IBAction)touchCardButton:(UIButton *)sender {
        int index = [self.cardsButtons indexOfObject:sender];
        
        [self.gameBoard chooseCardAtIndex: index];
        [self updateCard: sender];
        [self.gameBoard findMatch];
        [self update];

    }

    - (void)updateScore {
        NSString * scoreText = [[NSString alloc] initWithFormat: @"Score: %i", self.gameBoard.score];
        [self.score setText: scoreText];
    }
    
    - (void)updateCards {
        for (UIButton * cardButton in self.cardsButtons) {
            [self updateCard:cardButton];
        }
    }

    - (void)updateCard: (UIButton *)button {
        int index = [self.cardsButtons indexOfObject:button];
        Card * card = [self.gameBoard getCardAtIndex:index];
        if (card.isChosen || card.isMatched) {
            UIImage * cardImage = [UIImage imageNamed:@"CardBlank"];
            [button setBackgroundImage:cardImage forState:UIControlStateNormal];
            [button setTitle: card.contents forState:UIControlStateNormal];
        } else {
            UIImage * cardImage = [UIImage imageNamed:@"CardBack"];
            [button setBackgroundImage:cardImage forState:UIControlStateNormal];
            [button setTitle: @"" forState:UIControlStateNormal];
        }
    }

    - (void)update {
        [self updateScore];
        [self updateCards];
    }

@end
