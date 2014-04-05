//
//  ImageTableViewCell.m
//  ScrollingTableEffects
//
//  Created by Tobin Schwaiger-Hastanan on 4/4/14.
//  Copyright (c) 2014 Tobin Schwaiger-Hastanan. All rights reserved.
//

#import "ImageTableViewCell.h"

@interface ImageTableViewCell()

@property CAGradientLayer *gradient;

@end

@implementation ImageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) prepareForReuse {
    [super prepareForReuse];
    self.photo.transform = CGAffineTransformIdentity;
    [self.gradient removeFromSuperlayer];
    self.gradient = nil;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews {
    if( self.gradient == nil ) {
        self.gradient = [CAGradientLayer layer];
        CGRect gradientFrame = self.gradientView.frame;
        gradientFrame.origin.x = 0;
        gradientFrame.origin.y = 0;
        self.gradient.frame = gradientFrame;
        
        UIColor* theColor = [UIColor blackColor];
        
        //build the colors array for the gradient
        NSArray *colors = [NSArray arrayWithObjects:
                           (id)[[theColor colorWithAlphaComponent:0.0] CGColor],
                           (id)[[theColor colorWithAlphaComponent:1.0] CGColor],
                           nil];
        
        //apply the colors and the gradient to the view
        self.gradient.colors = colors;
        
        [self.gradientView.layer insertSublayer:self.gradient atIndex:0];
    }
    
}

@end
