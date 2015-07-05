//
//  Cotizaciones.m
//  Reportes
//
//  Created by Aldo Ulises on 17/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "Cotizaciones.h"

@implementation Cotizaciones

- (NSMutableArray*)getCotizaciones{
    NSMutableArray *auxArray = [[NSMutableArray alloc] init];
    Conexion *cn = [[Conexion alloc] init];
    Cotizacion *cotizacion = nil;
    
    sqlite3_stmt *stmt = nil;
    sqlite3 *con = [cn getConnection];
    NSString *cadenaSql = @"SELECT * FROM cotizaciones";
    
    if (sqlite3_prepare(con, [cadenaSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            cotizacion = [[Cotizacion alloc] init];
            [cotizacion setIntCotizacion:sqlite3_column_int(stmt, 0)];
            [cotizacion setIntCliente:sqlite3_column_int(stmt, 1)];
            [cotizacion setNomCliente:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 2)]];
            [cotizacion setRfcCliente:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 3)]];
            [cotizacion setFechaAlta:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 4)]];
            [cotizacion setHoraAlta:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 5)]];
            [cotizacion setFechaModificacion:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 6)]];
            [cotizacion setIntUsuario:sqlite3_column_int(stmt, 7)];
            [cotizacion setNomUsuario:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 8)]];
            [cotizacion setEstatus:[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 9)]];
            [auxArray addObject:cotizacion];
        }
    }else{
        NSLog(@"Error %s", sqlite3_errmsg(con));
    }
    sqlite3_close(con);
    [cn closeConnection];
    return auxArray;
}

- (void)guardarCotizacion:(Cliente*)cliente prod:(NSMutableArray*)productos{
    
    Conexion *cn = [[Conexion alloc] init];
    sqlite3 *con = nil;
    sqlite3_stmt *stmt = nil;
    
    NSString *consultaSql = [NSString stringWithFormat:@"INSERT INTO cotizaciones (intCliente,nomCliente,rfcCliente,fechaAlta,horaAlta,fechaModificacion,intUsuario,nomUsuario,estatus) VALUES (%i,'%@','%@',date(),time(),datetime(),%i,'%@','%@')",cliente.intCliente,cliente.nombre,cliente.rfc,1,@"viry",@"No Enviado"];
    if (sqlite3_open([[cn obtenerPathDataBase] UTF8String], &con) == SQLITE_OK){
        if(sqlite3_prepare(con, [consultaSql UTF8String], -1, &stmt, nil) == SQLITE_OK){
            if (sqlite3_step(stmt) == SQLITE_ROW) {
                NSLog(@"Cotizacion agregados");
            }
        }else{
            NSLog(@"Error %s", sqlite3_errmsg(con));
        }
    }
    cn = nil;
    sqlite3_close(con);
    [self obtenerUltimaCotizacion:productos];
}

- (void)obtenerUltimaCotizacion:(NSMutableArray*)productos{
    Conexion *cn = [[Conexion alloc] init];
    sqlite3 *con = nil;
    sqlite3_stmt *stmt = nil;
    int numCotizacion = 0;
    NSString *consultaSql2 = @"SELECT MAX(intCotizacion) FROM cotizaciones";
    
    if (sqlite3_open([[cn obtenerPathDataBase] UTF8String], &con) == SQLITE_OK){
        if(sqlite3_prepare(con, [consultaSql2 UTF8String], -1, &stmt, nil) == SQLITE_OK){
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                numCotizacion = sqlite3_column_int(stmt, 0);
            }
        }else{
            NSLog(@"Error %s", sqlite3_errmsg(con));
        }
    }
    cn = nil;
    sqlite3_close(con);
    [self insertarProductosACotizacion:productos intCot:numCotizacion];
}

- (void)insertarProductosACotizacion:(NSMutableArray*)productos intCot:(int)intCotizacion{
    
    Conexion *cn = [[Conexion alloc] init];
    sqlite3 *con = nil;
    sqlite3_stmt *stmt = nil;
    Producto *producto = nil;
    
    if (sqlite3_open([[cn obtenerPathDataBase] UTF8String], &con) == SQLITE_OK){
    for (int i=0; i<productos.count; i++) {
        producto = (Producto*)[productos objectAtIndex:i];
        
        NSString *cadenaSql = [NSString stringWithFormat:@"INSERT INTO contcotizacion (codigoProveedor,nomProducto,descProducto,precioProducto,cantProducto,totalProducto,intCotizacion) VALUES ('%@','%@','%@',%f,%f,%f,%i)",producto.codigoProveedor
                                             ,producto.nombre
                                             ,producto.nombreCorto
                                             ,producto.precio
                                             ,producto.cantidad
                                             ,producto.total
                                             ,intCotizacion];
        if (sqlite3_prepare_v2(con, [cadenaSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
            if (sqlite3_step(stmt) == SQLITE_DONE) {
                NSLog(@"Articulo Agregado");
            }
        }else{
            NSLog(@"Error %s", sqlite3_errmsg(con));
        }
        
    }
    }
    
    sqlite3_close(con);
}

- (NSMutableArray*)getProductos:(NSString*)numCotizacion{
    
    NSMutableArray *arregloProductos = [[NSMutableArray alloc] init];
    Conexion *cn = [[Conexion alloc] init];
    Producto *producto = nil;
    
    sqlite3_stmt *stmt = nil;
    sqlite3 *con = [cn getConnection];
    NSString *consultaSql = [NSString stringWithFormat:@"SELECT * FROM contcotizacion WHERE intCotizacion = %@", numCotizacion];
    
    if (sqlite3_prepare(con, [consultaSql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            producto = [[Producto alloc] init];
            [producto setIntContenido:sqlite3_column_int(stmt, 0)];
            [producto setCodigoProveedor:[NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)]];
            [producto setNombre:[NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 2)]];
            [producto setNombreCorto:[NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 3)]];
            [producto setPrecio:sqlite3_column_double(stmt, 4)];
            [producto setCantidad:sqlite3_column_double(stmt, 5)];
            [producto setTotal:sqlite3_column_double(stmt, 6)];
            [producto setIntCotizacion:sqlite3_column_int(stmt, 7)];
            [arregloProductos addObject:producto];
        }
    }else{
        NSLog(@"Error %s", sqlite3_errmsg(con));
    }
    sqlite3_close(con);
    [cn closeConnection];
    return arregloProductos;
}

@end
