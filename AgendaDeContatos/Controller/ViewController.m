//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import "ViewController.h"
#import "../Model/Contato.h"

@implementation ViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self){
        self.dao = [ContatoDAO contatoDAOInstance];
    }
    
    return self;
}

-(void) configuraLabels {
    self.nome.text = self.contato.Nome;
    self.endereco.text = self.contato.Endereco;
    self.telefone.text = self.contato.Telefone;
    self.email.text = self.contato.Email;
    self.site.text = self.contato.Site;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *buttonAdd= nil;
    
    if(self.contato){
        buttonAdd= [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(alterarContato)];
        self.navigationItem.title = @"Editar Contato";
        
        [self configuraLabels];
        
    } else {
        buttonAdd= [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adicionarContato)];
        self.navigationItem.title = @"Novo Contato";
    }
    self.navigationItem.rightBarButtonItem = buttonAdd;
}

-(void) adicionarContato {
    self.contato = [Contato new];
    [self pegaDadosDoFormulario];
    [self.dao adiconar: self.contato ];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAdicionado: self.contato];
}

-(void) alterarContato {
    [self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAlterado: self.contato];
}

-(void) pegaDadosDoFormulario {
    self.contato.Nome = self.nome.text;
    self.contato.Endereco = self.endereco.text;
    self.contato.Telefone = self.telefone.text;
    self.contato.Email = self.email.text;
    self.contato.Site = self.site.text;
}

@end
