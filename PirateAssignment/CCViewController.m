//
//  CCViewController.m
//  PirateAssignment
//
//  Created by Brown Magic on 9/3/14.
//  Copyright (c) 2014 codeHatcher. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  CCFactory *factory = [[CCFactory alloc] init];
  self.tiles = [factory tiles];
  self.character = [factory character];
  
  self.currentPoint = CGPointMake(0, 0);
  NSLog(@"%@", self.tiles);
 
  [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0 boss:nil];
  [self updateTile];
  [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
  CCTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
  [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect boss:tile.boss];
  if (self.character.health <= 0){
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death is Certain" message:@"You have died, restart" delegate:nil cancelButtonTitle:@"I accept my fate!" otherButtonTitles:nil, nil];
    [alertView show];
  } else if (tile.boss != nil && tile.boss.health <= 0){
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You killed boss" message:@"You Win" delegate:nil cancelButtonTitle:@"Restart!" otherButtonTitles:nil, nil];
    [alertView show];
  }
  [self updateTile];
  
}

- (IBAction)northButtonPressed:(UIButton *)sender {
  self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
  [self updateTile];
  [self updateButtons];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
  self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
  [self updateTile];
  [self updateButtons];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
  self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
  [self updateTile];
  [self updateButtons];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
  self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
  [self updateTile];
  [self updateButtons];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
  self.character = nil;
  self.tiles = nil;
  [self viewDidLoad];
}
- (void)updateTile{
  CCTile *tileModel = [[self.tiles objectAtIndex: self.currentPoint.x] objectAtIndex: self.currentPoint.y];
  self.storyLabel.text = tileModel.story;
  self.backgroundImageView.image = tileModel.backgroundImage;
  self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
  self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
  self.armorLabel.text = self.character.armor.name;
  self.weaponLabel.text = self.character.weapon.name;
  //set action button title
  [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

- (void)updateButtons{
  self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
  self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
  self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
  self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}
-(BOOL)tileExistsAtPoint: (CGPoint)point{
  if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
    return false;
  } else {
    return true;
  }
}

- (void)updateCharacterStatsForArmor: (CCArmor *)armor withWeapons:(CCWeapon *)weapon withHealthEffect:(int)healthEffect boss:(CCBoss *)boss{
  if (armor != nil){
    self.character.health = self.character.health - self.character.armor.health + armor.health;
    self.character.armor = armor;
  } else if (weapon != nil){
    self.character.damage = self.character.damage - self.character.weapon.damage +
      weapon.damage;
    self.character.weapon = weapon;
  } else if (boss != nil){
    //have boss inflict it's health effect on the character
    self.character.health = self.character.health + boss.healthEffect;
    //have character inflict it's health effect on the boss
    boss.health = boss.health - self.character.damage;
    NSLog(@"boss at %i, char at %i", boss.health, self.character.health);
  }
  else if (healthEffect != 0){
    self.character.health = self.character.health + healthEffect;
  } else {
    self.character.health = self.character.health + self.character.armor.health;
    self.character.damage = self.character.damage + self.character.weapon.damage;
  }
}

@end
