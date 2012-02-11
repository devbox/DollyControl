//
//  AppSock.m
//  DollyControl
//
//  Created by David Rentsch on 11.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppSock.h"


#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#define PORT 1234


@implementation AppSock

@synthesize ignition;

- (void) motor{
    
    NSString *transmit = [NSString stringWithFormat:@"%i",ignition];
    
    // ------------- Daten Senden durch Socket "s" ----------    
    
    int s;
    struct sockaddr_in cli;
    struct hostent *server;
    char str [2048];    // puffer probleme durch gesamtsring?
    server = gethostbyname("127.0.0.1");
    bzero(&cli, sizeof(cli));
    cli.sin_family = AF_INET;
    cli.sin_addr.s_addr = htonl(INADDR_ANY);
    cli.sin_addr.s_addr = ((struct in_addr *) \
                           (server->h_addr))->s_addr;
    cli.sin_port = htons(PORT);
    s = socket(AF_INET, SOCK_STREAM, 0);
    connect(s, (void *)&cli, sizeof(cli));
    strcpy(str, [transmit UTF8String]);
    strcat(str, "\n");
    NSLog (@"%@",transmit);
    write(s, str, strlen(str));

}


@end
