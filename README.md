## Setup

### Environment
```sh
/bin/bash -c "$(curl -fsSL https://bit.ly/ulken-install-dotfiles)"
```

### Prerequisites
```sh
cd ./setup
```

### GitHub SSH key
```sh
./git/generate_ssh_key
```

[Add to GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### Temporary Git config change
Comment out
```sh
[url "git@github.com:"]
  insteadOf = https://github.com/
```

as it breaks Homebrew installation.

### Install script
```sh
./install
```
