FROM node:22-slim

WORKDIR /

COPY package.json package-lock.json ./

RUN npm ci

RUN npx playwright install chromium --with-deps

COPY . .

CMD ["npx", "playwright", "test"]