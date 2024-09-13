# Step 1: Specify the base image with the latest Node.js version
FROM node:20

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the package.json and pnpm-lock.yaml (if available)
COPY package.json pnpm-lock.yaml* ./

# Step 4: Install pnpm and dependencies
RUN npm install -g pnpm \
    && pnpm install


# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the port the application will run on (if required)
EXPOSE 3000

# Step 7: Specify the command to run the application
CMD ["pnpm", "build"]