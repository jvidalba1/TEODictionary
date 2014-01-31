//
//  TEOWordsModel.m
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//

#import "TEOWordsModel.h"

@implementation TEOWordsModel

#pragma mark - Properties
@synthesize words;

#pragma mark -  Init
-(id) init{
    if (self = [super init]) {
        // Recordad que para que tengamos una URL válida, tanto en el dispositivo
        // iOS como en el simulador, tenemos que pedirsela al Bundle.
	// Tomado de the geek training, project explanation
        NSURL *urlToFile = [[NSBundle mainBundle] URLForResource:@"vocabwords"
                                                   withExtension:@"txt"];
        self.words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];
    }
    return self;
}

/*
 * De aquí para abajo fue tomado de la guía del proyecto 
 * en la pagina de agbo
 * Metodo para ordenar nuestro array
 */

#pragma mark - Metodos utiles
-(NSArray *) letters{
    
    // words es un NSDictionary y nos devuelve un NSArray de claves (en nuestro caso
    // son letras) que NO está ordenado.
    // Con sortedArrayUsinsSelector: obtenemos un nuevo NSArrya ordenado.
    // Para más info sobre cómo ordenar arrays, ver
    // http://www.cocoaosx.com/2011/06/10/sorting-objects-in-cocoa/
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

-(NSString *) letterAtIndex: (NSInteger) aLetterIndex{
    // Como letters ya nos devuelve un array ordenado, nos
    // limitamos a pillar el objeto que está en la posición
    // pedida
    return [[self letters] objectAtIndex:aLetterIndex];
}

-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex{
    
    // Primero obtenemos un NSArray de palabras que empiezan por
    // la letra que nos piden; luego obtenemos el objeto que está
    // en la posición deseada de ese NSArray.
    NSString *letter = [self letterAtIndex:aLetterIndex];
    NSArray *wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];
}

-(NSArray *) wordsAtIndex:(NSInteger)anIndex{
    
    // Obtenemos la letra deseada y luego el NSArray de palabras que
    // empiezan por dicha letra. Como NSDictionary devuelve dicho
    // NSArray desordenado, devolvemos una copia ordenada con
    // sortedArrayUsingSelector:
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}
@end
