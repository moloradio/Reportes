//
//  RowProducto.m
//  Reportes
//
//  Created by Aldo Ulises on 16/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "RowProducto.h"

@implementation RowProducto
@synthesize titulo,descripcion,cantidad,total;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

- (void)inicializarElementos{
    
    CGFloat widthTabla = self.frame.size.width;
    
    titulo = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, self.frame.size.width+(widthTabla*.4), 20)];
    [titulo setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    descripcion = [[UILabel alloc] initWithFrame:CGRectMake(10, 24, self.frame.size.width-100, 16)];
    [descripcion setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    
    cantidad = [[UILabel alloc] initWithFrame:CGRectMake(widthTabla-(widthTabla*.2-widthTabla), 10, self.frame.size.width-400, 20)];
    [cantidad setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    total = [[UILabel alloc] initWithFrame:CGRectMake(widthTabla-(widthTabla*.1-widthTabla), 10, self.frame.size.width-100, 20)];
    [total setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    [self addSubview:titulo];
    [self addSubview:descripcion];
    [self addSubview:cantidad];
    [self addSubview:total];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
