//
//  GameObj.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-16.
//
//

#import "CCSprite.h"

@interface GameObj : CCSprite{
    int health;
    int sstate;
    BOOL dead;
    id ani;
}
@property (assign) int health;
@property (assign) BOOL dead;
@property (assign) int sstate;
@property (nonatomic, retain) id ani;

-(void) changeState:(int) state;
-(CCAnimation*) loadAnimation :(NSString *)aniName fileName:(NSString*) fn;
@end
