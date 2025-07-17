materialized "ticket_active_annual" {
  schema = schema.vtigercrm_2022

  as = <<-SQL
    SELECT
      vt.contact_id                             AS contactid,
      array_agg(DISTINCT tc.cf_1987)            AS ticket_cfs
    FROM vtigercrm_2022.vtiger_troubletickets AS vt
    JOIN vtigercrm_2022.vtiger_crmentity AS cr
      ON cr.crmid = vt.ticketid
      AND cr.deleted = 0
    JOIN vtigercrm_2022.vtiger_ticketcf AS tc
      ON tc.ticketid = vt.ticketid
    WHERE vt.status <> 'Closed'
    GROUP BY vt.contact_id;
  SQL

  depends_on = [foreign_table.vtiger_ticketcf]
}

materialized "contact_active_annual" {
  schema = schema.vtigercrm_2022

  as = <<-SQL
    WITH contacts_with_month AS (
      SELECT
        sb.*,
        c.cal_date AS month_date
      FROM vtigercrm_2022.tickets_active AS sb
      JOIN vtigercrm_2022.calendar_blank AS c
        ON sb.effective_partial_date <= c.cal_date
        AND c.cal_date <= sb.termination_partial_date
    ),
    ranked AS (
      SELECT
        ROW_NUMBER() OVER (
          PARTITION BY ca.contactid, ca.month_date
          ORDER BY ca.sales_date
        ) AS rn,
        COUNT(*) OVER (
          PARTITION BY ca.contactid, ca.month_date
        ) AS ov_count,
        MIN(ca.effective_partial_date) OVER (
          PARTITION BY ca.contactid
        ) AS effective_date,
        MAX(ca.termination_partial_date) OVER (
          PARTITION BY ca.company, ca.broker, ca.member_id
        ) AS termination_date,
        ca.*
      FROM contacts_with_month AS ca
    )
    SELECT
      *
    FROM ranked;
  SQL

  depends_on = [ foreign_table.vtiger_ticketcf, materialized.ticket_active_annual ]

}