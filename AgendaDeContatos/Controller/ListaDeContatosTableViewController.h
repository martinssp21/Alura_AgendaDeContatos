//
//  ListaDeContatosTableViewController.h
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/ContatoDAO.h"
#import "../Controller/ViewController.h"

@interface ListaDeContatosTableViewController : UITableViewController<ViewControllerDelegate>

@property ContatoDAO *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

@end

