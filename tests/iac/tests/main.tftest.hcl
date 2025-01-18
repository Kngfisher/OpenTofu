run "test" {
  assert {
    condition     = file(local_file.foo.filename) == "foo!"
    error_message = "Incorrect content in ${local_file.foo.filename}"
  }
}
