#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/BlackLab/core/target/blacklab-1.7.0-SNAPSHOT.jar", "nl.inl.blacklab.tools.IndexTool"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/blacklab
  - class: InitialWorkDirRequirement
    listing: 
      - entryname: indextemplate.json
        entry: |
          {"textDirection": "$(inputs.textDirection)", "contentViewable": $(inputs.contentViewable)}

inputs:
  action:
    type: string
    inputBinding:
      position: 1
  index_format:
    type: string
    inputBinding:
      position: 4
  index_name:
    type: string
    inputBinding:
      position: 2
  in_dir:
    type: Directory
    inputBinding:
      position: 3
  text_direction:
    type: string
    default: 'ltr'
  content_viewable:
    type: boolean
    default: true

outputs: 
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.index_name)
