val = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
for i = 1:10
    val(i) = 1;
end

keyset = keys(val)
remove(val, keys(val));
keyset = keys(val)
size(val, 1)