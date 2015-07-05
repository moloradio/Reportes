//
//  ViewControllerListaOpciones.m
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import "ViewControllerListaOpciones.h"

@interface ViewControllerListaOpciones ()

@end

@implementation ViewControllerListaOpciones
@synthesize tablaOpciones;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    listaOopciones = [[NSMutableArray alloc] initWithObjects:@"Generar Cotizacion", @"Lista de Cotizaciones", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"getCot"]) {
        [self performSegueWithIdentifier:identifier sender:nil];
    }
    if ([identifier isEqualToString:@"listCot"]) {
        [self performSegueWithIdentifier:identifier sender:nil];
    }
}

@end
