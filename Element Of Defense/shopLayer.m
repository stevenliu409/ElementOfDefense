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
#import "labelHelper.h"
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
        upperBand = 10;
        lowerBand = 0;
        [self initBg];
        [self initButtons];
        [self initData];
        [self initLabels];
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

-(void) initData{
    prefs = [NSUserDefaults standardUserDefaults];
    itemList = [prefs objectForKey:@"itemArray"];
    if([itemList count] == 0){
        UIAlertView* alter = [[UIAlertView alloc]initWithTitle:@"QS" message:@"NO Counpon avaliable now" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
        currentPage = 0;
        pageNum = 0;
    }else{
        pageNum = [itemList count]/6;
        if([itemList count] >6){
            upperBand = 6;
        }else {
            upperBand = [itemList count];
        }
        currentPage = 1;
        [self initItems:itemList from:0 tobound:upperBand];
    }
}

-(void) initItems:(NSArray *)items from:(int) p tobound:(int)b{
    itemMenu = [CCMenu menuWithItems: nil];
    int startX1 = 50;
    int startX2 = 245;
    int startX3 = 425;
    int startY = 250;
    for(int n = p; n < b;n++){
        NSDictionary* d = [items objectAtIndex:n];
        CCMenuItem* i = [self itemHelper:n pos:CGPointMake(startX1, startY) withStr:[d objectForKey:@"itemName"]];
        CCMenuItem* i1 = [self itemHelper:n pos:CGPointMake(startX2, startY) withStr:[d objectForKey:@"desc"]];
        NSNumber* num = [d objectForKey:@"price"];
        CCMenuItem* i2 = [self itemHelper:n pos:CGPointMake(startX3, startY) withStr:[NSString stringWithFormat:@"%d",[num intValue]]];
        startY -= 30;
        [itemMenu addChild:i];
        [itemMenu addChild:i1];
        [itemMenu addChild:i2];
    }
    itemMenu.position = ccp(0,0);
    [self addChild:itemMenu z:3];
}


-(CCMenuItemFont*) itemHelper:(int) t pos:(CGPoint) point withStr:(NSString *)str{
    CCMenuItemFont* i = [CCMenuItemFont itemWithString:str target:self selector:@selector(itemSelect:)];
    i.tag = t;
    i.position = point;
    return i;
}

-(void) itemSelect:(id) sender{
    int selection = [sender tag];
    CCMenuItemFont* i = sender;
    CCArray* temp = [itemMenu children];
    if(i.color.b == ccWHITE.b && i.color.g == ccWHITE.g && i.color.r == ccWHITE.r){
        i.color = ccBLUE;
        for ( int n = 0; n <[temp count]; n++){
            CCMenuItemFont* f = [temp objectAtIndex:n];
            if(f.tag == selection){
                f.color = ccBLUE;
            }else{
                f.color = ccWHITE;
            }
        }
    }
}

-(void) initButtons{
    [CCMenuItemFont setFontName:@"Marker Felt"];
    [CCMenuItemFont setFontSize:25];
    CCMenuItem* mPrev = [CCMenuItemFont itemWithString:@"prev" target:self selector:@selector(goPrev:)];
    mPrev.position = ccp(0,0);
    CCMenuItem* mBuy = [CCMenuItemFont itemWithString:@"Buy" target:self selector:@selector(buy:)];
    mBuy.position = ccp(200,0);
    CCMenuItem* mRef = [CCMenuItemFont itemWithString:@"Refresh" target:self selector:@selector(ref:)];
    mRef.position = ccp(300,0);
    
    CCMenuItem* mBack = [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(goBack:)];
    mBack.position = ccp(400,0);
    
    CCMenuItem* mNext = [CCMenuItemFont itemWithString:@"next" target:self selector:@selector(goNext:)];
    mNext.position = ccp(100,0); 
    CCMenu* m = [CCMenu menuWithItems:mPrev,mBuy,mRef,mBack,mNext, nil];
    
    m.position = ccp(50,50);
    
    [self addChild:m z:3];
}

-(void) goNext:(id) sender{
    int bigger = [itemList count] - (currentPage+1)*6;
    if( bigger> 0){
        [itemMenu removeAllChildrenWithCleanup:YES];
        currentPage++;
        int q = [itemList count] - (currentPage+1)*6;
        if(q > 0){
            [self initItems:itemList from:currentPage*6 tobound:((currentPage+1)*6)];
        }else{
            [self initItems:itemList from:currentPage*6 tobound:[itemList count]];
        }
        [lblPage setString:[NSString stringWithFormat:@"%d/%d",currentPage,pageNum]];
    }
    
    
    
}

-(void) goBack:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[loadingLayer loadSence:@"shopbg.jpeg" from:997 to:999]];
}

-(void) buy:(id) sender{
    
}

-(void) ref:(id)sender{
    
}
-(void) goPrev:(id) sender{
    if(currentPage >1){
        currentPage--;
        [itemMenu removeAllChildrenWithCleanup:YES];
        [self initItems:itemList from:currentPage*6 tobound:((currentPage+1)*6)];
    }
    [lblPage setString:[NSString stringWithFormat:@"%d/%d",currentPage,pageNum]];
}


-(void) initLabels{
    [labelHelper makeLabel:@"Item Name" layer:self position:CGPointMake(50, 275) fontsize:25 zValue:3];
    [labelHelper makeLabel:@"DESC" layer:self position:CGPointMake(275,275) fontsize:25 zValue:3];
    [labelHelper makeLabel:@"Price" layer:self position:CGPointMake(425, 275) fontsize:25 zValue:3];
    CCLabelTTF* l = [labelHelper makeLabel:@"Available Score:" layer:self position:CGPointMake(100, 75) fontsize:25 zValue:3];
    l.color = ccBLUE;
    int totalScore = [[prefs objectForKey:@"totalScore"] intValue];
    CCLabelTTF* l1 = [labelHelper makeLabel:[NSString stringWithFormat:@"%d",totalScore] layer:self position:CGPointMake(200, 75) fontsize:25 zValue:3];
    l1.color = ccBLUE;
    lblPage = [labelHelper makeLabel:[NSString stringWithFormat:@"%d/%d",currentPage,pageNum] layer:self position:CGPointMake(400, 75) fontsize:25 zValue:3];
}




@end
