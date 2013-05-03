//
//  HelloWorldLayer.m
//  Element Of Defense
//
//  Created by Steven Liu on 2013-04-21.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "mgsoldier.h"
#import "snipersoldier.h"
#import "leve1.h"
#import "tanksoldier.h"
#import "zombieHead.h"
#import "monster.h"
#import "vampireHead.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@interface HelloWorldLayer(PrivateMethod)
-(void) initUI;
-(void) initBg;
-(void) initSoldiers;
@end

@implementation HelloWorldLayer



// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		prefs = [NSUserDefaults standardUserDefaults];
		[self initUI];
        [self initSoldiers];
        [self scheduleUpdate];
        army = [[[NSMutableArray alloc] init]autorelease];
    }
	return self;
}

-(void) initBg{
    
    NSData* d = [prefs objectForKey:@"currentLevel"];
    leve1* l = [NSKeyedUnarchiver unarchiveObjectWithData:d];
    CCSprite* bg = [CCSprite spriteWithFile:l.bgdir];
    [bg setAnchorPoint:CGPointMake(0, 0)];
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    
    zombieHead* zhead = [zombieHead makeZhead];
    //zhead.position = ccp(size.width/2,size.height/2);
    //[self addChild:zhead z:2];
    zombieHead* zhead1 = [zombieHead makeZhead];
    vampireHead* vhead = [vampireHead makevampireHead];
    monster* m = [monster makeMonster:zhead mhead:vhead];
    m.position = ccp(size.width/2,size.height/2);
    [self addChild:m z:2];
    
    [self addChild:bg z:1];

}


-(void) initSoldiers{
    s1 = [mgsoldier makeMg];
    CGSize size = [[CCDirector sharedDirector] winSize];
    s1.position = ccp(size.width/2,size.height/2);
    s1.scaleX = 75/s1.contentSize.width;
    s1.scaleY = 75/s1.contentSize.height;
    [self addChild:s1 z:2];
    
    snipersoldier* s2 = [snipersoldier makeSniper];
    s2.position = ccp(size.width/2,size.height/2 - 80);
    s2.scaleX = 75/s2.contentSize.width;
    s2.scaleY = 75/s2.contentSize.height;
    [self addChild:s2 z:2];
    
    tanksoldier* s3 = [tanksoldier makeTankSoldier];
    s3.position = ccp(size.width/2 - 80,size.height/2 - 80);
    s3.scaleX = 75/s3.contentSize.width;
    s3.scaleY = 75/s3.contentSize.height;
    [self addChild:s3 z:2];
}

-(void) initUI{
    [self initBg];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}


-(void) update:(ccTime*) dt{
    [s1 updateSoldier:dt];
    if(s1.dead){
        [self removeChild:s1 cleanup:YES];
    }
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
