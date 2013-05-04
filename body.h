//
//  body.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"

@interface body : CCSprite{
    
}

+(id) makeBody:(NSString*) dir;
-(id) initBody:(NSString*) dir;

@property(assign) int speed;
@property(assign) int health;
@property(assign) int attack;
@property(assign) int sheid;

-(BOOL) checkTouch:(CGPoint) pt;


@end
