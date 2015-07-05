//
//  TablaSugerencias.m
//  Reportes
//
//  Created by Aldo Ulises on 27/06/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "TablaSugerencias.h"

@implementation TablaSugerencias

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setDataSource:self];
    [self setDelegate:self];
    productos = [[Productos alloc] init];
    
    arreglo = [[NSMutableArray alloc] init];
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arreglo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *celda = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    celda.textLabel.text = [arreglo objectAtIndex:[indexPath row]];
    return celda;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *productSelected = [arreglo objectAtIndex:[indexPath row]];
    [self.delegateTablaSugerencias mostrarDetalles:productSelected];
    
}

- (void)mostrarSugerencias:(NSString*)producto{
    arreglo = [productos mostrarProducto:producto];
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
