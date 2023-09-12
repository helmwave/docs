---
hide:
  - toc
---
# 🔎 Monitors

Monitors run custom releases validations and can rollback releases.

### Monitors flow

```mermaid
flowchart LR
    helmwave_up[helmwave up]
    exit0[exit 0]
    
    helmwave_up --> release1[upgrade release 1]
    helmwave_up --> release2[upgrade release 2]
    helmwave_up --> release3[upgrade release 3]

    release1 -- succeeded --> monitor1_start
    release2 -- succeeded --> monitor1_start
    release2 -- succeeded --> monitor2_start
    release3 -- succeeded --> monitor2_start

    monitor1_failed -.rollback release.->release_rollback1[rollback release 1]
    monitor1_failed -.rollback release.->release_rollback2[rollback release 2]
    monitor2_failed -.rollback release.->release_rollback2[rollback release 2]
    monitor2_failed -.rollback release.->release_rollback3[rollback release 3]

    monitor1_succeeded -.-> exit0
    monitor2_succeeded -.-> exit0

    subgraph monitor1[Monitor 1]
        monitor1_start[Monitor start]
        monitor1_iteration[Monitor iteration]
        monitor1_failed[Monitor failed]
        monitor1_succeeded[Monitor succeeded]

        monitor1_start --> monitor1_iteration
        monitor1_iteration --next iteration--> monitor1_iteration
        monitor1_iteration --failure threshold or total timeout-->monitor1_failed
        monitor1_iteration --success threshold-->monitor1_succeeded
    end

    subgraph monitor2[Monitor 2]
        monitor2_start[Monitor start]
        monitor2_iteration[Monitor iteration]
        monitor2_failed[Monitor failed]
        monitor2_succeeded[Monitor succeeded]

        monitor2_start --> monitor2_iteration
        monitor2_iteration --next iteration--> monitor2_iteration
        monitor2_iteration --failure threshold or total timeout-->monitor2_failed
        monitor2_iteration --success threshold-->monitor2_succeeded
    end
```

- Each monitor starts when its all dependant releases succeeded
- Each monitor runs its iterations every `iterval` with `iteration_timeout`
- Consecutive successful iterations are counted towards `success_threshold`
- Consecutive failed iterations are counted towards `failure_threshold`
- After all monitors exited dependant releases do actions for their failed monitors 

### Demo

[![asciicast](https://asciinema.org/a/NMGo0NMZOMQjtx0bZPxtlETaL.svg)](https://asciinema.org/a/NMGo0NMZOMQjtx0bZPxtlETaL)

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

```shell title="$ helmwave build --diff-mode none"
{% include "./log" %}
```