schema "company" {
    table "status_results" {
        column "id" {
        type = serial
        null = false
        }
        column "process_date" {
        type = timestamp
        null = false
        }
        column "batch_name" {
        type = text
        null = false
        }
        column "company" {
        type = text
        null = false
        }
        column "broker" {
        type = integer
        null = false
        }
        column "status" {
        type = text
        null = false
        }
        column "crm_data" {
        type = jsonb
        null = true
        }
        column "csv_data" {
        type = jsonb
        null = true
        }
        column "review" {
        type    = text
        null    = true
        default = null
        }
        column "description" {
        type    = text
        null    = true
        default = null
        }
    }
}