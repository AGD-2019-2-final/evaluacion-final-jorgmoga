import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        
        line = line.strip()
        val1, val2  = line.split("\t")
        val2 = val2.split(",")
        val3 = len(val1)
        for i in val2:
            sys.stdout.write("{}\t{}\t{}\n".format(i, val3, str(val1)))
