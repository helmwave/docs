---
hide:
  - toc
---
# Lifecycle

Lifecycle defines scripts that are triggered by helmwave.

**Flow hooks for `helmwave up --build`**

```mermaid
flowchart LR
    
    
    subgraph build
        global_pre_build --> pre_build
        subgraph release context
            pre_build --> post_build 
        end
        post_build --> global_post_build
    end
    
    global_post_build --> global_pre_up
    
    subgraph up
        global_pre_up --> pre_up
        subgraph release context
            pre_up --> post_up
        end
        post_up --> global_post_up
    end
    
```

```yaml title="helmwave.yml"
{% include "helmwave.yml" %}
```

```shell title="$ helmwave build --diff-mode none"
{% include "log" %}
```