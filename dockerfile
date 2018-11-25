FROM mongo

COPY . .
CMD ls *.json | sed 's/init.\(.*\).json/\1/' | while read col; do mongoimport --host mongodb --db arquitran --collection $col --type json --file "init.$col.json" --jsonArray; done