#!/usr/bin/env zx

const brewPackages = [
  //plugins
  "autojump",
  "zsh-syntax-highlighting",

  //clis
  "awscli",
  "httpie",
  "htop",
  "hub",

  //utils
  "fd",
  "bat",
  "lsd",
  "git-delta",
  "ripgrep",
]

const brewCaskPackages = [
  "iterm2",
  "itsycal",
  "rectangle",
  "slack",
  "spotify",
  "vlc",
  "google-chrome",
  "alfred",
  "zoom",
  "dbngin",
  "tableplus",
  "docker",
  "fig",
  "gitkraken",
  "telegram",
  "brave-browser",
  "microsoft-teams",
  "visual-studio-code"
]

async function installBrewPackages(packageName) {
  return $`brew install ${packageName}`
}

async function installBrewCaskPackages(packageName) {
  return $`brew install --cask ${packageName}`
}

export default async function brewInstall() {
  const packagesToInstall = []

  console.log(chalk.blue(`Select which ${chalk.green("brew")} packages to install: \n`))

  for (const currentPackage of [...brewPackages, ...brewCaskPackages]) {
    const answer = await question(`Do you want to install ${chalk.blue(currentPackage)} ? `)
    if (answer.match(/^y(es)?$/i) || answer === "") packagesToInstall.push(currentPackage)
    console.log("")
  }

  packagesToInstall.length && console.log(chalk.blue("Installing brew packages..."))
  console.log("")

  for (const brewPackage of packagesToInstall) {
    brewPackages.includes(brewPackage)
      ? await installBrewPackages(brewPackage).catch(handleError)
      : await installBrewCaskPackages(brewPackage).catch(handleError)
  }
}

function handleError(err) {
  const { message } = err

  if (message.match(/already an app/i)) {
    return console.log(chalk.yellow('[warning]: '), message)
  }
  
  return console.log(chalk.red('[error]: '), message)
}