//
//  snipersoldier.h
//  Element Of Defense
//
//  Created by Steven Liu on 2013-05-02.
//
//

#import "soldier.h"

@interface snipersoldier : soldier
@property (nonatomic,assign) CCSprite *mySprite;
+(id) makeSniper;
-(id) initSniper;


@end
