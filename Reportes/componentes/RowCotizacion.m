//
//  RowCotizacion.m
//  Reportes
//
//  Created by Aldo Ulises on 18/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "RowCotizacion.h"

@implementation RowCotizacion
@synthesize titulo, estatus;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (void)inicializarElementos{
    
    CGFloat widthTabla = self.frame.size.width;
    
    titulo = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width+(widthTabla*.4), 20)];
    [titulo setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    estatus = [[UILabel alloc] initWithFrame:CGRectMake(widthTabla-(widthTabla*.2-widthTabla), 10, self.frame.size.width*.3, 20)];
    [estatus setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    [self addSubview:titulo];
    [self addSubview:estatus];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
