FROM node:20-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
RUN pnpm run build
EXPOSE 5173
# This command uses the project's internal logic to handle the server environment correctly
CMD ["pnpm", "run", "dockerstart"]
