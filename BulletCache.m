//
//  BulletCache.m
//  Element Of Defense
//
//  Created by Hua Dong on 13-05-03.
//
//

#import "BulletCache.h"
#import "Bullet.h"
@implementation BulletCache

-(id) init{
    if(self = [super init]){
        nextBullet = 0;
        batch = [CCSpriteBatchNode batchNodeWithFile:@"bullet.png"];
		[self addChild:batch];
        for (int i = 0; i < 1000; i++)
		{
			Bullet* bullet = [Bullet makeBullet];
			bullet.visible = NO;
			[batch addChild:bullet z:2];
		}
    }
    return self;
}

-(void)shootBulletFrom:(soldier *)s timer:(ccTime)dt{
    CCArray* bullets = [batch children];
    CCNode* node = [bullets objectAtIndex:nextBullet];
    Bullet* b = (Bullet*) node;
    if(!b.shoted){
        [b bulletAnimation:s timer:dt];
        nextBullet++;
        if(nextBullet > 999){
            nextBullet = 0;
        }
    }
}

-(CCArray*) getCache{
    return [batch children];
}

@end
