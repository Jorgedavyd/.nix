# Tasks

## Environment
### Global
compilers and interpreters -> (nvcc, clang, python, lua, etc)
infra tools -> (minikube, helm, docker)

### Per project
Create derivations for them {
    dependencies (torch, cudnn, etc.) {
        Dev {
            - [ ] Tensor RT
            - [ ] Torch
            - [ ] Transformers
            - [ ] LoRA Lib
        }
    }
}

## Nix Tasks (also workflow)

- [ ] Learn how to use flakes throughly for reproducibility.
- [ ] Create overlays for particular packages I use.
    - [ ] cudnn, tensorboard, cufft, etc.
- [ ] Instead of having dependencies tied to my main machine, have them in flakes for each project.
- [ ] Create flakes for each project.
