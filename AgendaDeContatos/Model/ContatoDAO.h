//
//  ContatoDAO.h
//  AgendaDeContatos
//
//  Created by Rodrigo Martins on 06/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContatoDAO : NSObject

@property NSMutableArray *contatos;

-(void) adiconar: (Contato *) contato;

-(NSInteger) total;

-(Contato *) contatoDoIndice: (NSInteger) indice;

-(NSInteger) indiceDoContato: (Contato *) contato;

+(ContatoDAO *) contatoDAOInstance;

-(void) remover: (Contato *) contato;



@end

NS_ASSUME_NONNULL_END
