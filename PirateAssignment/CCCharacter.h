//
//  CCCharacter.h
//  PirateAssignment
//
//  Created by Brown Magic on 9/4/14.
//  Copyright (c) 2014 codeHatcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"


@interface CCCharacter : NSObject
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
