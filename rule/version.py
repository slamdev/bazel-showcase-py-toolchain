import sys

if __name__ == "__main__":
    f = open(sys.argv[1], "a")
    f.write(sys.version)
    f.close()
