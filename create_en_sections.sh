#!/usr/bin/env bash

dirs=(
  AI
  life
  hack
  dev
  design
  health
  HR
  business
  lifehack
  it_design_architect
  devops
  devsecops
  medicine
  food
  hardware
  psychology
  finance
  social
  secrets
  security
  law
  qa
)

for d in "${dirs[@]}"; do
  mkdir -p "en/$d"
  if [ ! -f "en/$d/index.md" ]; then
    cat > "en/$d/index.md" <<EOM
---
layout: default
title: ${d}
---

# ${d}

Content for the ${d} section.
EOM
  fi
done
