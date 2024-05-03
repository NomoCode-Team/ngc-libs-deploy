terraform {
  backend "pg" {
    conn_str   = "postgresql://ngc.nomocode.io:2052"
  }
}
