# Polybar Gmail

Um [Polybar](https://github.com/jaagr/polybar) Um módulo para mostrar mensagens não lidas do Gmail.

![preview](https://github.com/vyachkonovalov/polybar-gmail/raw/master/preview.png)

## Dependências

```sh
sudo pip install --upgrade oauth2client google-api-python-client
```

**Font Awesome** - para ícone de e-mail

**canberra-gtk-play** - para novo som de e-mail

Você pode alterar o selo ou desativar o som. Para mais informações, consulte [argumentos de script](#script-arguments)

## Instalação

```sh
cd ~/.config/polybar
curl -LO https://github.com/vyachkonovalov/polybar-gmail/archive/master.tar.gz
tar zxf master.tar.gz && rm master.tar.gz
mv polybar-gmail-master gmail
```

e obter/atualizar credenciais

```sh
~/.config/polybar/gmail/auth.py
```

### Módulo

```ini
[module/gmail]
type = custom/script
exec = ~/.config/polybar/gmail/launch.py
tail = true
click-left = xdg-open https://mail.google.com
```

## Argumentos de script

`-l` ou `--label` - definir [rótulo](https://developers.google.com/gmail/api/v1/reference/users/labels/list) da caixa de correio do usuário, padrão: INBOX

`-p` or `--prefix` - definir distintivo de email, padrão: ``` 📧 ```

`-c` or `--color` - defina a nova cor do ícone de e-mail, padrão: #e06c75

`-ns` or `--nosound` - desativar o novo som de e-mail

### Exemplo

```sh
./launch.py --label 'CATEGORY_PERSONAL' --prefix '📧' --color '#be5046' --nosound
```

## Como obter uma lista completa dos rótulos da caixa de correio

```python
from apiclient import discovery
from oauth2client import file

CREDENTIALS_PATH = '/path/to/credentials.json'
gmail = discovery.build('gmail', 'v1', credentials=file.Storage(CREDENTIALS_PATH).get())
gmail.users().labels().list(userId='me').execute()
```
