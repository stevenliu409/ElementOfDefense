//
//  monster.h
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "CCSprite.h"

@interface monster : CCSprite{
    
}


@property(nonatomic, retain) CCSprite* body;
@property(nonatomic, retain) CCSprite* head;


+(id) makeMonster:(CCSprite*) b mhead:(CCSprite*) h;
-(id) initMonster:(CCSprite*) b mhead:(CCSprite*) h;

@end
