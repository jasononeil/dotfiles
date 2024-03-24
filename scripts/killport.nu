#!/usr/bin/env nu

def main [port: int] {
  let process = (lsof -t -i $":($port)")
  kill -s 9 ($process | into int)
}
