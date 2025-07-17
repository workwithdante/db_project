function "ensure_date" {
  schema = schema.company
  lang   = PLpgSQL
  return = sql("date")

  arg "val" {
    type = text
  }

  as = <<-SQL
    BEGIN
        IF val IS NULL OR TRIM(val) = '' THEN
            RETURN NULL;
        END IF;

        BEGIN RETURN val::DATE; EXCEPTION WHEN OTHERS THEN NULL; END;
        BEGIN RETURN TO_DATE(val, 'YYYY-MM-DD'); EXCEPTION WHEN OTHERS THEN NULL; END;
        BEGIN RETURN TO_DATE(val, 'YYYY/MM/DD'); EXCEPTION WHEN OTHERS THEN NULL; END;
        BEGIN RETURN TO_DATE(val, 'MM/DD/YYYY'); EXCEPTION WHEN OTHERS THEN NULL; END;
        BEGIN RETURN TO_DATE(val, 'MM-DD-YYYY'); EXCEPTION WHEN OTHERS THEN NULL; END;
        RETURN NULL;
    END;
  SQL
}

function "ensure_date_date" {
  schema = schema.company
  lang   = PLpgSQL
  return = sql("date")

  arg "val" {
    type = sql("date")
  }

  as = "BEGIN RETURN val; END;"
}

function "ensure_date_timestamp" {
  schema = schema.company
  lang   = PLpgSQL
  return = sql("date")

  arg "val" {
    type = sql("timestamp")
  }

  as = "BEGIN RETURN val::DATE; END;"
}

function "ensure_date_timestamptz" {
  schema = schema.company
  lang   = PLpgSQL
  return = sql("date")

  arg "val" {
    type = sql("timestamptz")
  }

  as = "BEGIN RETURN val::DATE; END;"
}

function "last_day_curdate" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  as = <<-SQL
    SELECT (date_trunc('month', current_date) + INTERVAL '1 month' - INTERVAL '1 day')::DATE;
  SQL
}

function "last_day_curyear" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  as = <<-SQL
    SELECT make_date(EXTRACT(YEAR FROM current_date)::int, 12, 31)::DATE;
  SQL
}

function "last_day_last_month" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  as = <<-SQL
    SELECT (date_trunc('month', current_date) - INTERVAL '1 day')::DATE;
  SQL
}

function "last_day_last_year" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  as = <<-SQL
    SELECT make_date(EXTRACT(YEAR FROM current_date)::int, 12, 31)::DATE - INTERVAL '1 year';
  SQL
}

function "last_day_two_last_month" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  as = <<-SQL
    SELECT (date_trunc('month', current_date) - INTERVAL '1 month' - INTERVAL '1 day')::DATE;
  SQL
}

function "parse_date_mixed" {
  schema     = schema.company
  lang       = SQL
  volatility = IMMUTABLE
  return     = sql("date")

  arg "val" {
    type = text
  }

  as = <<-SQL
    SELECT CASE
      WHEN val IS NULL THEN NULL
      WHEN val ~ '^\\d{4}-\\d{2}-\\d{2}$' THEN val::DATE
      WHEN val ~ '^\\d{1,2}/\\d{1,2}/\\d{4}$' THEN to_date(val, 'MM/DD/YYYY')
      ELSE NULL
    END;
  SQL
}
