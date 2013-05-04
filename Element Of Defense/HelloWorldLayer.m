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
#import "leve1.h"
#import "tanksoldier.h"
#import "Bullet.h"
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
@synthesize cache;


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
static HelloWorldLayer* level;
+(HelloWorldLayer*) getLevel{
    return level;
}

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
        level = self;
		prefs = [NSUserDefaults standardUserDefaults];
        cache = [[BulletCache alloc] init];
        self.isTouchEnabled = YES;
        [self addChild:cache z:2];
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
    
    [self addChild:bg z:1];

}


-(void) initSoldiers{
    s1 = [mgsoldier makeMg];
    CGSize size = [[CCDirector sharedDirector] winSize];
    s1.position = ccp(size.width/2-80,size.height/2);
    s1.scaleX = 75/s1.contentSize.width;
    s1.scaleY = 75/s1.contentSize.height;
    [self addChild:s1 z:2];
    
    s2 = [snipersoldier makeSniper];
    s2.position = ccp(size.width/2-150,size.height/2 - 80);
    s2.scaleX = 75/s2.contentSize.width;
    s2.scaleY = 75/s2.contentSize.height;
    [self addChild:s2 z:2];


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
    [army release];
	[super dealloc];
}


-(void) update:(ccTime) dt{
    /*[s1 updateSoldier:dt :s1.speed];
    [s2 updateSoldier:dt :s2.speed];
    [s3 updateSoldier:dt :s3.speed];
    if(s1.dead){
        [self removeChild:s1 cleanup:YES];
    }*/
    //[s1 updateSoldier:dt];
    [s1 updateSoldier:dt];
    [s2 updateSoldier:dt];
}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touches!");
    
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
