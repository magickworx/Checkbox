/*****************************************************************************
 *
 * FILE:	MWXCheckBoxLabel.m
 * DESCRIPTION:	MagickWorX: Check Box Label Class
 * DATE:	Fri, Feb 24 2012
 * UPDATED:	Fri, Feb 24 2012
 * AUTHOR:	Kouichi ABE (WALL) / 阿部康一
 * E-MAIL:	kouichi@MagickWorX.COM
 * URL:		http://www.MagickWorX.COM/
 * COPYRIGHT:	(c) 2012 阿部康一／Kouichi ABE (WALL), All rights reserved.
 * LICENSE:
 *
 *  Copyright (c) 2012 Kouichi ABE (WALL) <kouichi@MagickWorX.COM>,
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   1. Redistributions of source code must retain the above copyright
 *      notice, this list of conditions and the following disclaimer.
 *
 *   2. Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *
 *   THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 *   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *   PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
 *   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *   INTERRUPTION)  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 *   THE POSSIBILITY OF SUCH DAMAGE.
 *
 * $Id: MWXCheckBoxLabel.m,v 1.5 2012/01/23 14:48:45 kouichi Exp $
 *
 *****************************************************************************/

#import "MWXCheckBoxLabel.h"

@interface MWXCheckBoxLabel ()
@property (nonatomic,retain) MWXCheckBox *		checkbox;
@property (nonatomic,retain,readwrite) UILabel *	textLabel;
@end

@implementation MWXCheckBoxLabel

@synthesize	checkbox	= _checkbox;
@synthesize	textLabel	= _textLabel;

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor  = [UIColor clearColor];

    CGFloat		x = 1.0;
    CGFloat		y = 1.0;
    CGFloat		w = frame.size.height - 2.0;
    CGFloat		h = frame.size.height - 2.0;
    MWXCheckBox *	checkbox;
    checkbox = [[MWXCheckBox alloc] initWithFrame:CGRectMake(x, y, w, h)];
    self.checkbox = checkbox;
    [self addSubview:checkbox];
    [checkbox release];

    x = w + 2.0;
    w = frame.size.width - w;
    UILabel *	label;
    label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:16.0];
    self.textLabel = label;
    [self addSubview:label];
    [label release];
  }
  return self;
}

-(void)dealloc
{
  self.checkbox	 = nil;
  self.textLabel = nil;
  [super dealloc];
}

-(void)addTarget:(id)target
	action:(SEL)action
	forControlEvents:(UIControlEvents)controlEvents
{
  [self.checkbox addTarget:target action:action forControlEvents:controlEvents];
}

@end
