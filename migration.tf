resource "atlas_migration" "extensions" {
  dir = "../migrations/01_extensions"
  depends_on = [atlas_schema.all]
}

resource "atlas_migration" "fdw" {
  dir = "../migrations/02_fdw"
  depends_on = [atlas_migration.extensions]
}

resource "atlas_migration" "cron" {
  dir = "../migrations/03_cron_jobs"
  depends_on = [atlas_migration.fdw]
}

resource "atlas_migration" "functions" {
  dir = "../migrations/04_load_functions"
  depends_on = [atlas_migration.cron]
}

resource "atlas_migration" "seeds" {
  dir = "../migrations/05_seeds"
  depends_on = [atlas_migration.functions]
}