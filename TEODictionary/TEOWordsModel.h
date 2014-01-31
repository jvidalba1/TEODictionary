//
//  TEOWordsModel.h
//  TEODictionary
//
//  Created by Mateo Vidal on 30/01/14.
//  Copyright (c) 2014 Mateo Vidal. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface TEOWordsModel : NSObject

@property (strong) NSDictionary *words;

-(NSArray *) letters;
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex; // Letra que está en la posición aLetterIndex
-(NSArray *) wordsAtIndex:(NSInteger) anIndex; // Array de palabras

-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex;

@end
