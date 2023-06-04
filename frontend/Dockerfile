# Step 1: Set the base image
FROM node:14-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the entire app's source code
COPY . .

EXPOSE 3000 

CMD ["npm", "run", "dev"]

