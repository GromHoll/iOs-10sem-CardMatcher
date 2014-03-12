#import "CardMatcherViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardMatcherViewController ()

    @property (weak, nonatomic) IBOutlet UILabel * flipLabel;
    @property (nonatomic) int flipCounter;
    @property (strong, nonatomic) PlayingCardDeck * deck;

@end

@implementation CardMatcherViewController

    - (PlayingCardDeck *)deck {
        if (!_deck) {
            _deck = [[PlayingCardDeck alloc] init];
        }
        return _deck;
    }

    - (void)setFlipCounter:(int)flipCounter {
        _flipCounter = flipCounter;
        self.flipLabel.text = [NSString stringWithFormat:@"Flip counter: %d", self.flipCounter];
    
    }

    - (IBAction)touchCardButton:(UIButton *)sender {
        if ([sender.currentTitle length]) {
            UIImage * cardImage = [UIImage imageNamed:@"CardBack"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            [sender setTitle: @"" forState:UIControlStateNormal];
        } else {
            UIImage * cardImage = [UIImage imageNamed:@"CardBlank"];
            [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
            Card * card = [self.deck drawRandomCard];
            [sender setTitle: card.contents forState:UIControlStateNormal];
        }
        self.flipCounter++;
    }


@end
