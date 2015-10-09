{-# LANGUAGE OverloadedStrings #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-command-not-found"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , bundle "Tarrasch/pure"
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
