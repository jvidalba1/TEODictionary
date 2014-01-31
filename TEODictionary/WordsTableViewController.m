//
//  WordsTableViewController.m
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "WordsTableViewController.h"

@implementation WordsTableViewController

#pragma mark - properties
@synthesize wordsModel, delegate;

#pragma mark - init & memory
-(id) initWithModel:(TEOWordsModel *)aModel{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        self.wordsModel = aModel;
        self.title = @"English Vocabulary";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // El número de secciones es el número de palabras
    return [[self.wordsModel letters] count];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Le preguntamos al model el # de palabras que hay en una seccion
    return [[self.wordsModel wordsAtIndex:section] count];
}

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    // El título de la sección es la letra que está en la posición equivalente
    return [self.wordsModel letterAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Mostramos la palabra que está en la posición equivalente.
    cell.textLabel.text = [self.wordsModel wordAtIndex:indexPath.row
                                       inLetterAtIndex:indexPath.section];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Avisar al delegado la palabra que se toco
    NSString *touchedWord = [self.wordsModel wordAtIndex:indexPath.row
                                         inLetterAtIndex:indexPath.section];
    [self.delegate wordsTableViewController:self
                             didClickOnWord:touchedWord];
}

@end
