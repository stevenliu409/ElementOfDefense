//
//  body.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"
#import "GameObj.h"
@interface body : GameObj{
    
}

+(id) makeBody:(NSString*) dir;
-(id) initBody:(NSString*) dir;
-(id) initBodyWithFn:(NSString*) fname;
+(id) makeBodyWithFn:(NSString*) fname;
@property(assign) int speed;
@property(assign) int health;
@property(assign) int attack;
@property(assign) int shield;
@property(nonatomic, retain) CCAnimation* currentAni;

-(BOOL) checkTouch:(CGPoint) pt;


@end
