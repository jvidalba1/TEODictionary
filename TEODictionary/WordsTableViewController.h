//
//  WordsTableViewController.h
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TEOWordsModel.h"

/*
 * Para el uso del protocolo usamos el nombre de la clase
 * antes de definirla, aqui nos adelantamos y le decimos al
 * compilador que es una clase
 */
@class WordsTableViewController;

// Protocolo de delegado de WordsTableViewController.
// Informa a su delegado cual ha sido la palabra seleccionada.

@protocol WordsTableViewControllerDelegate

-(void) wordsTableViewController: (WordsTableViewController *) sender
                  didClickOnWord: (NSString *) aWord;
@end

@interface WordsTableViewController : UITableViewController

@property (strong) TEOWordsModel* wordsModel;
@property (weak) id<WordsTableViewControllerDelegate> delegate; // Delegado

-(id) initWithModel: (TEOWordsModel *) aModel;

@end
