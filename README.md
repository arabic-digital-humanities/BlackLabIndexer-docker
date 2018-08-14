# BlackLabIndexer-docker
Dockerfile and CWL step for the [BlackLab Indexer](http://inl.github.io/BlackLab/)

## Usage

Index using the command line:

```
cwltool https://raw.githubusercontent.com/arabic-digital-humanities/BlackLabIndexer-docker/master/blacklabindexer.cwl --action create --index_format safar-stemmer --text_direction rtl --content_viewable --index_name corpus --in_dir path/to/input/data
```

Use it as step in a workflow:

```
with WorkflowGenerator(working_dir='path/to/working_dir') as wf:

    ...

    wf.load(step_file='https://raw.githubusercontent.com/arabic-digital-humanities/BlackLabIndexer-docker/master/blacklabindexer.cwl')

    ...

    index_name = wf.add_input(index_name='string', default='corpus')
    action = wf.add_input(action='string', default='create')
    index_format = wf.add_input(index_format='string', default='safar-stemmer')
    text_direction = wf.add_input(text_direction='string', default='rtl')
    content_viewable = wf.add_input(content_viewable='boolean', default=True)

    ...

    indexed = wf.blacklabindexer(action=action,
                                 index_format=index_format,
                                 index_name=index_name,
                                 in_dir=merged_dir,
                                 text_direction=text_direction,
                                 content_viewable=content_viewable)

    ...

    wf.add_outputs(indexed=indexed)

    ...

    wf.save('path/to/workflow.cwl', wd=True, relative=False)
```
