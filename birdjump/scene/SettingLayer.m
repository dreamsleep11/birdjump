//
//  SettingsLayer.m
//  G03
//
//  Created by Mac Admin on 18/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SettingLayer.h"
#import "MenuLayer.h"
enum{
  tAudio=1,
    tMusic,
    tAi,
    tDifficulty,
    tOperation,
};

@implementation SettingLayer

+(CCScene*)scene{
    CCScene* sc=[CCScene node];
    SettingLayer* la=[SettingLayer node];
    [sc addChild:la];
    return  sc;
}

-(id) init
{
	[super init];
    if (IS_IPHONE_5) {
        [self setBgWithFileName:@"bg-568h@2x.jpg"];
    }else{
        [self setBgWithFileName:SD_OR_HD(@"bg.jpg")];
    }
    CCMenuItemFont *title1 =[CCMenuItemLabel itemWithLabel:[CCLabelBMFont labelWithString:@"Sound Effect" fntFile:@"futura-48.fnt"]];
    [title1 setDisabledColor:title1.color];
    [title1 setIsEnabled:NO];
    title1.scale=HD2SD_SCALE;
    CCMenuItemToggle *item1 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"ON" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"OFF" fntFile:@"futura-48.fnt"]],
                             nil];
    item1.tag=tAudio;
    item1.scale=HD2SD_SCALE;
    if ([SysConfig needAudio]) {
        item1.selectedIndex=0;
    } else {
        item1.selectedIndex=1;
    }
    
	 CCLabelBMFont* lable2=[CCLabelBMFont labelWithString:@"Music" fntFile:@"futura-48.fnt"];
    CCMenuItemFont *title2 =[CCMenuItemLabel itemWithLabel:lable2];
    [title2 setDisabledColor:title2.color];
    [title2 setIsEnabled:NO];
    title2.scale=HD2SD_SCALE;
	CCMenuItemToggle *item2 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"ON" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"OFF" fntFile:@"futura-48.fnt"]],
                               nil];
    item2.tag=tMusic;
    item2.scale=HD2SD_SCALE;
    if ([SysConfig needMusic]) {
        item2.selectedIndex=0;
    } else {
        item2.selectedIndex=1;
    }
   
    CCLabelBMFont* lable4=[CCLabelBMFont labelWithString:@"Difference" fntFile:@"futura-48.fnt"];
    CCMenuItemFont *title4 =[CCMenuItemLabel itemWithLabel:lable4];
    
    [title4 setDisabledColor:title4.color];
    [title4 setIsEnabled:NO];
    title4.scale=HD2SD_SCALE;
	CCMenuItemToggle *item4 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Easy" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Normal" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Difficult" fntFile:@"futura-48.fnt"]],
                               nil];
    item4.tag=tDifficulty;
    item4.scale=HD2SD_SCALE;
    // you can change the one of the items by doing this
    item4.selectedIndex = [SysConfig difficulty];
    
    CCLabelBMFont* lable5=[CCLabelBMFont labelWithString:@"Operation" fntFile:@"futura-48.fnt"];
    CCMenuItemFont *title5 =[CCMenuItemLabel itemWithLabel:lable5];
    [title5 setDisabledColor:title5.color];
    [title5 setIsEnabled:NO];
    title5.scale=HD2SD_SCALE;
	CCMenuItemToggle *item5 = [CCMenuItemToggle itemWithTarget:self selector:@selector(menuCallback:) items:
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Gravity" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Guesture" fntFile:@"futura-48.fnt"]],
                               [CCMenuItemLabel itemWithLabel:[[CCLabelBMFont alloc]initWithString:@"Both" fntFile:@"futura-48.fnt"]],
                               nil];
	item5.tag=tOperation;
    item5.scale=HD2SD_SCALE;
    // you can change the one of the items by doing this
    item5.selectedIndex = [SysConfig operation];
    
    
    
    CCLabelBMFont *gobackLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:kGAME_SCORE_MODEL,0,kLIFE_INIT] fntFile:@"futura-48.fnt"];
    [gobackLabel setString:@"Go Back"];
    CCMenuItemLabel* back =[CCMenuItemLabel itemWithLabel:gobackLabel target:self selector:@selector(backCallback:)];
    back.scale=HD2SD_SCALE;
    
    /*
	CCMenu *menu = [CCMenu menuWithItems:
                    title1,item1,
                    title2,item2,
                    title4,item4,
                    title5,item5,                    
                    back, nil]; // 9 items.
    [menu alignItemsInColumns:
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:1],
     nil
	 ]; // 2 + 2 + 2 + 2 + 1 = total count of 9.
     /*/
    CCMenu *menu = [CCMenu menuWithItems:
                    title1,item1,
                    title2,item2,
                    title5,item5,
                    back, nil]; // 9 items.
    [menu alignItemsInColumns:
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:2],
     [NSNumber numberWithUnsignedInt:1],
     nil
	 ]; // 2 + 2 + 2 + 2 + 1 = total count of 9.
    //*/
	[self addChild: menu];
	
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

-(void) menuCallback: (id) sender
{
    if ([SysConfig needAudio]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button_select.mp3"];
    }
    CCMenuItem* mi=(CCMenuItem*)sender;
	NSLog(@"sender.tag: %d index:%d",mi.tag, [sender selectedIndex] );
    NSUserDefaults* defaults= [NSUserDefaults standardUserDefaults];
    switch (mi.tag) {
        case tAudio:
            if ([sender selectedIndex]==0) {
                [defaults setBool:YES forKey:UDF_AUDIO];
                [SysConfig setNeedAudio:YES];
            } else {
                [defaults setBool:NO forKey:UDF_AUDIO];
                [SysConfig setNeedAudio:NO];
            }
            break;
        case tMusic:
            if ([sender selectedIndex]==0) {
                [defaults setBool:YES forKey:UDF_MUSIC];
                [SysConfig setNeedMusic:YES];
            } else {
                [defaults setBool:NO forKey:UDF_MUSIC];
                [SysConfig setNeedMusic:NO];
            }
            
            if ([SysConfig needMusic]) {
                [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"gamebg.mp3" loop:YES];
            } else {
                [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
            }
            break;
        case tDifficulty:
            [defaults setInteger:[sender selectedIndex] forKey:UDF_DIFFICULLY];
            [SysConfig setDifficulty:[sender selectedIndex]];            
            break;
        case tOperation:
            [defaults setInteger:[sender selectedIndex] forKey:UDF_OPERATION];
            [SysConfig setOperation:[sender selectedIndex]];
            break;
    }
    
    
    
}

-(void) backCallback: (id) sender
{
    if ([SysConfig needAudio]){
        [[SimpleAudioEngine sharedEngine] playEffect:@"button_select.mp3"];
    }
	CCScene *sc = [CCScene node];
	[sc addChild:[MenuLayer node]];
	
	[[CCDirector sharedDirector] replaceScene:  [CCTransitionSplitRows transitionWithDuration:1.0f scene:sc]];
}
@end
