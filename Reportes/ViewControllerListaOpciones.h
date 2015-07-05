//
//  ViewControllerListaOpciones.h
//  Reportes
//
//  Created by USER on 11/04/15.
//  Copyright (c) 2015 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerListaOpciones : UITableViewController
{
    NSMutableArray *listaOopciones;
}
@property (strong, nonatomic) IBOutlet UITableView *tablaOpciones;

@end
