//
//  mgsoldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"

@interface mgsoldier : soldier
@property (nonatomic,assign) CCSprite *mySprite;

+(id) makeMg;
-(id) initMg;

@end
