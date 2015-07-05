//
//  Productos.h
//  Reportes
//
//  Created by Aldo Ulises on 16/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Conexion.h"

@interface Productos : NSObject
{
    sqlite3 *con;
    sqlite3_stmt *stmt;
    
    NSMutableArray *arrayProductos;
}

- (void)agregarProducto;
- (NSMutableArray*)mostrarProducto:(NSString*)producto;
@end
