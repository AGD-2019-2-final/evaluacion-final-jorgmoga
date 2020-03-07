import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        line = line.strip()
        key, val1, val2 = line.split("   ")
        val3=len(val2)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(val3, val2, key, val1))