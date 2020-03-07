import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        key, val3, val2, val1 = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(key, val1, val2))