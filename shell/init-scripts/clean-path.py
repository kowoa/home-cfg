import os
    
# grab $PATH
path = os.environ['PATH'].split(os.pathsep)

# normalize all paths
path = map(os.path.normpath, path)

# remove duplicates via a dictionary
clean = dict.fromkeys(path)

# combine back into one path
clean_path = (os.pathsep).join(clean.keys())

# dump to stdout
print(f"{clean_path}")
