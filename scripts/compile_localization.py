import glob
import os

def doTheThing(lang):


    path = os.path.realpath(__file__) + '\\..\\..\\pf_localizations\\' + lang

    output = open(
        os.path.realpath(__file__) + '\\..\\..\\resource\\addon_' + lang.lower() + '.txt', 'w+', encoding='utf-8')

    write_opener(output)

    txtName = glob.glob(path + "\\*.txt")
    for name in txtName:
        if name != path + '\\' + "test_output.txt" and name != path + '\\' + "template.txt":
            inPath = name
            write_meat(inPath, output)

    write_closer(output)
    output.close


def write_meat(input, output):
    with open(input, 'r', encoding='utf-8') as f:
        for line in f:
            if line[0] == '>':
                line = '//' + line

            output.write('\t' + line)


def write_opener(file):
    opener = '"lang"\n{\n\t"Language"\t"English"\n\t"Tokens"\n\t{\n'
    file.write(opener)


def write_closer(file):
    closer = '\n\t}\n}'
    file.write(closer)


doTheThing('english')
# doTheThing('russian')
