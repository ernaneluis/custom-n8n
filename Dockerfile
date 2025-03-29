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

# List installed package versions and save to a file
RUN npm list -g --depth=0 > /installed-packages.txt && \
    echo "Installed packages:" && \
    cat /installed-packages.txt

# Revert to the node user for security purposes
USER node
