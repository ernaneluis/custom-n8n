FROM n8nio/n8n:latest

# Switch to root user to install global npm packages
USER root

# Install the desired npm packages globally
RUN npm install -g \
  @modelcontextprotocol/sdk \
  n8n-nodes-mcp \
  @langchain/core \
  firecrawl-mcp \
  lodash \
  date-fns \
  axios \
  cheerio \
  sanitize-html \
  marked \
  validator \
  zod \
  knex \
  pg \
  sqlite3 \
  mysql2

# Revert to the node user for security purposes
USER node
