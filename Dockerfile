FROM node:22-slim
WORKDIR /

# Copy the application code into the container
COPY package.json .
COPY package-lock.json .


#install dependencies
RUN npm ci
# install Playwright and its dependencies
RUN npx playwright install --with-deps chromium
#Copy the rest of the application code into the container
COPY . .
CMD ["npx", "playwright", "test"]