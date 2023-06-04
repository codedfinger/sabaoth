# Build stage
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the app source code to the container
COPY . .

# Expose port
EXPOSE 3000

# Start the Next app
CMD ["npm", "run", "dev"]
