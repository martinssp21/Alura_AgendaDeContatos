//
//  ListaDeContatosTableViewController.m
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import "ListaDeContatosTableViewController.h"
#import "../Model/Contato.h";

@implementation ListaDeContatosTableViewController

- (id) init {
    self = super.init;
    if(self){
        UIBarButtonItem *buttonForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        
        self.navigationItem.title = @"Contatos";
        self.navigationItem.rightBarButtonItem = buttonForm;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.dao = [ContatoDAO contatoDAOInstance];
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void) viewDidAppear:(BOOL)animated{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}

//MARK: Methods

-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contatos"];
   
    form.delegate = self;
    
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
        self.contatoSelecionado = nil;
    }
    
    form.dao = self.dao;
    
    [self.navigationController pushViewController:form animated:YES];
}

-(void) contatoAdicionado: (Contato *) contato {
    self.linhaSelecionada = [self.dao indiceDoContato: contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso.", contato.Nome];
    [self showAlert:@"Contato adicionado" mensagem:mensagem];
}

-(void) contatoAlterado: (Contato *) contato {
    self.linhaSelecionada = [self.dao indiceDoContato: contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ alterado com sucesso.", contato.Nome];
    [self showAlert:@"Contato alterado" mensagem:mensagem];
}


-(void) showAlert: (NSString *) title mensagem:(NSString *) message{
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
   
    [alerta addAction:ok];
    
    [self presentViewController:alerta animated:YES completion:nil];
}
//MARK: TableViewDataSource and TableViewDelgate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dao.total;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identificador = @"tableViewCellContato";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    
    Contato *contato = [self.dao contatoDoIndice: indexPath.row];
    cell.textLabel.text = contato.Nome;
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        Contato *contato = [self.dao contatoDoIndice:indexPath.row];
        [self.dao remover:contato];
       // [self.tableView reloadData]; Também pode ser utilizado para atualizar a tabela.
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.dao contatoDoIndice:indexPath.row];
    [self exibeFormulario];
}


@end
