FROM node:20-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm run build
EXPOSE 5173
# This executes the actual production bundle directly via Node.js
CMD ["node", "build/server/index.js"]
