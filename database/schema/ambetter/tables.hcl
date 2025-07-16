schema "ambetter" {
  table "temp" {
    unlogged = true

    column "Broker Name" {
      type = text
      null = true
    }
    column "Broker NPN" {
      type = bigint
      null = true
    }
    column "Policy Number" {
      type = text
      null = true
    }
    column "Plan Name" {
      type = text
      null = true
    }
    column "Insured First Name" {
      type = text
      null = true
    }
    column "Insured Last Name" {
      type = text
      null = true
    }
    column "Broker Effective Date" {
      type = text
      null = true
    }
    column "Broker Term Date" {
      type = text
      null = true
    }
    column "Policy Effective Date" {
      type = text
      null = true
    }
    column "Policy Term Date" {
      type = text
      null = true
    }
    column "Paid Through Date" {
      type = text
      null = true
    }
    column "Member Responsibility" {
      type = double_precision
      null = true
    }
    column "Monthly Premium Amount" {
      type = double_precision
      null = true
    }
    column "County" {
      type = text
      null = true
    }
    column "State" {
      type = text
      null = true
    }
    column "On/Off Exchange" {
      type = text
      null = true
    }
    column "Exchange Subscriber ID" {
      type = text
      null = true
    }
    column "Member Phone Number" {
      type = double_precision
      null = true
    }
    column "Member Email" {
      type = text
      null = true
    }
    column "Member Date Of Birth" {
      type = text
      null = true
    }
    column "Autopay" {
      type = text
      null = true
    }
    column "Eligible for Commission" {
      type = text
      null = true
    }
    column "Number of Members" {
      type = bigint
      null = true
    }
    column "Payable Agent" {
      type = text
      null = true
    }
    column "AR Policy Type" {
      type = double_precision
      null = true
    }
    column "ICHRA Indicator" {
      type = text
      null = true
    }
    column "Employer Group Name" {
      type = double_precision
      null = true
    }
    column "Employer Start Date" {
      type = double_precision
      null = true
    }
    column "Employer Subsidy Amount" {
      type = double_precision
      null = true
    }
    column "Employer Subsidy Type" {
      type = double_precision
      null = true
    }
  }
}
