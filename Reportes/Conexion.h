//
//  Conexion.h
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Constantes.h"

@interface Conexion : NSObject
{
    sqlite3 *base;
}
- (NSString*)obtenerPathDataBase;
- (sqlite3*)getConnection;
- (void)closeConnection;

@end

