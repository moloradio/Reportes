//
//  WSCargarProductos.m
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "WSCargarProductos.h"

@implementation WSCargarProductos

- (NSString*)cargarProductos:(NSString*)producto{
    
    NSString *productos;
    contProducto = [[NSMutableDictionary alloc] init];
    isExistProduct = NO;
    
    NSString *soapMessage = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
    "<soap:Body>\n"
    "<ObtenerArticulo xmlns=\"http://tempuri.org/\">\n"
    "<nombreCorto>%@</nombreCorto>\n"
    "</ObtenerArticulo>\n"
    "</soap:Body>\n"
    "</soap:Envelope>", producto];
    
    NSURL *url = [NSURL URLWithString:@"http://promovagomty.dyndns.org/PV.Movil/WSMobile.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://tempuri.org/ObtenerArticulo" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    [theConnection start];
    
    if( theConnection ) {
        webData = [NSMutableData data];
    }
    else {
        NSLog(@"theConnection is NULL");
    }
    return productos;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConnection");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %i", [webData length]);
    xmlParser = [[NSXMLParser alloc] initWithData:webData];
    [xmlParser setDelegate:self];
    [xmlParser parse];
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",theXML);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"codigoProveedor"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"nombre"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"nombreCorto"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"precio"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"intMoneda"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"moneda"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"tieneError"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"Mensaje"])
    {
        stringActual = elementName;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([stringActual isEqualToString:@"codigoProveedor"]) {
        [contProducto setValue:string forKey:@"codigoProveedor"];
    }
    if ([stringActual isEqualToString:@"nombre"]) {
        [contProducto setValue:string forKey:@"nombre"];
    }
    if ([stringActual isEqualToString:@"nombreCorto"]) {
        [contProducto setValue:string forKey:@"nombreCorto"];
    }
    if ([stringActual isEqualToString:@"precio"]) {
        [contProducto setValue:string forKey:@"precio"];
    }
    if ([stringActual isEqualToString:@"intMoneda"]) {
        [contProducto setValue:string forKey:@"intMoneda"];
    }
    if ([stringActual isEqualToString:@"moneda"]) {
        [contProducto setValue:string forKey:@"moneda"];
    }
    if ([stringActual isEqualToString:@"tieneError"]) {
        [contProducto setValue:string forKey:@"tieneError"];
    }
    if ([stringActual isEqualToString:@"Mensaje"]) {
        [contProducto setValue:string forKey:@"mensaje"];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.delegate_producto mostrarProducto:contProducto];
}

@end
