import random
import string

def random_string(length=8):
    letters = string.ascii_lowercase + string.digits
    return ''.join(random.choice(letters) for _ in range(length))

def random_company():
    companies = ["Google", "Microsoft", "Amazon", "Apple", "Facebook"]
    return random.choice(companies)

def random_address():
    addresses = [
        "Avenida Paulista, 1000, São Paulo",
        "Rua da Consolação, 2000, São Paulo",
        "Avenida Brigadeiro Faria Lima, 3000, São Paulo",
        "Rua Augusta, 4000, São Paulo",
        "Avenida Ipiranga, 5000, São Paulo"
    ]
    return random.choice(addresses)

RANDOM_NAME = random_string()
RANDOM_EMAIL = random_string() + "@example.com"
RANDOM_PASSWORD = random_string(10)
RANDOM_COMPANY = random_company()
RANDOM_ADDRESS = random_address()
RANDOM_ADDRESS2 = "Apt " + random_string(3)
RANDOM_ZIP = ''.join(random.choices(string.digits, k=8))
RANDOM_PHONE = ''.join(random.choices(string.digits, k=11))
RANDOM_DAY = str(random.randint(1, 31))
RANDOM_MONTH = str(random.randint(1, 12))
RANDOM_YEAR = str(random.randint(1950, 2000))
EXPECTED_MESSAGE = "Congratulations! Your new account has been successfully created!"
BASE_URL = 'https://automationexercise.com/login'
NOME = 'NomeTeste'
TRABALHO = 'TrabalhoTeste'
NOME_ATUALIZADO = 'NomeTesteAtualizado'
TRABALHO_ATUALIZADO = 'TrabalhoTesteAtualizado'
