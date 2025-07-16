# Config
#
ENV := "development"
DATABASE_DIR := "database"
DATABASE_DOCS_DIR := "docs"
DATABASE_SCHEMA_DIR := "schema"

# Database
#
db-login:
  turso auth login
  atlas login
db-name:
  @echo forgettable-{{ENV}}
db-url:
  @turso db show $(just db-name) --url
db-create:
  turso db create $(just db-name)
db-token:
  @turso db tokens create $(just db-name)
db-migrate:
  @echo "Migrating DB..."
  cd {{DATABASE}} && \
  atlas schema apply -u "$(just db-url)?authToken=$(just db-token)" \
  --to file://{{DATABASE_SCHEMA_DIR}} --exclude '_litestream_seq,_litestream_lock'
  @echo "Migration complete!"
db-lint:
  @echo "Linting DB... (Ensure `turso dev --db-file local.db` is running)"
  cd {{DATABASE}} && \
  atlas migrate lint --dev-url "sqlite://dev?mode=memory"
db-diff:
  @echo "Diffing DB... (Ensure `turso dev --db-file local.db` is running)"
  cd {{DATABASE}} && \
  atlas migrate diff --to file://{{DATABASE_SCHEMA_DIR}} --dev-url "sqlite://dev?mode=memory"
db-cloud-push:
  @echo "Pushing DB to cloud... (Ensure `turso dev --db-file local.db` is running)"
  cd {{DATABASE}} && \
  atlas migrate push forgettable --dev-url "sqlite://dev?mode=memory"
db-ci:
  @echo "Running DB CI..."
  @echo "Please ensure `turso dev --db-file local.db` is running!"
  cd {{DATABASE}} && \
  atlas migrate lint  --dev-url "sqlite://local.db" --latest 1 -w
db-shell:
  turso db shell $(just db-name)
db-docs:
  @echo "Generating DB docs..."
  cd {{DATABASE}}/{{DATABASE_DOCS_DIR}} && \
  plantuml erd.puml && \
  open erd.png
  @echo "Generation complete!"
db-inspect:
  @echo "Inspecting DB..."
  cd {{DATABASE}} && \
  atlas schema inspect -u "$(just db-url)?authToken=$(just db-token)"
  @echo "Inspection complete!"