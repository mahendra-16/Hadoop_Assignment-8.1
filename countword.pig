a = load 'hdfs://localhost:9000/pigscript/wordcount.txt';
b = foreach a generate FLATTEN(TOKENIZE((chararray)$0)) as word;
c = filter b by word matches '\\w+';
d = group c by word;
e = foreach d generate COUNT(c), group;
dump e;

