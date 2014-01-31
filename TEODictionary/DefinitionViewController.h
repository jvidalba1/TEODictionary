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

# pragma mark - propiedades

@property (strong) IBOutlet UIWebView *browser;
@property (strong) IBOutlet UIActivityIndicatorView *activityView;

@property (copy) NSString *wordModel;

# pragma mark - metodos

-(id) initWithModel:(NSString *) aModel;
-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord;

@end
