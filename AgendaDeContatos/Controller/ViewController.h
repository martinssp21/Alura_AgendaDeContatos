//
//  ViewController.h
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/ContatoDAO.h"

@protocol ViewControllerDelegate <NSObject>

-(void) contatoAdicionado: (Contato *) contato;
-(void) contatoAlterado: (Contato *) contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *site;

@property ContatoDAO *dao;
@property Contato *contato;
@property id<ViewControllerDelegate> delegate;

@end

