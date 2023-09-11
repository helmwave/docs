---
hide:
  - toc
---
# 🔎 Monitors

Monitors run custom releases validations and can rollback releases.

**Monitors flow**

```mermaid
flowchart LR
    helmwave_up[helmwave up]
    
    helmwave_up --> release1[upgrade release 1]
    helmwave_up --> release2[upgrade release 2]
    helmwave_up --> release3[upgrade release 3]
    release1 -- succeeded --> monitor1
    release2 -- succeeded --> monitor1
    release2 -- succeeded --> monitor2
    release3 -- succeeded --> monitor2
    monitor1_failed -.rollback release.->release_rollback1[rollback release 1]
    monitor1_failed -.rollback release.->release_rollback2[rollback release 2]
    monitor2_failed -.rollback release.->release_rollback2[rollback release 2]
    monitor2_failed -.rollback release.->release_rollback3[rollback release 3]
    
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

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

```shell title="$ helmwave build --diff-mode none"
{% include "./log" %}
```