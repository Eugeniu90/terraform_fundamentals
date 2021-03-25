# Capitolul 1.1

In acest subcapitol o sa parcurgem cateva exemple instalari de TF.

- [Linux](#a-linux--ubuntu-)
- [HomeBrew](#b-homebrew-mac)

## A. Linux ( ubuntu )

Pentru a putea descarca binarul de Terraform pe Linux, rog sa urmarim pasii de mai jos:

1.  Adaugam HashiCorp GPG KEY.

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

2. Adaugam repo-ul oficial de HashiCorp in repo-ul nostru local:

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

3. Executam un update si install de OS:

```bash
sudo apt-get update && sudo apt-get install terraform
```

4. Verificam daca este instalat Terraform corect:

```bash
terraform -help

Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

5. Activam si auto-complete pentru Terraform:

```bash
terraform -install-autocomplete
```

## B. HomeBrew MAC

1. Instalam HashiCorp repo:

```bash
brew tap hashicorp/tap
```

2. Instalam Terraform cu brew tap template:

```bash
brew install hashicorp/tap/terraform
```

3. Facem upgrade la ultima versiune de Terraform:

```bash
brew upgrade hashicorp/tap/terraform
```

4. Verificam daca totul a fost instalat cu success:

```bash
terraform -help

Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```




