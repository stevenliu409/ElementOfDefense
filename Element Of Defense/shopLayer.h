//
//  shopLayer.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-23.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
@interface shopLayer : CCLayer{
    CGSize size;
    NSUserDefaults* prefs;
    int upperBand,lowerBand,currentPage,pageNum;
    CCMenu* itemMenu;
    NSArray* itemList;
    CCLabelTTF* lblAScore;
    CCLabelTTF* lblPage;
    NSDictionary* user;
}

+(CCScene*) scene;
-(void) goBack:(id) sender;
-(void) goPrev:(id) sender;

@end
