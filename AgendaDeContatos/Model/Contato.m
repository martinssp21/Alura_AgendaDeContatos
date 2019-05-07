//
//  Contato.m
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description{
    NSString *dados = [NSString stringWithFormat:@"Nome: %@, Endereço: %@, e-mail: %@, Telefone: %@, Site: %@", self.Nome, self.Endereco, self.Email, self.Telefone, self.Site];
    return dados;
}

@end
