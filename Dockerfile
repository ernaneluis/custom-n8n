FROM n8nio/n8n:1.122.1


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

ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV N8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true
# Revert to the node user for security purposes
USER node
