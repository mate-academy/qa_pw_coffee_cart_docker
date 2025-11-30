# Use official Node.js image as a base
FROM node:22-slim

# Set working directory to project root
WORKDIR /

# Copy only package.json and package-lock.json first (better caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Install Playwright Chromium browser with all required dependencies
RUN npx playwright install --with-deps chromium

# Copy the rest of the project files
COPY . .

# Default command to run tests
CMD ["npx", "playwright", "test"]