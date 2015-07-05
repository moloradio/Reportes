//
//  WSLogin.m
//  Reportes
//
//  Created by aldo ulises pena martinez on 28/03/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "WSLogin.h"

@implementation WSLogin

- (NSString*)login:(NSString*)usuarios pass:(NSString*)password vista:(ViewControllerLogin *)view{
    vista = view;
    NSString *soapMessage = [NSString stringWithFormat: @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soap:Body>"
    "<ObtenerInformacion xmlns=\"http://tempuri.org/\">"
    "<Usuario>%@</Usuario>"
    "<Pass>%@</Pass>"
    "</ObtenerInformacion>"
    "</soap:Body>"
    "</soap:Envelope>", usuarios, password];
    
    NSURL *url = [NSURL URLWithString:@"http://promovagomty.dyndns.org/PV.Movil/WSMobile.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://tempuri.org/ObtenerInformacion" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    [theConnection start];
    
    if( theConnection )
    {
        webData = [NSMutableData data];
        NSXMLParser *p = [[NSXMLParser alloc] initWithData:webData];
        [p setDelegate:self];
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    return bExisteError;
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
    NSLog(@"ERROR with theConenction");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %i", [webData length]);
    /*NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    ((ViewControllerLogin*)vista).text.text = theXML;*/
    
    xmlParser = [[NSXMLParser alloc] initWithData:webData];
    [xmlParser setDelegate:self];
    [xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"Mensaje"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"nombre"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"tieneError"])
    {
        stringActual = elementName;
    }
    if([elementName isEqualToString:@"tipoCambio"]) {
        stringActual = elementName;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([stringActual isEqualToString:@"Mensaje"]) {
        //NSLog(@"M %@", string);
        ((ViewControllerLogin*)vista).text.text = string;
    }
    if ([stringActual isEqualToString:@"nombre"]) {
        NSLog(@"%@", string);
    }
    if ([stringActual isEqualToString:@"tieneError"]) {
        //NSLog(@"bandera '%@'", string);
        if([string isEqualToString:@"true"]){
            [self.delegate_login autentificarUsuario:YES];
            //((ViewControllerLogin*)vista).bAcceso = YES;
        }
        if([string isEqualToString:@"false"]){
            [self.delegate_login autentificarUsuario:NO];
            //((ViewControllerLogin*)vista).bAcceso = NO;
        }
    }
    if ([stringActual isEqualToString:@"tipoCambio"]) {
        
    }
}

@end
