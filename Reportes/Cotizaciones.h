//
//  Cotizaciones.h
//  Reportes
//
//  Created by Aldo Ulises on 17/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Conexion.h"
#import "Cliente.h"
#import "Producto.h"
#import "Cotizacion.h"

@interface Cotizaciones : NSObject
{
    
}
- (NSMutableArray*)getCotizaciones;
- (void)guardarCotizacion:(Cliente*)cliente prod:(NSMutableArray*)productos;
- (NSMutableArray*)getProductos:(NSString*)numCotizacion;

@end
