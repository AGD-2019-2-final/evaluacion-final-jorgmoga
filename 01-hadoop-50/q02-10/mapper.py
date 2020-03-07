import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        maximo = line.split(",")
        sys.stdout.write("{}\t{}\n".format(maximo[3],maximo[4]))