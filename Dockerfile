FROM node:22-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \

    libnss3 \

    libnspr4 \

    libdbus-1-3 \

    libatk1.0-0 \

    libatk-bridge2.0-0 \

    libcups2 \

    libdrm2 \

    libxcb1 \

    libxkbcommon0 \

    libpango-1.0-0 \

    libpangocairo-1.0-0 \

    libgtk-3-0 \

    && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Install Playwright and chromium browser
RUN npx playwright install chromium --with-deps

# Copy project content
COPY . .

# Run tests
CMD ["npx", "playwright", "test"]
