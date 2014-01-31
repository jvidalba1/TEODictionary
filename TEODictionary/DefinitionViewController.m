//
//  DefinitionViewController.m
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "DefinitionViewController.h"
#import "WordsTableViewController.h"

@implementation DefinitionViewController


# pragma mark - Definiciones de metodos del .h
-(id) initWithModel:(NSString *) aModel
{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        self.wordModel = aModel;
        self.title = self.wordModel;
    }
    return self;
}

/*
 * A partir de la palabra obtiene la NSURLRequest de la definición de la web site
 */
-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setBrowser:nil];
    [self setActivityView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Le decimos a la UIWebView que somos su delegado
    self.browser.delegate = self;
    // y cargamos la definición de la palabra
    [self.browser loadRequest:[self definitionRequestForWord:self.wordModel]];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    // La UIWebView ha terminado de cargar la definicón. ya podemos
    // dejar de animar la UIActivityView
    [self.activityView stopAnimating];
}

#pragma mark - WordsTableViewControllerDelegate
-(void) wordsTableViewController:(WordsTableViewController *)sender
                  didClickOnWord:(NSString *)aWord{
    
    // WordsTableViewController nos informa que el usuario ha tocado sobr euna palabra.
    // Lo que tenemos que hacer es cambiar nuestro modelo y actualizar la definición
    self.wordModel = aWord;
    self.title = self.wordModel;
    
    [self.activityView startAnimating];
    [self.browser loadRequest:[self definitionRequestForWord:self.wordModel]];
}

#pragma mark - UISplitViewControllerDelegate

/*
 * Para que el UISPlitView funcione correctamente cuando se cambia la 
 * orientación del dispositivo, es fundamental que el controlador de 
 * la derecha, es decir, el DefinitionViewController sea su delegado 
 * y que implemente los siguientes mensajes (tomado de The geek training)
 */
-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    
    // No hay controlador a la izquierda, se despliega pop-pup
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    
    // Quitarlo de la barra
    self.navigationItem.leftBarButtonItem = nil;
    
}

@end
