//
//  DefinitionViewController.h
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordsTableViewController.h"

@interface DefinitionViewController : UIViewController<UIWebViewDelegate, WordsTableViewControllerDelegate, UISplitViewControllerDelegate>

// Los IBOutlets, es decir aquellas vistas que hemos definido en el
// interface builder (el xib)
@property (strong) IBOutlet UIWebView *browser;
@property (strong) IBOutlet UIActivityIndicatorView *activityView;

// El modelo es simplemente una palabra
@property (copy) NSString *wordModel;

// Lo inicializamos pasándole el modelo
-(id) initWithModel:(NSString *) aModel;

// Método que crea la NSURLRequest para la definicón de una palabra
-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord;

@end
