//
//  logingLayer.h
//  ZombieDefense
//
//  Created by Hua Dong on 13-08-25.
//
//

#import "CCLayer.h"
#import "CCScene.h"
#import "CCLabelTTF.h"
#import "CCMenu.h"
@interface logingLayer : CCLayer{
    CGSize size;
    CCLabelTTF* titleLabel;
    CCLabelTTF* enterLabel;
    CCLabelTTF* idLabel;
    CCLabelTTF* scoreLabel;
    CCLabelTTF* levelLabel;
    CCLabelTTF* rScoreLabel;
    CCLabelTTF* rTimeLabel;
    CCLabelTTF* rMonsterLabel;
    CCMenu* buttonMenu;
    CCMenu* adminMenu;
    CCMenu* backMenu;
    UITextField* txtEmail;
    NSMutableDictionary* users;
    NSUserDefaults* prefs;
    BOOL createNew;
    BOOL logedin;
    NSDictionary* user;
    int monsters,totalScore,tempScore,userIndex;
    NSNumber* totalTime;
}

+(CCScene*) scene;

@end
