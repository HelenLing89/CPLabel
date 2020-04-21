//
//  CPLabel.m
//  CPLabel
//
//  Created by 凌甜 on 21.4.20.
//  Copyright © 2020 凌甜. All rights reserved.
//

#import "CPLabel.h"

@implementation CPLabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copyS:)) {
        return YES;
    }
    if (action == @selector(pasteS:)) {
        return YES;
    }
    
    return NO;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self attachTapHandler];
    }
    return self;
}


- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
 //  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGes:)];
 // [self addGestureRecognizer:tap];
//    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handerLongPress:)]];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handerLongPress:)];
    [self addGestureRecognizer:longPress];
}

//- (void)handleTapGes:(UITapGestureRecognizer *)tap {
//    [self becomeFirstResponder];
//    UIMenuController *menu = [UIMenuController sharedMenuController];
//        //   UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyS:)];
//    UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyText:)];
//    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pasteS:)];
//    menu.menuItems = @[item1];
//    //menu.menuItems = @[item1];
//   [menu setTargetRect:self.bounds inView:self];
//   [menu setMenuVisible:YES animated:YES];
//    
//}

- (void)handleTapGes:(UITapGestureRecognizer *)tap {
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
         //  UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyS:)];
    UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyText:)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pasteS:)];
    menu.menuItems = @[item1,item2];
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
    
}

- (void)handerLongPress:(UILongPressGestureRecognizer *)longPress {
        [self becomeFirstResponder];
       
    UIMenuController *menu = [UIMenuController sharedMenuController];
     UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copyS:)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pasteS:)];
        menu.menuItems = @[item1,item2];
     //   menu.arrowDirection = UIMenuControllerArrowDown;
     //   [menu setTargetRect:self.bounds inView:self];
     //   [menu showMenuFromView:self.superview rect:self.frame];
      //  [menu setMenuVisible:YES animated:YES];
     [menu setTargetRect:self.frame inView:self.superview];
      [menu setMenuVisible:YES animated:YES];
}

- (void)copyS:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

- (void)pasteS:(id)sender {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    self.text = pboard.string;
}

@end
