import requests
from bs4 import BeautifulSoup

headers = {'User-Agent': 'Mozilla/5.0'}

pagina = requests.get('https://coinmarketcap.com/pt-br', headers=headers)

soup = BeautifulSoup(pagina.text, 'html.parser')

dados = soup.find("table", {"class": "h7vnx2-2"}).find('tbody').find_all('tr')

for fundo in dados:
    dados_fundo = fundo.find_all("td")
    print(
        f"[{dados_fundo[2].text}]\n"
        f"\tCotação: {dados_fundo[3].text}\n"
    )
