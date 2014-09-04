//
//  CCFactory.m
//  PirateAssignment
//
//  Created by Brown Magic on 9/3/14.
//  Copyright (c) 2014 codeHatcher. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

- (NSArray *)tiles{
  
  CCTile *tile1 = [[CCTile alloc] init];
  tile1.story = @"We need a fearless leader such as yourself to undertake a voyage. Would you like a blunted sword to get started?";
  tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
  tile1.weapon = [CCWeapon new];
  tile1.weapon.name = @"Blunted Sword";
  tile1.weapon.damage = 12;
  tile1.actionButtonName = @"Take Sword";
  
  CCTile *tile2 = [[CCTile alloc] init];
  tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
  tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpg"];
  tile2.armor = [CCArmor new];
  tile2.armor.name = @"Steel Armor";
  tile2.armor.health = 8;
  tile2.actionButtonName = @"Take Armor";
  
  CCTile *tile3 = [[CCTile alloc] init];
  tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
  tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
  tile3.healthEffect = 12;
  tile3.actionButtonName  = @"Stop at the dock";
  
  NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
  [firstColumn addObject: tile1];
  [firstColumn addObject: tile2];
  [firstColumn addObject: tile3];
  
  CCTile *tile4 = [[CCTile alloc] init];
  tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
  tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
  tile4.armor = [CCArmor new];
  tile4.armor.name = @"Parrot Armor";
  tile4.armor.health = 20;
  tile4.actionButtonName = @"Adopt Parrot";
  
  CCTile *tile5 = [[CCTile alloc] init];
  tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
  tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpg"];
  tile5.weapon = [CCWeapon new];
  tile5.weapon.name = @"Parrot Pistol";
  tile5.weapon.damage = 17;
  tile5.actionButtonName = @"Take Pistol";
  
  
  CCTile *tile6 = [[CCTile alloc] init];
  tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
  tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
  tile6.healthEffect = -22;
  tile6.actionButtonName = @"Walk the Plank";
  
  NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
  [secondColumn addObject:tile4];
  [secondColumn addObject:tile5];
  [secondColumn addObject:tile6];
  
  CCTile *tile7 = [[CCTile alloc] init];
  tile7.story = @"7 You sight a pirate battle off the coast";
  tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpg"];
  tile7.healthEffect = 8;
  tile7.actionButtonName = @"Join Battle";
  
  CCTile *tile8 = [[CCTile alloc] init];
  tile8.story = @"8 The legend of the deep, the mighty kraken appears";
  tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
  tile8.healthEffect = -46;
  tile8.actionButtonName = @"Fight the Kraken";
  
  CCTile *tile9 = [[CCTile alloc] init];
  tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
  tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpg"];
  tile9.healthEffect = 20;
  tile9.actionButtonName = @"Take Treasure";
  
  NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
  [thirdColumn addObject:tile7];
  [thirdColumn addObject:tile8];
  [thirdColumn addObject:tile9];
  
  CCTile *tile10 = [[CCTile alloc] init];
  tile10.story = @"10 A group of pirates attempts to board your ship";
  tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
  tile10.healthEffect = -15;
  tile10.actionButtonName = @"Attack Pirates!";
  
  CCTile *tile11 = [[CCTile alloc] init];
  tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
  tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpg"];
  tile11.healthEffect = -7;
  tile11.actionButtonName = @"Swim Deep";
  
  CCTile *tile12 = [[CCTile alloc] init];
  tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
  tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpg"];
  tile12.healthEffect = -15;
  tile12.actionButtonName = @"Fight Boss";
  tile12.boss = [CCBoss new];
  tile12.boss.health = 60;
  tile12.boss.healthEffect = -15;
  
  NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
  [fourthColumn addObject:tile10];
  [fourthColumn addObject:tile11];
  [fourthColumn addObject:tile12];
  
  NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
  
  return tiles;
}

-(CCCharacter *)character
{
  CCCharacter *character = [CCCharacter new];
  character.health = 100;
  character.armor = [CCArmor new];
  character.armor.name = @"Cloak";
  character.weapon = [CCWeapon new];
  character.weapon.name = @"Fists";
  character.weapon.damage = 10;
  
  return character;
}
- (CCBoss*)boss{
  CCBoss *boss = [CCBoss new];
  boss.health = 65;
  return boss;
}
@end
