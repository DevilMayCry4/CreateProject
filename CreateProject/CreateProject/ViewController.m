//
//  ViewController.m
//  CreateProject
//
//  Created by virgil on 16/3/15.
//  Copyright (c) 2015年 xtownmobile.com. All rights reserved.
//

#import "ViewController.h"
static const int kButtonTag = 20000;

@interface CreateDocument : NSDocument

@end

@implementation CreateDocument

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    return [@"succe" dataUsingEncoding:NSUTF8StringEncoding];
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _values = @[@"zxing",@"mb",@"afnetwork",@"nsett",@"uiutil"];
    NSView *v = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    for (int a = 0; a < [_values count]; a++)
    {
        NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(10, 10+50*a, 200, 40)];
        [button setTitle:_values[a]];
        button.tag = kButtonTag + a;
        [button setButtonType:NSSwitchButton];
        [v addSubview:button];
        if (a == [_values count] -1)
        {
            NSRect rect = v.frame;
            rect.size.height = CGRectGetMaxY(button.frame) + 20;
            v.frame = rect;
        }
    }
    
    self.scrollview.documentView = v;
    self.createButton.action = @selector(pressButton:);
    self.createButton.target = self;
    // Do any additional setup after loading the view.
}

- (void)pressButton:(NSButton *)button
{
    for (int a = 0; a < [_values count]; a++)
    {
       NSButton *button = [self.scrollview.documentView viewWithTag:kButtonTag + a];
        if ([button state] == NSOnState)
        {
            NSLog(@"h%@",button.title);
        }
        else
        {
            NSLog(@"l%@",button.title);
        }
    }
    CreateDocument *document = [[CreateDocument alloc] initWithType:@"di" error:nil];
    [document runModalSavePanelForSaveOperation:NSSaveAsOperation delegate:self didSaveSelector:@selector(save:) contextInfo:NULL];
    
    [document saveDocumentAs:self];
    
}

- (void)save:(CreateDocument *)docment
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"resouce" ofType:@"bundle"];
    [fileManager removeItemAtURL:docment.fileURL error:nil];
    [fileManager copyItemAtURL:[NSURL fileURLWithPath:[path stringByAppendingPathComponent:@"Example"]] toURL:docment.fileURL error:&error];
    if (error)
    {
        NSLog(@"%@",error.localizedDescription);
    }
    [docment close];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
