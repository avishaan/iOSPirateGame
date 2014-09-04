//
//  CCTile.h
//  PirateAssignment
//
//  Created by Brown Magic on 9/3/14.
//  Copyright (c) 2014 codeHatcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"
#import "CCBoss.h"

@interface CCTile : NSObject
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) CCWeapon *weapon;
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCBoss *boss;
@property (nonatomic) int healthEffect;

@end
