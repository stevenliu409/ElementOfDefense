//
//  tanksoldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-03.
//
//

#import "soldier.h"


@interface tanksoldier : soldier
@property (nonatomic,assign) CCSprite *mySprite;

+(id) makeTankSoldier;
-(id) initTankSoldier;

@end
