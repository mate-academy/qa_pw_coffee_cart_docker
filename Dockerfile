FROM node:22-slim

WORKDIR /

COPY package.json package-lock.json ./

RUN npm ci

# Instalujemy przeglądarkę Chromium z wymaganymi zależnościami systemowymi
RUN npx playwright install --with-deps chromium

COPY . .

CMD ["npx", "playwright", "test"]

