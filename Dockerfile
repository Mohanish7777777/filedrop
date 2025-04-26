FROM node:20

WORKDIR /app

# Copy the code
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/mat-sz/filedrop.git .

# Install dependencies
RUN corepack enable
RUN corepack yarn install
RUN corepack yarn build

# Expose port
EXPOSE 3000

# Start the app
CMD ["corepack", "yarn", "start"]
