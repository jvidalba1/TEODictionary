//
//  WordsTableViewController.h
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TEOWordsModel.h"

// Como vamos a usar el nombre de la variable antes de definirla,
// tenemos que "adelantarle" al compilador que WordsTableViewController
// es una clase.
@class WordsTableViewController;

// Protocolo de delegado de WordsTableViewController.
// Simplemente informa a su delegado cual ha sido la palabra seleccionada
@protocol WordsTableViewControllerDelegate
-(void) wordsTableViewController: (WordsTableViewController *) sender
                  didClickOnWord: (NSString *) aWord;
@end

@interface WordsTableViewController : UITableViewController
// El modelo
@property (strong) TEOWordsModel* wordsModel;
// El delegado
@property (weak) id<WordsTableViewControllerDelegate> delegate;

// El inicializador. Se le pasa el modelo
-(id) initWithModel: (TEOWordsModel *) aModel;
@end
