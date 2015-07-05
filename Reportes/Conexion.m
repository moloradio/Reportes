//
//  Conexion.m
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "Conexion.h"

@implementation Conexion

- (NSString*)obtenerPathDataBase{
    NSString *dirDocs;
    NSArray *rutas;
    NSString *rutaBD;
    
    rutas = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    dirDocs = [rutas objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    rutaBD = [[NSString alloc] initWithString:[dirDocs stringByAppendingPathComponent:NOMBRE_BD]];
    
    if ([fileManager fileExistsAtPath:rutaBD] == NO) {
        [fileManager copyItemAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:NOMBRE_BD] toPath:rutaBD error:Nil];
    }
    return rutaBD;
}

- (sqlite3*)getConnection{
    @try {
        if (sqlite3_open([[self obtenerPathDataBase] UTF8String], &base) != SQLITE_OK) {
            NSLog(@"Error en conexion");
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        NSLog(@"Conexion a Base de Datos Exitosa");
    }
    return base;
}

- (void)closeConnection{
    sqlite3_close(base);
}

@end
