view "contacts_active" {
  schema = schema.vtigercrm_2022

  as = <<-SQL
    SELECT
      b.contactid                     AS contactid,
      b.salesorder_no                 AS so_no,
      e.contact_no                    AS c_no,
      a.cf_2119                       AS member_id,
      a.cf_2257                       AS typer,
      a.cf_2255::date                 AS typing_date,
      a.cf_2059::date                 AS effective_partial_date,
      a.cf_2179::date                 AS sales_date,
      a.cf_2825                       AS consent,
      a.cf_2765                       AS state,
      a.cf_2835                       AS problem,
      a.cf_2183                       AS sales_person,
      a.cf_2261::date                 AS paid_through_date,
      a.cf_2193::date                 AS termination_partial_date,
      a.cf_2829                       AS sales_type,
      a.cf_2069                       AS company,
      TRIM(UPPER(a.cf_2067::text))    AS broker,
      a.cf_2033                       AS premium,
      a.cf_1527                       AS document,
      SUM(
        (CASE WHEN a.cf_2385 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2389 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2401 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2439 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2475 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2511 = 'OBAMACARE' THEN 1 ELSE 0 END)
        + (CASE WHEN a.cf_2615 = 'OBAMACARE' THEN 1 ELSE 0 END)
      ) OVER (PARTITION BY b.contactid)  AS applicants,
      a.cf_1463                       AS payment_type,
      a.cf_2147::integer              AS payday
    FROM vtigercrm_2022.vtiger_salesordercf AS a
    JOIN vtigercrm_2022.vtiger_salesorder    AS b ON a.salesorderid = b.salesorderid
    JOIN vtigercrm_2022.vtiger_contactscf    AS c ON b.contactid = c.contactid
    JOIN vtigercrm_2022.vtiger_crmentity     AS d ON b.salesorderid = d.crmid AND d.deleted = 0
    JOIN vtigercrm_2022.vtiger_contactdetails AS e ON b.contactid = e.contactid
    WHERE
      a.cf_2141 NOT IN ('Cancelación', 'Prospecto')
      AND a.cf_2059::date >= DATE '2025-01-01'
      AND a.cf_2067 NOT IN ('Otro Broker', 'Broker Error');
  SQL
}

view "tickets_active" {
  schema = schema.vtigercrm_2022

  as = <<-SQL
    WITH agg_tickets AS (
      SELECT contactid, ticket_cfs AS subjects
      FROM vtigercrm_2022.ticket_active_annual
    )
    SELECT
      a.*,
      COALESCE(agg.subjects, ARRAY[]::text[]) AS ticket
    FROM vtigercrm_2022.contacts_active AS a
    LEFT JOIN agg_tickets AS agg
      ON agg.contactid = a.contactid;
  SQL
}

view "contacts_monitored" {
  schema = schema.vtigercrm_2022

  depends_on = [
    materialized.contact_active_annual
  ]
  as = <<-SQL
    WITH ordered AS (
      SELECT
        d.*,
        ROW_NUMBER() OVER (
          PARTITION BY d.so_no, d.contactid
          ORDER BY
            CASE
              WHEN d.month_date = date_trunc('month', CURRENT_DATE)::date THEN 0
              ELSE 1
            END,
            d.month_date
        ) AS rownum
      FROM
        vtigercrm_2022.contact_active_annual AS d
      WHERE
        d.termination_date >= CURRENT_DATE
        AND d.month_date      >= date_trunc('month', CURRENT_DATE)
    )
    SELECT
      o1.*,
      o2.premium AS next_premium
    FROM
      ordered AS o1
      LEFT JOIN ordered AS o2
        ON o2.so_no     = o1.so_no
        AND o2.contactid = o1.contactid
        AND o2.rownum    = o1.rownum + 1
    WHERE
      o1.rownum = 1;
  SQL
}