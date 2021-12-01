#!/usr/bin/env zx

const npmPackages = [
  'fast-cli',
  'fkill',
]

export default async function npmInstall() {
  const packagesToInstall = []

  console.log(chalk.blue(`Select which ${chalk.green("npm")} packages to install: \n`))

  for (const currentPackage of npmPackages) {
    const answer = await question(`Do you want to install ${chalk.blue(currentPackage)} ? `)
    if (answer.match(/^y(es)?$/i) || answer === "") packagesToInstall.push(currentPackage)
    console.log("")
  }

  packagesToInstall.length && console.log(chalk.blue("Installing npm packages..."))
  console.log("")

  for (const npmPackage of packagesToInstall) {
    await $`npm install ${npmPackage}`
  }
}
