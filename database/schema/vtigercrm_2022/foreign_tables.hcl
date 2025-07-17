# ----------------------------------------
# vtiger_contactdetails
# ----------------------------------------
foreign_table "vtiger_contactdetails" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "contactid" {
    type = sql("BIGINT")
    null = false
  }
  column "contact_no" {
    type = sql("TEXT")
    null = false
  }
  column "accountid" {
    type = sql("BIGINT")
  }
  column "salutation" {
    type = sql("TEXT")
  }
  column "firstname" {
    type = sql("TEXT")
  }
  column "lastname" {
    type = sql("TEXT")
    null = false
  }
  column "email" {
    type = sql("TEXT")
  }
  column "phone" {
    type = sql("TEXT")
  }
  column "mobile" {
    type = sql("TEXT")
  }
  column "title" {
    type = sql("TEXT")
  }
  column "department" {
    type = sql("TEXT")
  }
  column "fax" {
    type = sql("TEXT")
  }
  column "reportsto" {
    type = sql("TEXT")
  }
  column "training" {
    type = sql("TEXT")
  }
  column "usertype" {
    type = sql("TEXT")
  }
  column "contacttype" {
    type = sql("TEXT")
  }
  column "otheremail" {
    type = sql("TEXT")
  }
  column "secondaryemail" {
    type = sql("TEXT")
  }
  column "donotcall" {
    type = sql("TEXT")
  }
  column "emailoptout" {
    type = sql("TEXT")
  }
  column "imagename" {
    type = sql("TEXT")
  }
  column "reference" {
    type = sql("TEXT")
  }
  column "notify_owner" {
    type = sql("TEXT")
  }
  column "isconvertedfromlead" {
    type = sql("TEXT")
  }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_contactdetails"
  }
}

# ----------------------------------------
# vtiger_contactscf
# ----------------------------------------
foreign_table "vtiger_contactscf" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "contactid" {
    type = sql("BIGINT")
    null = false
  }
  column "cf_755"    { type = sql("TEXT") }
  column "cf_757"    { type = sql("TEXT") }
  column "cf_759"    { type = sql("DATE") }
  column "cf_763"    { type = sql("TEXT") }
  column "cf_767"    { type = sql("TEXT") }
  column "cf_771"    { type = sql("TEXT") }
  column "cf_775"    { type = sql("TEXT") }
  column "cf_779"    { type = sql("TEXT") }
  column "cf_785"    { type = sql("TEXT") }
  column "cf_787"    { type = sql("TEXT") }
  column "cf_791"    { type = sql("TEXT") }
  column "cf_795"    { type = sql("TEXT") }
  column "cf_801"    { type = sql("TEXT") }
  column "cf_809"    { type = sql("TEXT") }
  column "cf_811"    { type = sql("TEXT") }
  column "cf_815"    { type = sql("TEXT") }
  column "cf_817"    { type = sql("TEXT") }
  column "cf_819"    { type = sql("TEXT") }
  column "cf_821"    { type = sql("TEXT") }
  column "cf_825"    { type = sql("TEXT") }
  column "cf_827"    { type = sql("TEXT") }
  column "cf_1563"   { type = sql("TEXT") }
  column "cf_1589"   { type = sql("TEXT") }
  column "cf_1691"   { type = sql("TEXT") }
  column "cf_1709"   { type = sql("TEXT") }
  column "cf_1777"   { type = sql("TEXT") }
  column "cf_1779"   { type = sql("TEXT") }
  column "cf_1781"   { type = sql("TEXT") }
  column "cf_1873"   { type = sql("DATE") }
  column "cf_1875"   { type = sql("TEXT") }
  column "cf_1881"   { type = sql("TEXT") }
  column "cf_1885"   { type = sql("SMALLINT") }
  column "cf_1887"   { type = sql("BIGINT") }
  column "cf_1893"   { type = sql("NUMERIC(11,2)") }
  column "cf_1895"   { type = sql("TEXT") }
  column "cf_1923"   { type = sql("TEXT") }
  column "cf_1925"   { type = sql("VARCHAR(1)") }
  column "cf_1927"   { type = sql("TEXT") }
  column "cf_1929"   { type = sql("NUMERIC(11,2)") }
  column "cf_1943"   { type = sql("TEXT") }
  column "cf_1945"   { type = sql("TEXT") }
  column "cf_1979"   { type = sql("TEXT") }
  column "cf_1981"   { type = sql("TEXT") }
  column "cf_1983"   { type = sql("TEXT") }
  column "cf_1989"   { type = sql("TEXT") }
  column "cf_1993"   { type = sql("TEXT") }
  column "cf_1995"   { type = sql("TEXT") }
  column "cf_2003"   { type = sql("INTEGER") }
  column "cf_2021"   { type = sql("TEXT") }
  column "cf_2103"   { type = sql("TEXT") }
  column "cf_2149"   { type = sql("TEXT") }
  column "cf_2151"   { type = sql("TEXT") }
  column "cf_2155"   { type = sql("TEXT") }
  column "cf_2187"   { type = sql("TEXT") }
  column "cf_2189"   { type = sql("TEXT") }
  column "cf_2197"   { type = sql("TEXT") }
  column "cf_2205"   { type = sql("TEXT") }
  column "cf_2207"   { type = sql("TEXT") }
  column "cf_2217"   { type = sql("TEXT") }
  column "cf_2227"   { type = sql("TEXT") }
  column "cf_2245"   { type = sql("TEXT") }
  column "cf_2247"   { type = sql("DATE") }
  column "cf_2249"   { type = sql("TEXT") }
  column "cf_2251"   { type = sql("TEXT") }
  column "cf_2253"   { type = sql("INTEGER") }
  column "cf_2267"   { type = sql("TEXT") }
  column "cf_2275"   { type = sql("TEXT") }
  column "cf_2277"   { type = sql("TEXT") }
  column "cf_2279"   { type = sql("TEXT") }
  column "cf_2283"   { type = sql("TEXT") }
  column "cf_2285"   { type = sql("TEXT") }
  column "cf_2287"   { type = sql("TEXT") }
  column "cf_2319"   { type = sql("TEXT") }
  column "cf_2721"   { type = sql("TEXT") }
  column "cf_2723"   { type = sql("DATE") }
  column "cf_2763"   { type = sql("TEXT") }
  column "cf_2767"   { type = sql("TEXT") }
  column "cf_2775"   { type = sql("TEXT") }
  column "cf_2777"   { type = sql("TEXT") }
  column "cf_2787"   { type = sql("TEXT") }
  column "cf_2789"   { type = sql("TEXT") }
  column "cf_2807"   { type = sql("TEXT") }
  column "cf_2843"   { type = sql("TEXT") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_contactscf"
  }
}

# ----------------------------------------
# vtiger_crmentity
# ----------------------------------------
foreign_table "vtiger_crmentity" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "crmid"        {
    type = sql("BIGINT")
    null = false
  }
  column "smcreatorid"  {
    type = sql("BIGINT")
    null = false
  }
  column "smownerid"    {
    type = sql("BIGINT")
    null = false
  }
  column "modifiedby"   {
    type = sql("BIGINT")
    null = false
  }
  column "setype"       {
    type = sql("TEXT")
    null = false
  }
  column "description"  { type = sql("TEXT") }
  column "createdtime"  {
    type = sql("TIMESTAMP WITHOUT TIME ZONE")
    null = false
  }
  column "modifiedtime" {
    type = sql("TIMESTAMP WITHOUT TIME ZONE")
    null = false
  }
  column "viewedtime"   { type = sql("TIMESTAMP WITHOUT TIME ZONE") }
  column "status"       { type = sql("TEXT") }
  column "version"      {
    type = sql("BIGINT")
    null = false
  }
  column "presence"     { type = sql("SMALLINT") }
  column "deleted"      {
    type = sql("SMALLINT")
    null = false
  }
  column "label"        { type = sql("TEXT") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_crmentity"
  }
}

# ----------------------------------------
# vtiger_salesorder
# ----------------------------------------
foreign_table "vtiger_salesorder" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "salesorderid" {
    type = sql("BIGINT")
    null = false
  }
  column "subject"          { type = sql("TEXT") }
  column "potentialid"      { type = sql("BIGINT") }
  column "customerno"       { type = sql("TEXT") }
  column "salesorder_no"    { type = sql("TEXT") }
  column "quoteid"          { type = sql("BIGINT") }
  column "vendorterms"      { type = sql("TEXT") }
  column "contactid"        { type = sql("BIGINT") }
  column "vendorid"         { type = sql("BIGINT") }
  column "duedate"          { type = sql("DATE") }
  column "carrier"          { type = sql("TEXT") }
  column "pending"          { type = sql("TEXT") }
  column "type"             { type = sql("TEXT") }
  column "adjustment"       { type = sql("NUMERIC(25,8)") }
  column "salescommission"  { type = sql("NUMERIC(25,3)") }
  column "exciseduty"       { type = sql("NUMERIC(25,3)") }
  column "total"            { type = sql("NUMERIC(25,8)") }
  column "subtotal"         { type = sql("NUMERIC(25,8)") }
  column "taxtype"          { type = sql("TEXT") }
  column "discount_percent" { type = sql("NUMERIC(25,3)") }
  column "discount_amount"  { type = sql("NUMERIC(25,8)") }
  column "s_h_amount"       { type = sql("NUMERIC(25,8)") }
  column "accountid"        { type = sql("BIGINT") }
  column "terms_conditions" { type = sql("TEXT") }
  column "purchaseorder"    { type = sql("TEXT") }
  column "sostatus"         { type = sql("TEXT") }
  column "currency_id" {
    type = sql("BIGINT")
    null = false
  }
  column "conversion_rate" {
    type = sql("NUMERIC(10,3)")
    null = false
  }
  column "enable_recurring" { type = sql("INTEGER") }
  column "pre_tax_total"    { type = sql("NUMERIC(25,8)") }
  column "s_h_percent"      { type = sql("INTEGER") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_salesorder"
  }
}

# ----------------------------------------
# vtiger_salesordercf
# ----------------------------------------
foreign_table "vtiger_salesordercf" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "salesorderid" {
    type = sql("BIGINT")
    null = false
  }
  column "cf_1463"    { type = sql("TEXT") }
  column "cf_1465"    { type = sql("TEXT") }
  column "cf_1469"    { type = sql("TEXT") }
  column "cf_1471"    { type = sql("TEXT") }
  column "cf_1473"    { type = sql("TEXT") }
  column "cf_1475"    { type = sql("TEXT") }
  column "cf_1477"    { type = sql("TEXT") }
  column "cf_1479"    { type = sql("TEXT") }
  column "cf_1481"    { type = sql("TEXT") }
  column "cf_1483"    { type = sql("TEXT") }
  column "cf_1489"    { type = sql("TEXT") }
  column "cf_1491"    { type = sql("TEXT") }
  column "cf_1493"    { type = sql("TEXT") }
  column "cf_1495"    { type = sql("TEXT") }
  column "cf_1497"    { type = sql("TEXT") }
  column "cf_1499"    { type = sql("TEXT") }
  column "cf_1501"    { type = sql("TEXT") }  
  column "cf_1503"    { type = sql("TEXT") }
  column "cf_1505"    { type = sql("TEXT") }
  column "cf_1507"    { type = sql("TEXT") }
  column "cf_1509"    { type = sql("TEXT") }
  column "cf_1513"    { type = sql("DATE") }
  column "cf_1515"    { type = sql("TEXT") }
  column "cf_1517"    { type = sql("TEXT") }
  column "cf_1519"    { type = sql("TEXT") }
  column "cf_1521"    { type = sql("TEXT") }
  column "cf_1523"    { type = sql("TEXT") }
  column "cf_1527"    { type = sql("TEXT") }
  column "cf_1587"    { type = sql("TEXT") }
  column "cf_2025"    { type = sql("NUMERIC(9,2)") }
  column "cf_2027"    { type = sql("NUMERIC(9,2)") }
  column "cf_2031"    { type = sql("NUMERIC(9,2)") }
  column "cf_2033"    { type = sql("NUMERIC(9,2)") }
  column "cf_2035"    { type = sql("TEXT") }
  column "cf_2037"    { type = sql("TEXT") }
  column "cf_2039"    { type = sql("NUMERIC(9,2)") }
  column "cf_2041"    { type = sql("TEXT") }
  column "cf_2043"    { type = sql("TEXT") }
  column "cf_2045"    { type = sql("NUMERIC(9,2)") }
  column "cf_2047"    { type = sql("TEXT") }
  column "cf_2049"    { type = sql("TEXT") }
  column "cf_2051"    { type = sql("TEXT") }
  column "cf_2053"    { type = sql("TEXT") }
  column "cf_2055"    { type = sql("TEXT") }
  column "cf_2057"    { type = sql("TEXT") }
  column "cf_2059"    { type = sql("DATE") }
  column "cf_2061"    { type = sql("TEXT") }
  column "cf_2063"    { type = sql("TEXT") }
  column "cf_2065"    { type = sql("TEXT") }
  column "cf_2067"    { type = sql("TEXT") }
  column "cf_2069"    { type = sql("TEXT") }
  column "cf_2071"    { type = sql("TEXT") }
  column "cf_2115"    { type = sql("TEXT") }
  column "cf_2119"    { type = sql("TEXT") }
  column "cf_2129"    { type = sql("DATE") }
  column "cf_2141"    { type = sql("TEXT") }
  column "cf_2143"    { type = sql("INTEGER") }
  column "cf_2145"    { type = sql("TEXT") }
  column "cf_2147"    { type = sql("SMALLINT") }
  column "cf_2157"    { type = sql("TEXT") }
  column "cf_2179"    { type = sql("DATE") }
  column "cf_2183"    { type = sql("TEXT") }
  column "cf_2193"    { type = sql("DATE") }
  column "cf_2203"    { type = sql("TEXT") }
  column "cf_2215"    { type = sql("TEXT") }
  column "cf_2255"    { type = sql("DATE") }
  column "cf_2257"    { type = sql("TEXT") }
  column "cf_2261"    { type = sql("DATE") }
  column "cf_2263"    { type = sql("DATE") }
  column "cf_2273"    { type = sql("TEXT") }
  column "cf_2291"    { type = sql("INTEGER") }
  column "cf_2293"    { type = sql("TEXT") }
  column "cf_2295"    { type = sql("TEXT") }
  column "cf_2297"    { type = sql("TEXT") }
  column "cf_2299"    { type = sql("DATE") }
  column "cf_2303"    { type = sql("TEXT") }
  column "cf_2321"    { type = sql("TEXT") }
  column "cf_2323"    { type = sql("TEXT") }
  column "cf_2333"    { type = sql("TEXT") }
  column "cf_2335"    { type = sql("TEXT") }
  column "cf_2337"    { type = sql("NUMERIC(13,2)") }
  column "cf_2339"    { type = sql("TEXT") }
  column "cf_2341"    { type = sql("TEXT") }
  column "cf_2347"    { type = sql("TEXT") }
  column "cf_2349"    { type = sql("TEXT") }
  column "cf_2351"    { type = sql("TEXT") }
  column "cf_2355"    { type = sql("DATE") }
  column "cf_2357"    { type = sql("TEXT") }
  column "cf_2359"    { type = sql("TEXT") }
  column "cf_2369"    { type = sql("TEXT") }
  column "cf_2375"    { type = sql("TEXT") }
  column "cf_2377"    { type = sql("TEXT") }
  column "cf_2379"    { type = sql("TEXT") }
  column "cf_2383"    { type = sql("TEXT") }
  column "cf_2385"    { type = sql("TEXT") }
  column "cf_2387"    { type = sql("TEXT") }
  column "cf_2389"    { type = sql("TEXT") }
  column "cf_2401"    { type = sql("TEXT") }
  column "cf_2405"    { type = sql("TEXT") }
  column "cf_2407"    { type = sql("TEXT") }
  column "cf_2409"    { type = sql("TEXT") }
  column "cf_2411"    { type = sql("TEXT") }
  column "cf_2413"    { type = sql("DATE") }
  column "cf_2417"    { type = sql("TEXT") }
  column "cf_2423"    { type = sql("TEXT") }
  column "cf_2431"    { type = sql("TEXT") }
  column "cf_2433"    { type = sql("TEXT") }
  column "cf_2435"    { type = sql("TEXT") }
  column "cf_2437"    { type = sql("TEXT") }
  column "cf_2439"    { type = sql("TEXT") }
  column "cf_2443"    { type = sql("TEXT") }
  column "cf_2445"    { type = sql("TEXT") }
  column "cf_2447"    { type = sql("TEXT") }
  column "cf_2449"    { type = sql("TEXT") }
  column "cf_2451"    { type = sql("DATE") }
  column "cf_2455"    { type = sql("TEXT") }
  column "cf_2459"    { type = sql("TEXT") }
  column "cf_2465"    { type = sql("TEXT") }
  column "cf_2469"    { type = sql("TEXT") }
  column "cf_2471"    { type = sql("TEXT") }
  column "cf_2473"    { type = sql("TEXT") }
  column "cf_2475"    { type = sql("TEXT") }
  column "cf_2479"    { type = sql("TEXT") }
  column "cf_2481"    { type = sql("TEXT") }
  column "cf_2483"    { type = sql("TEXT") }
  column "cf_2485"    { type = sql("TEXT") }
  column "cf_2487"    { type = sql("DATE") }
  column "cf_2491"    { type = sql("TEXT") }
  column "cf_2495"    { type = sql("TEXT") }
  column "cf_2501"    { type = sql("TEXT") }
  column "cf_2505"    { type = sql("TEXT") }
  column "cf_2507"    { type = sql("TEXT") }
  column "cf_2509"    { type = sql("TEXT") }
  column "cf_2511"    { type = sql("TEXT") }
  column "cf_2515"    { type = sql("TEXT") }
  column "cf_2517"    { type = sql("TEXT") }
  column "cf_2519"    { type = sql("TEXT") }
  column "cf_2521"    { type = sql("TEXT") }
  column "cf_2523"    { type = sql("DATE") }
  column "cf_2527"    { type = sql("TEXT") }
  column "cf_2531"    { type = sql("TEXT") }
  column "cf_2537"    { type = sql("TEXT") }
  column "cf_2543"    { type = sql("TEXT") }
  column "cf_2545"    { type = sql("TEXT") }
  column "cf_2601"    { type = sql("TEXT") }
  column "cf_2603"    { type = sql("TEXT") }
  column "cf_2605"    { type = sql("TEXT") }
  column "cf_2607"    { type = sql("TEXT") }
  column "cf_2609"    { type = sql("TEXT") }
  column "cf_2615"    { type = sql("TEXT") }
  column "cf_2629"    { type = sql("TEXT") }
  column "cf_2631"    { type = sql("TEXT") }
  column "cf_2639"    { type = sql("TEXT") }
  column "cf_2645"    { type = sql("TEXT") }
  column "cf_2647"    { type = sql("TEXT") }
  column "cf_2649"    { type = sql("TEXT") }
  column "cf_2679"    { type = sql("TEXT") }
  column "cf_2681"    { type = sql("DATE") }
  column "cf_2683"    { type = sql("TEXT") }
  column "cf_2685"    { type = sql("TEXT") }
  column "cf_2687"    { type = sql("TEXT") }
  column "cf_2699"    { type = sql("TEXT") }
  column "cf_2709"    { type = sql("TEXT") }
  column "cf_2711"    { type = sql("TEXT") }
  column "cf_2713"    { type = sql("TEXT") }
  column "cf_2715"    { type = sql("TEXT") }
  column "cf_2717"    { type = sql("TEXT") }
  column "cf_2719"    { type = sql("TEXT") }
  column "cf_2725"    { type = sql("INTEGER") }
  column "cf_2731"    { type = sql("TEXT") }
  column "cf_2733"    { type = sql("TEXT") }
  column "cf_2737"    { type = sql("TEXT") }
  column "cf_2739"    { type = sql("TEXT") }
  column "cf_2743"    { type = sql("TEXT") }
  column "cf_2745"    { type = sql("TEXT") }
  column "cf_2747"    { type = sql("TEXT") }
  column "cf_2749"    { type = sql("TEXT") }
  column "cf_2751"    { type = sql("TEXT") }
  column "cf_2753"    { type = sql("TEXT") }
  column "cf_2755"    { type = sql("TEXT") }
  column "cf_2757"    { type = sql("TEXT") }
  column "cf_2759"    { type = sql("TEXT") }
  column "cf_2765"    { type = sql("TEXT") }
  column "cf_2769"    { type = sql("TEXT") }
  column "cf_2773"    { type = sql("TEXT") }
  column "cf_2795"    { type = sql("TEXT") }
  column "cf_2799"    { type = sql("TEXT") }
  column "cf_2803"    { type = sql("TEXT") }
  column "cf_2805"    { type = sql("TEXT") }
  column "cf_2823"    { type = sql("TEXT") }
  column "cf_2825"    { type = sql("TEXT") }
  column "cf_2827"    { type = sql("TEXT") }
  column "cf_2829"    { type = sql("TEXT") }
  column "cf_2831"    { type = sql("TEXT") }
  column "cf_2833"    { type = sql("TEXT") }
  column "cf_2835"    { type = sql("TEXT") }
  column "cf_2837"    { type = sql("TEXT") }
  column "cf_2841"    { type = sql("TEXT") }
  column "cf_2845"    { type = sql("TEXT") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_salesordercf"
  }
}

# ----------------------------------------
# vtiger_ticketcf
# ----------------------------------------
foreign_table "vtiger_ticketcf" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "ticketid"    {
    type = sql("BIGINT")
    null = false
  }
  column "from_portal" { type = sql("TEXT") }
  column "cf_1987"     { type = sql("TEXT") }
  column "cf_2209"     { type = sql("TEXT") }
  column "cf_2259"     { type = sql("TEXT") }
  column "cf_2727"     { type = sql("TEXT") }
  column "cf_2853"     { type = sql("DATE") }
  column "cf_2855"     { type = sql("TEXT") }
  column "cf_2857"     { type = sql("INTEGER") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_ticketcf"
  }
}

# ----------------------------------------
# vtiger_troubletickets
# ----------------------------------------
foreign_table "vtiger_troubletickets" {
  schema = schema.vtigercrm_2022
  server = "mariadb_srv"

  column "ticketid"   {
    type = sql("BIGINT")
    null = false
  }
  column "ticket_no"  {
    type = sql("TEXT")
    null = false
  }
  column "groupname"  { type = sql("TEXT") }
  column "parent_id"  { type = sql("BIGINT") }
  column "product_id" { type = sql("TEXT") }
  column "priority"   { type = sql("TEXT") }
  column "severity"   { type = sql("TEXT") }
  column "status"     { type = sql("TEXT") }
  column "category"   { type = sql("TEXT") }
  column "title"      {
    type = sql("TEXT")
    null = false
  }
  column "solution"   { type = sql("TEXT") }
  column "update_log" { type = sql("TEXT") }
  column "version_id" { type = sql("INTEGER") }
  column "hours"      { type = sql("NUMERIC(25,8)") }
  column "days"       { type = sql("NUMERIC(25,8)") }
  column "contact_id" { type = sql("BIGINT") }

  options = {
    dbname     = "vtigercrm_2022"
    table_name = "vtiger_troubletickets"
  }
}
