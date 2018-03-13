#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["java", "-cp", "core/target/blacklab-1.7.0-SNAPSHOT.jar", "nl.inl.blacklab.tools.IndexTool"]

requirements:
  - class: DockerRequirement
    dockerPull: nlppln/blacklab

arguments:
  - prefix: "-o"
    valueFrom: $(runtime.outdir)/$(inputs.gt.nameroot)_out.html

inputs:
  action:
    type: string
    inputBinding:
      position: 1
  index_dir:
    type: Directory
    inputBinding:
      position: 2
  in_dir:
    type: Directory
    inputBinding:
      position: 3
  format:
    type: string
    inputBinding:
      position: 4

outputs: []
