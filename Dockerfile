FROM node:22-slim
WORKDIR /
COPY . .
RUN npm ci
RUN npx playwright install --with-deps chromium
CMD ["npx", "playwright", "test"]