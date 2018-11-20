# BlackLabIndexer-docker
Dockerfile and CWL step for the [BlackLab Indexer](http://inl.github.io/BlackLab/)

## Usage

Index using the command line:

```
cwltool https://raw.githubusercontent.com/arabic-digital-humanities/BlackLabIndexer-docker/master/blacklabindexer.cwl
--action create --index_format safar-[analyzer|stemmer] --index_name corpus --in_dir path/to/input/data --config path/to/index-config.yml

Use it as step in a workflow:

```python
with WorkflowGenerator(working_dir='path/to/working_dir') as wf:

    ...

    wf.load(step_file='https://raw.githubusercontent.com/arabic-digital-humanities/BlackLabIndexer-docker/master/blacklabindexer.cwl')

    ...

    config_file = wf.add_input(config='File')
    in_dir = wf.add_input(in_dir='Directory')
    index_name = wf.add_input(index_name='string', default='corpus')
    action = wf.add_input(action='string', default='create')
    index_format = wf.add_input(index_format='string', default='safar-stemmer')
    xmx = wf.add_input(xmx='string', default='4G')

    ...

    indexed = wf.blacklabindexer(action=action,
                                 index_format=index_format,
                                 index_name=index_name,
                                 config=config_file,
                                 in_dir=merged_dir,
                                 xmx=xmx)

    ...

    wf.add_outputs(indexed=indexed)

    ...

    wf.save('path/to/workflow.cwl', mode='wd')
```

## java.lang.OutOfMemoryError

To index big documents, it may be necessary to increase the Java heap space. This can be done by setting the `--xmx` option, for example use `--xmx 4g` to set the heap space to 4Gb (this is the default value).

(Please note that the syntax for setting the maximum heap space size differs from how this option is specified in the `java` command.)
