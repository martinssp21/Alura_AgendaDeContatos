//
//  ContatoDAO.m
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 06/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO *defaultDAO = nil;

-(id) init{
    self = [super init];
    if (self){
        self.contatos =[NSMutableArray new];
    }
    return self;
}

+(ContatoDAO *) contatoDAOInstance{
    if (!defaultDAO){
        defaultDAO = [ContatoDAO new];
    }
    
    return defaultDAO;
}

-(void) adiconar:(Contato *)contato{
    [self.contatos addObject:contato];
}

-(NSInteger) total{
    return self.contatos.count;
}

-(Contato *) contatoDoIndice:(NSInteger) indice{
    return self.contatos[indice];
}

-(NSInteger) indiceDoContato:(Contato *)contato{
    return [self.contatos indexOfObject:contato];
}

-(void) remover:(Contato *)contato{
    [self.contatos removeObject:contato];
}

@end
