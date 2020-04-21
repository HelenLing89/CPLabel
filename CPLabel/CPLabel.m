//
//  CPLabel.m
//  CPLabel
//
//  Created by 凌甜 on 21.4.20.
//  Copyright © 2020 凌甜. All rights reserved.
//

#import "CPLabel.h"

@implementation CPLabel

- (BOOL)becomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
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
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handerLongPress:)];
    [self addGestureRecognizer:longPress];
}

- (void)handerLongPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyS:)];
        UIMenuItem *pastLink = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pasteS:)];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        menu.menuItems = @[copyLink,pastLink];
        menu.arrowDirection = UIMenuControllerArrowDown;
      //  [menu setTargetRect:self.frame inView:self.superview];
        [menu showMenuFromView:self.superview rect:self.frame];
       // [menu setMenuVisible:YES animated:YES];
    }
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
