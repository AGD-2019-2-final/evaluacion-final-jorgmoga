import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:
        line = line.strip()
        key, val = line.split("\t")       
        sys.stdout.write("{},{}\n".format(val, key))