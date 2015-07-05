//
//  Cliente.h
//  Reportes
//
//  Created by USER on 09/05/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cliente : NSObject

@property (nonatomic, strong) NSString *rfc;
@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *aPaterno;
@property (nonatomic, strong) NSString *aMaterno;
@property (nonatomic, assign) int intCliente;
@property (nonatomic, assign) BOOL tieneError;
@property (nonatomic, strong) NSString *mensaje;

@end
