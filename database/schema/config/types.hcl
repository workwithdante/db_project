schema "config" {
  type "rule_out" {
    composite = [
      { name = "applies",   type = boolean },
      { name = "label_out", type = text    },
    ]
  }
}
