schema "aetna" {
  table "temp" {
    unlogged = true

    column "Member Name" {
      type = text
      null = true
    }
    column "Relationship" {
      type = text
      null = true
    }
    column "Plan ID" {
      type = text
      null = true
    }
    column "Metal Tier" {
      type = text
      null = true
    }
    column "Marketplace" {
      type = text
      null = true
    }
    column "Subscriber Status" {
      type = text
      null = true
    }
    column "Issuer Assigned ID" {
      type = text
      null = true
    }
    column "Effective Date" {
      type = text
      null = true
    }
    column "Financial Status" {
      type = text
      null = true
    }
    column "Autopay Status" {
      type = text
      null = true
    }
    column "Paid Through Date" {
      type = text
      null = true
    }
  }
}
