# recordMyTyping


### USAGE

    ./record.sh /full/path/to/repository <link-to-repo-where-tags-will-be-uploaded> EPISODE_NUMBER


This will produce a lot of tags, one for each second. Then you could download code from specific video time stamp.

    $ git tag
    E01-00h00m00s
    E01-00h00m01s
    E01-00h00m02s
    E01-00h00m03s
    E01-00h00m04s
    E01-00h00m05s
    E01-00h00m06s
    E01-00h00m07s
    E01-00h00m08s
    E01-00h00m09s
    E01-00h00m10s
    E01-00h00m11s
    E01-00h00m12s
    E01-00h00m13s
    E01-00h00m14s
    E01-00h00m15s
    E01-00h00m16s
    E01-00h00m17s
    E01-00h00m18s
    E01-00h00m19s
    E01-00h00m20s
    # ...

Then you can:

    git clone --branch <tag> your_repo_url 

For example:

    git clone --branch E01-00h00m17s git@github.com:username/yourepository.git 


