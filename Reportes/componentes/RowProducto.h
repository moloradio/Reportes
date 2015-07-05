//
//  RowProducto.h
//  Reportes
//
//  Created by Aldo Ulises on 16/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowProducto : UITableViewCell

@property (nonatomic,retain) UILabel *titulo;
@property (nonatomic,retain) UILabel *descripcion;
@property (nonatomic,retain) UILabel *cantidad;
@property (nonatomic,retain) UILabel *total;

- (void)inicializarElementos;
@end
