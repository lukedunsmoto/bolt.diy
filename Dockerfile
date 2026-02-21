FROM node:20-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm run build
EXPOSE 5173

# Skip all wrangler/shell scripts and run the production server directly
# This prevents the "Bad Option: --host" and SSL issuer errors
CMD ["node", "build/server/index.js"]
