## Remember, this error means that you need to create a CVM in hongkong, so in demo03 you need to chnage the thing a bit to make this k3s script work in hongkong .

╷
│ Error: Invalid function argument
│ 
│   on k3s.tf line 46, in resource "null_resource" "fetch_kubeconfig":
│   46:       "echo '${file("${path.module}/sshkey/key.pub")}' >> ~/.ssh/authorized_keys",
│     ├────────────────
│     │ while calling file(path)
│     │ path.module is "."
│ 
│ Invalid value for "path" parameter: no file exists at "./sshkey/key.pub"; this function works only with files that are distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you must instead obtain this result
│ from an attribute of that resource.