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
#import "sArmy.h"
#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@interface HelloWorldLayer(PrivateMethod)
-(void) initUI;
-(void) initBg;
-(void) initSoldiers;
-(void) initBody;
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
        bodyCache = [[NSMutableArray alloc] init];
        monsterCache = [[NSMutableArray alloc] init];
        [self addChild:cache z:2];
		[self initUI];
        //[self initSoldiers];
        [self initBody];
        [self scheduleUpdate];
        army = [[[NSMutableArray alloc] init]autorelease];
        self.isTouchEnabled = YES;
        
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
    sArmy* my_army = [sArmy makeMGArmy:5];
    [my_army call_MG_reinforcements:2 layer:self];

}


-(void) initBody{
    vampireHead* vhead = [vampireHead makevampireHead];
    vhead.position = CGPointMake(120,120);
    [self addChild:vhead z:2];
    [bodyCache addObject:vhead];
    
    zombieHead* zhead = [zombieHead makeZhead];
    zhead.position = CGPointMake(200,130);
    [self addChild:zhead z:2];
    [bodyCache addObject:zhead];
    
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
    //[s2 updateSoldier:dt];
}


-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView: [touch view]];
    point = [[CCDirector sharedDirector] convertToGL: point];
    NSLog(@"size of monster cache is %d",[monsterCache count]);
    for(int n = 0; n < [bodyCache count];n++){
        body* b = [bodyCache objectAtIndex:n];
        if([b checkTouch:point]){
            NSLog(@"touch a body part");
            [self removeChild:b cleanup:YES];
            [monsterCache addObject:b];
            if([monsterCache count] == 2){
                monster* m = [monster makeMonster:[monsterCache objectAtIndex:0] mhead:[monsterCache objectAtIndex:1]];
                m.position = CGPointMake(200,100);
                [self addChild:m z:2];
                [monsterCache removeAllObjects];
            }
            
            [bodyCache removeObject:b];
            break;
        }
    }
}

-(void) ccTouchEnded:(NSSet *) touches withEvent:(UIEvent *)event{
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
