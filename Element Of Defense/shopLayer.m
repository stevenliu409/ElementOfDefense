//
//  shopLayer.m
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "shopLayer.h"
#import "cocos2d.h"
#import "loadingLayer.h"
@implementation shopLayer
+(CCScene* ) scene{
        // 'scene' is an autorelease object.
    CCScene *scene = [CCScene node];
        
        // 'layer' is an autorelease object.
    shopLayer *layer = [shopLayer node];
        
        // add layer as a child to scene
    [scene addChild: layer];
        
        // return the scene
    return scene;
}

-(id) init{
    if(self = [super init]){
        [self initBg];
        [self initButton];
    }
    return self;
}

-(void) initBg{
    CCSprite* bg = [CCSprite spriteWithFile:@"shopbg.jpeg"];
    size = [[CCDirector sharedDirector] winSize];
    bg.scaleX = size.width/bg.contentSize.width;
    bg.scaleY = size.height/bg.contentSize.height;
    bg.anchorPoint = CGPointMake(0,0);
    [self addChild:bg z:1];
}

-(void) initButton{
    CCMenuItem* mBack = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(goBack:)];
    CCMenuItem* mBuy = [CCMenuItemFont itemWithString:@"Buy" target:self selector:@selector(buy)];
    mBack.position = ccp(size.width - 50,20);
    mBuy.position = ccp(20,20);
    CCMenu* m = [CCMenu menuWithItems:mBack,mBuy, nil];
    m.position = ccp(20,20);
    //[m alignItemsVertically];
    [self addChild:m z:3];
}

-(void) goBack:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"shopbg.jpeg" from:997 to:999]];
}

-(void) buy:(id) sender{
    
}


@end
