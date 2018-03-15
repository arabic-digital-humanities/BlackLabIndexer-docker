#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "/index-safar/:/BlackLab/core/target/blacklab-1.7.0-SNAPSHOT.jar", "nl.inl.blacklab.tools.IndexTool"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/blacklab

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

outputs: 
  out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.index_name)
