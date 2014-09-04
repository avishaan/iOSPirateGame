//
//  CCFactory.h
//  PirateAssignment
//
//  Created by Brown Magic on 9/3/14.
//  Copyright (c) 2014 codeHatcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject
- (NSArray *)tiles;
- (CCCharacter *)character;
- (CCBoss *)boss;

@end
