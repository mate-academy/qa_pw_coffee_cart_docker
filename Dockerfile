FROM node:22-slim

WORKDIR /

COPY package*.json ./
RUN npm ci

COPY . .
RUN npx playwright install --with-deps chromium

CMD ["npx", "playwright", "test"]
