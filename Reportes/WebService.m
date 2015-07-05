//
//  WebService.m
//  Reportes
//
//  Created by USER on 21/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "WebService.h"

@implementation WebService

- (NSArray *)wsObtenerListaCategoria:(NSString *)parametro{
    NSArray *arrayCategorias;
    NSMutableArray *listaProducto = [[NSMutableArray alloc] init];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", URL_PRODUCTO, parametro];
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
    
    if (!error) {
        arrayCategorias = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        /*for (int i=0; i<arrayCategorias.count; i++) {
            NSString *ca_codigo = [[arrayCategorias objectAtIndex:i] objectForKey:@"ca_codigo"];
            NSString *ca_descripcion = [[arrayCategorias objectAtIndex:i] objectForKey:@"ca_descripcion"];
            NSString *ca_fec_modi = [[arrayCategorias objectAtIndex:i] objectForKey:@"ca_fec_modi"];
            NSString *ca_est = [[arrayCategorias objectAtIndex:i] objectForKey:@"ca_est"];
            NSString *est_mod = [[arrayCategorias objectAtIndex:i] objectForKey:@"est_mod"];
            NSString *ca_imagen = [[arrayCategorias objectAtIndex:i] objectForKey:@"ca_imagen"];
        }*/
    }
    
    return listaProducto.copy;
}

- (void)inicio{
    NSURLConnection *connection;
    NSURL *url = [NSURL URLWithString:@"http://www.legislation.gov.uk/ukpga/1985/67/section/6/data.xml"];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (connection) {
        webData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error en la conexion  %@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *cadena = [[NSString alloc] initWithBytes:[webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"El resultado es %@",cadena);
}

@end
