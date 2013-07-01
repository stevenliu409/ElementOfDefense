//
//  monster.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"
#import "body.h"
@interface monster : CCSprite{
    
}


@property(nonatomic, retain) CCSprite* mbody;
@property(nonatomic, retain) CCSprite* mhead;


+(id) makeMonster:(CCSprite*) b mhead:(CCSprite*) h;
-(id) initMonster:(CCSprite*) b mhead:(CCSprite*) h;
+(id) newMonster;
-(BOOL) addBody:(body*) b;
-(BOOL) checkMonster;
-(body*) gethead;
-(body*) getbody;
@end
