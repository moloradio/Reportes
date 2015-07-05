//
//  RowCotizacion.h
//  Reportes
//
//  Created by Aldo Ulises on 18/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowCotizacion : UITableViewCell
@property(nonatomic, retain) UILabel *titulo;
@property(nonatomic, retain) UILabel *estatus;

- (void)inicializarElementos;
@end
