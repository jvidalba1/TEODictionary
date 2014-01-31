//
//  DefinitionViewController.h
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefinitionViewController : UITableViewController

@property (strong) IBOutlet UIWebView *browser;
@property (strong) IBOutlet UIActivityIndicatorView *activityView;
@property (copy) NSString *wordModel;

-(id) initWithModel:(NSString *) aModel;
-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord;

@end
