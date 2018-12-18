#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/BlackLab/core/target/blacklab-2.0.0-RC1.jar"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/blacklab:0.1.0
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.config)

arguments:
  - valueFrom: nl.inl.blacklab.tools.IndexTool
    position: 1

inputs:
  action:
    type: string
    inputBinding:
      position: 2
  index_format:
    type: string
    inputBinding:
      position: 5
  index_name:
    type: string
    inputBinding:
      position: 3
  in_dir:
    type: Directory
    inputBinding:
      position: 4
  xmx:
    type: string
    default: 4096m
    inputBinding:
      prefix: -Xmx
      separate: false
      position: 0
  config:
    type: File

outputs:
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.index_name)
