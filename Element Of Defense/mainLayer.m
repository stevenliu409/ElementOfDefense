//
//  mainLayer.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "mainLayer.h"
#import "cocos2d.h"
#import "labelHelper.h"
#import "loadingLayer.h"
@implementation mainLayer

+(CCScene* ) sence{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	mainLayer *layer = [mainLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


-(id) init{
    if(self = [super init]){
        [self initBg];
        [self initLabel];
        [self initButtons];
    }
    return self;
}

-(void) initBg{
    CCSprite* bg = [CCSprite spriteWithFile:@"shopbg.jpeg"];
    bg.anchorPoint = ccp(0,0);
    size = [[CCDirector sharedDirector] winSize];
    prefs = [NSUserDefaults standardUserDefaults];
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    [self addChild:bg z:1];
}

-(void) initData{
    totalTime = [[prefs objectForKey:@"totalTime"]intValue];
    monsters = [[prefs objectForKey:@"totalMonster"]intValue];
    
    totalScore = [[prefs objectForKey:@"totalScore"]intValue];
    totalScore += [self calculateScore];
}

-(void) initLabel{
    [self initData];
    double s = size.height;
    [labelHelper makeLabel:[NSString stringWithFormat:@"the time you use to pass previous level is %d", totalTime] layer:self position:ccp(200,s-50) fontsize:20 zValue:2];
    [labelHelper makeLabel:[NSString stringWithFormat:@"Number of monster die in previous level are %d", monsters] layer:self position:ccp(210,s-90) fontsize:20 zValue:2];
    [labelHelper makeLabel:[NSString stringWithFormat:@"your score is %d", [self calculateScore]] layer:self position:ccp(100,s-130) fontsize:20 zValue:2];
    [labelHelper makeLabel:[NSString stringWithFormat:@"your total score is %d",totalScore] layer:self position:ccp(125,s-170) fontsize:20 zValue:2];
    
}

-(void) initButtons{
    [CCMenuItemFont setFontSize:20];
    CCMenuItem* mNextLevel = [CCMenuItemFont itemWithString:@"Go next Level" target:self selector:@selector(goNext:)];
    mNextLevel.position = ccp(40,20);
    
    CCMenuItem* mShop = [CCMenuItemFont itemWithString:@"Go shopping" target:self selector:@selector(goShopping:)];
    mShop.position = ccp(size.width - 75, 20);
    
    CCMenuItem* mOpen = [CCMenuItemFont itemWithString:@"Go open" target:self selector:@selector(goOpen:)];
    mOpen.position = ccp(size.width/2,20);
    
    CCMenu* m = [CCMenu menuWithItems:mNextLevel,mOpen,mShop, nil];
    m.position = ccp(20,0);
    [self addChild:m z:2];
}

-(void) goNext:(id) sender{
    
}

-(void) goOpen:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"shopbg.jpeg" from:998 to:998]];
}

-(void) goShopping:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"shopbg.jpeg" from:998 to:997]];
}

-(int) calculateScore{
    return 1000;
}




@end
