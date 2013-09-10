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
    NSString* fdis;
    NSString* ffn;
}

+(id) makeBody:(NSString*) dir;
-(id) initBody:(NSString*) dir;
-(id) initBodyWithBody:(body*) b;
+(id) makeBodyWithBody:(body*) b;
-(id) initBodyWithFn:(NSString*) fname;
+(id) makeBodyWithFn:(NSString*) fname;
@property(assign) int speed;
@property(assign) int health;
@property(assign) int attack;
@property(assign) int shield;
@property(nonatomic, retain) CCAnimation* currentAni;
@property(copy, nonatomic) NSString* fdir;
@property(copy, nonatomic) NSString* fdis;
@property(copy, nonatomic) NSString* ffn;

-(BOOL) checkTouch:(CGPoint) pt;


@end
