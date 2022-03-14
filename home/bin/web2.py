import requests
from bs4 import BeautifulSoup

headers = {'User-Agent': 'Mozilla/5.0'}

pagina = requests.get('https://br.investing.com/crypto/', headers=headers)

soup = BeautifulSoup(pagina.text, 'html.parser')

dados = soup.find("table", {"class": "js-top-crypto-table"}).find('tbody').find_all('tr')

for fundo in dados:
    dados_fundo = fundo.find_all("td")
    print(
        f"[{dados_fundo[2].text}]\n"
        f"\tPreço USD: {dados_fundo[3].text}\n"
        f"\tCapitalização: {dados_fundo[4].text}\n"
    )
