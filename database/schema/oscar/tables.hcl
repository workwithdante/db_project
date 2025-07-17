table "temp" {
  unlogged = true

  schema = schema.oscar

  column "Member ID" {
    type = text
    null = true
  }
  column "Member name" {
    type = text
    null = true
  }
  column "Date of birth" {
    type = text
    null = true
  }
  column "Account creation status" {
    type = text
    null = true
  }
  column "Email" {
    type = text
    null = true
  }
  column "Phone number" {
    type = double_precision
    null = true
  }
  column "Mailing address" {
    type = text
    null = true
  }
  column "State" {
    type = text
    null = true
  }
  column "Enrollment type" {
    type = text
    null = true
  }
  column "On exchange" {
    type = text
    null = true
  }
  column "Plan" {
    type = text
    null = true
  }
  column "Premium amount" {
    type = text
    null = true
  }
  column "APTC subsidy" {
    type = text
    null = true
  }
  column "Lives" {
    type = bigint
    null = true
  }
  column "Coverage start date" {
    type = text
    null = true
  }
  column "Coverage end date" {
    type = text
    null = true
  }
  column "Policy status" {
    type = text
    null = true
  }
  column "Renewal enrollment type" {
    type = double_precision
    null = true
  }
  column "Renewal plan" {
    type = double_precision
    null = true
  }
  column "Renewal premium amount" {
    type = double_precision
    null = true
  }
  column "Renewal APTC subsidy" {
    type = double_precision
    null = true
  }
  column "Renewal date" {
    type = double_precision
    null = true
  }
  column "Autopay" {
    type = text
    null = true
  }
  column "ICHRA member" {
    type = text
    null = true
  }
  column "Estimated FPL" {
    type = integer
    null = true
  }
}