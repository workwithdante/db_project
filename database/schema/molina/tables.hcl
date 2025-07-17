table "temp" {
  schema = schema.molina
  unlogged = true

  column "Broker_NPN" {
    type = bigint
    null = true
  }
  column "Broker_First_Name" {
    type = text
    null = true
  }
  column "Broker_Last_Name" {
    type = text
    null = true
  }
  column "Member_First_Name" {
    type = text
    null = true
  }
  column "Member_Last_Name" {
    type = text
    null = true
  }
  column "Address1" {
    type = text
    null = true
  }
  column "Address2" {
    type = text
    null = true
  }
  column "City" {
    type = text
    null = true
  }
  column "State" {
    type = text
    null = true
  }
  column "Zip" {
    type = bigint
    null = true
  }
  column "State.1" {
    type = text
    null = true
  }
  column "dob" {
    type = text
    null = true
  }
  column "Gender" {
    type = text
    null = true
  }
  column "Application_Date" {
    type = text
    null = true
  }
  column "Effective_date" {
    type = text
    null = true
  }
  column "Product" {
    type = text
    null = true
  }
  column "End_Date" {
    type = text
    null = true
  }
  column "Status" {
    type = text
    null = true
  }
  column "Member_Premium" {
    type = double_precision
    null = true
  }
  column "Total_Premium" {
    type = double_precision
    null = true
  }
  column "Paid_Through_Date" {
    type = text
    null = true
  }
  column "Net_Due_Amount" {
    type = double_precision
    null = true
  }
  column "Scheduled_Term_Date" {
    type = text
    null = true
  }
  column "HIX_ID" {
    type = text
    null = true
  }
  column "Subscriber_ID" {
    type = text
    null = true
  }
  column "Member_Count" {
    type = bigint
    null = true
  }
  column "Member_Bussiness_Phone" {
    type = bigint
    null = true
  }
  column "Original_Effective_Date" {
    type = text
    null = true
  }
  column "Broker_Start_Date" {
    type = text
    null = true
  }
  column "Broker_End_Date" {
    type = text
    null = true
  }
}