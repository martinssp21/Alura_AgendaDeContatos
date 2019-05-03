//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@implementation ViewController

-(IBAction)adicionar{
    Contato *contato = [Contato new];
    
    contato.Nome = self.nome.text;
    contato.Endereco = self.endereco.text;
    contato.Telefone = self.telefone.text;
    contato.Email = self.email.text;
    contato.Site = self.site.text;

    NSLog(@"Dados do Contato: %@ %@ %@ %@ %@",
          contato.Nome, contato.Endereco, contato.Telefone, contato.Email, contato.Site);
}

@end
