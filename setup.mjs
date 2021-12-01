#!/usr/bin/env zx

import brewInstall from './installs/brew_installs.mjs'
import npmInstall from './installs/npm_installs.mjs'


await brewInstall()
await npmInstall()

