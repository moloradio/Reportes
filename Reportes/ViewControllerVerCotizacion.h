//
//  ViewControllerVerCotizacion.h
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cliente.h"
#import "Cotizaciones.h"
#import "RowProducto.h"

@interface ViewControllerVerCotizacion : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *arrayProductos;
    Cotizaciones *cotizaciones;
}
@property (strong, nonatomic) IBOutlet UILabel *nomCliente;
@property (weak, nonatomic) IBOutlet UITableView *tablaCotizaciones;
@property (nonatomic, strong) NSString *numCotizacion;
@property (nonatomic, strong) NSString *nombreCliente;

- (IBAction)regresar:(id)sender;
@end
