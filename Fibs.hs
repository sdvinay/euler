module Fibs (fibs) where

fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
