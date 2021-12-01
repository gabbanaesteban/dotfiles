#!/usr/bin/env zx

function ok() {
  console.log(chalk.green('[ok]'))
}

function bot(message) {
  console.log(chalk.green('\\[._.]/'), `- ${message}`)
}

function running(message) {
  console.log(chalk.cyan('⇒ '), message)
}

function action(message) {
  console.log(chalk.blue('[action]'), '\n', chalk.blue('⇒ '), message)
}

function warn(message) {
  console.log(chalk.yellow('[warning] '), message)
}

function error(message) {
  console.log(chalk.red('[error] '), message)
}


ok()
bot('Hello this is your new computer!')
running('Downloading the latest version of Node.js')
action('Do you want to install this package? (y/n)')
warn('I dont have anything to do with this')
error('Opps! Something went wrong!')