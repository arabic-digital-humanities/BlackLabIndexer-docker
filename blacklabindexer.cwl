#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/BlackLab/core/target/blacklab-1.7.0-SNAPSHOT.jar"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/blacklab
  - class: InitialWorkDirRequirement
    listing:
      - entryname: indextemplate.json
        entry: |
          {"textDirection": "$(inputs.text_direction)", "contentViewable": $(inputs.content_viewable)}

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
  text_direction:
    type: string
    default: 'ltr'
  content_viewable:
    type: boolean
    default: true
  xmx:
    type: string
    default: 4096m
    inputBinding:
      prefix: -Xmx
      separate: false
      position: 0

outputs:
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.index_name)
