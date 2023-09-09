resource "local_file" "new_file"{
  filename = "path/demo.txt"
  content = "this is file created with terraform"
}
