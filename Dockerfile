# Wybieramy oficjalny obraz node 22 slim
FROM node:22-slim

# Ustawiamy katalog roboczy
WORKDIR /

# Kopiujemy pliki package
COPY package.json package-lock.json ./

# Instalujemy zależności
RUN npm ci

# Instalujemy przeglądarkę Chromium do Playwright z zależnościami
RUN npx playwright install chromium

# Kopiujemy resztę projektu
COPY . .

# Domyślna komenda do uruchamiania testów
CMD ["npx", "playwright", "test"]
