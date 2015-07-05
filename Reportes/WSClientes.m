//
//  WSClientes.m
//  Reportes
//
//  Created by USER on 25/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "WSClientes.h"

@implementation WSClientes

- (void)buscarProductoXRFC:(NSString*)clienteRFC{
    
    contCliente = [[NSMutableDictionary alloc] init];
    
    NSString *soapMessage = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                             "<soap:Body>"
                             "<ObtenerClientePorRFC xmlns=\"http://tempuri.org/\">"
                             "<RFC>%@</RFC>\n"
                             "</ObtenerClientePorRFC>\n"
                             "</soap:Body>\n"
                             "</soap:Envelope>", clienteRFC];
    
    NSURL *url = [NSURL URLWithString:@"http://promovagomty.dyndns.org/PV.Movil/WSMobile.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://tempuri.org/ObtenerClientePorRFC" forHTTPHeaderField:@"SOAPAction"];
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
    NSLog(@"DONE. Received Bytes: %lu", (unsigned long)[webData length]);
    xmlParser = [[NSXMLParser alloc] initWithData:webData];
    [xmlParser setDelegate:self];
    [xmlParser parse];
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",theXML);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"RFC"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"nombre"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"aPaterno"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"aMaterno"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"intCliente"])
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
    if([stringActual isEqualToString:@"RFC"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"nombre"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"aPaterno"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"aMaterno"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"intCliente"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"tieneError"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
    if([stringActual isEqualToString:@"Mensaje"])
    {
        [contCliente setValue:string forKey:stringActual];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.delegate_clientes mostrarCliente:contCliente];
}


@end
