#!/bin/bash
#
cat <<EOF | /usr/bin/nc smtp.gmail.com 587
HELO Teste
MAIL FROM: <jairoabreeu@gmail.com>
RCPT TO: <jairoabreeu@gmail.com>
DATA
From: Jairo Abreu jairoabreeu@gmail.com
To: Nome do Destino jairo.abreu.3133@gmail.com
Date: $(date '+%a, %d %b %Y %H:%M:%S %z')
Subject: Assunto da mensagem
Content-Type: text/plain; charset=UTF-8
                                                                                                                                                                                               
Fala Destinatário!
 
Estou mandando este e-mail via shell script, usando o nc diretamente pelo SMTP.
Legal né?
 
Abraços!
 
.
QUIT
EOF
