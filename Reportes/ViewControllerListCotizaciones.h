//
//  ViewControllerListCotizaciones.h
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cotizaciones.h"
#import "RowCotizacion.h"
#import "Cotizacion.h"
#import "ViewControllerVerCotizacion.h"

@interface ViewControllerListCotizaciones : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arregloCotizaciones;
}

@property (weak, nonatomic) IBOutlet UIButton *bttnRegresar;
@property (weak, nonatomic) IBOutlet UITableView *tablaCotizaciones;
@end
