/*****************************************************************************
 *
 * FILE:	MWXCheckBox.m
 * DESCRIPTION:	MagickWorX: Check Box Class
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
 * $Id: MWXCheckBox.m,v 1.5 2012/01/23 14:48:45 kouichi Exp $
 *
 *****************************************************************************/

#import "MWXCheckBox.h"

@interface MWXCheckBox ()
@property (nonatomic,readwrite) BOOL	checked;
@property (nonatomic,assign) CGFloat	lineWidth;
@property (nonatomic,assign) CGFloat	checkWidth;
@end

@interface MWXCheckBox (Private)
@end

@implementation MWXCheckBox

@synthesize	checked		= _checked;
@synthesize	lineWidth	= _lineWidth;
@synthesize	checkWidth	= _checkWidth;
@synthesize	checkColor	= _checkColor;
@synthesize	boxColor	= _boxColor;

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];	// XXX: NEED!
    self.checked	 = NO;
    self.lineWidth	 = 2.0;
    self.checkWidth	 = 4.0;
    self.checkColor	 = [UIColor blackColor];
    self.boxColor	 = [UIColor blackColor];
  }
  return self;
}

-(void)dealloc
{
  [super dealloc];
}

-(void)drawRect:(CGRect)rect
{
  CGRect	boxRect = CGRectInset(rect, 2.0, 2.0);
  CGContextRef	context = UIGraphicsGetCurrentContext();
  CGContextSaveGState(context);

  // draw check box
  CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
  CGContextFillRect(context, boxRect);
  CGContextSetStrokeColorWithColor(context, _boxColor.CGColor);
  CGContextSetLineWidth(context, _lineWidth);
  CGContextStrokeRect(context, boxRect);

  // draw check
  if (_checked) {
    CGContextSetStrokeColorWithColor(context, _checkColor.CGColor);

    CGRect		r = CGRectInset(boxRect, 2.0, 2.0);
    CGFloat		w = r.size.width;
    CGFloat		h = r.size.height;
    CGFloat		x = r.origin.x;
    CGFloat		y = r.origin.y;
    CGMutablePathRef	path = CGPathCreateMutable();
    CGFloat		px = x;
    CGFloat		py = y + floorf(h * 2.0 / 3.0);
    CGPathMoveToPoint(path, NULL, px, py);
    px = x + floorf(w * 1.0 / 3.0);
    py = y + h;
    CGPathAddLineToPoint(path, NULL, px, py);
    px = x + w;
    py = y + floor(h * 1.0 / 4.0);
    CGPathAddLineToPoint(path, NULL, px, py);
    CGContextSetLineWidth(context, _checkWidth);
    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
  }

  CGContextRestoreGState(context);
}

/*****************************************************************************/

#pragma mark UIControl override
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  self.checked = !_checked;

  [self sendActionsForControlEvents:UIControlEventValueChanged];

  [self setNeedsDisplay];

  return YES;
}

#pragma mark UIControl override
-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;
{
  [super continueTrackingWithTouch:touch withEvent:event];

  return YES;
}

#pragma mark UIControl override
-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;
{
  [super endTrackingWithTouch:touch withEvent:event];
}

#pragma mark UIControl override
-(void)cancelTrackingWithEvent:(UIEvent *)event
{
  [super cancelTrackingWithEvent:event];
}

@end
