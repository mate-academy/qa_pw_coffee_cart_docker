FROM node:22-slim

WORKDIR /

COPY package.json package-lock.json ./

RUN npm ci \
  && npx playwright install --with-deps chromium

COPY . .

CMD ["npx", "playwright", "test"]
