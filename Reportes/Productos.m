//
//  Productos.m
//  Reportes
//
//  Created by Aldo Ulises on 16/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "Productos.h"

@implementation Productos

- (void)agregarProducto{
    
    Conexion *cn = [[Conexion alloc] init];
    con = [cn getConnection];
    
    NSString *consultaSql = @"SELECT * FROM dbarticulo";
    
    if (sqlite3_prepare(con, [consultaSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            NSLog(@"%s", sqlite3_column_text(stmt, 1));
        }
    }else{
        NSLog(@"Error %s", sqlite3_errmsg(con));
    }
    sqlite3_close(con);
    
}

- (NSMutableArray*)mostrarProducto:(NSString*)producto{
    
    arrayProductos = [[NSMutableArray alloc] init];
    Conexion *cn = [[Conexion alloc] init];
    con = [cn getConnection];
    
    NSString *consultaSql = [NSString stringWithFormat:@"SELECT * FROM dbarticulo WHERE strcodigo LIKE '%@%%'", producto];
    
    if (sqlite3_prepare(con, [consultaSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            [arrayProductos addObject:[NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)]];
        }
    }else{
        NSLog(@"Error %s", sqlite3_errmsg(con));
    }
    sqlite3_close(con);
    
    return arrayProductos;
}

@end
