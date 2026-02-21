FROM node:20-slim
# Add this line to install CA certificates
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm run build
EXPOSE 5173

# Use the direct start command now that certificates are available
CMD ["pnpm", "run", "dockerstart"]
