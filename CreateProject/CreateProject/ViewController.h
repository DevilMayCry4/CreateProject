//
//  ViewController.h
//  CreateProject
//
//  Created by virgil on 16/3/15.
//  Copyright (c) 2015年 xtownmobile.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    NSArray  *_values;
}
@property (weak) IBOutlet NSScrollView *scrollview;
@property (weak) IBOutlet NSButton *createButton;

@end

