###################################################
# Format the Hive syntax to standardize script look
###################################################
import re  # regular expression


def get_op_file_name():
    dot_index = ip_file.find(".")
    ip_file_name = ip_file[:dot_index]
    extension = ip_file[dot_index + 1:]
    return ip_file_name + "_op" + "." + extension


def keywords():  # parses Keywords file and gets all the keywords into a list
    keywords = []
    for line in open(KEY_FILE):
        kwds = line.split(",")
        keywords.extend(kwds)
    # remove any white spaces leading or trailing
    keywords = list(map(lambda keyword: keyword.strip(), keywords))
    return keywords


def get_spaced_line(words):  # adds a space to the end of each word
    line = ""
    for word in words:
        line = line + word + " "
    return line


def to_be_formatted(word):
    if word.upper() in key_words:
        word = word.upper()
    else:
        for kw in keywords:
            reg_exp = kw + '[(\n;]'
            if (re.search(reg_exp, word != None)


def get_formatted_line(line):  # capitalizes the KEYWORDS in a line
    words = line.split(" ")
    for word in words:
        if word.upper() in key_words:
            word = word.upper()
    return get_spaced_line(words)


################################################
ip_file = "Mdcl_pharmacy.hql"

op_file = get_op_file_name()  # appends "_op" to the ip_file

op_file_obj = open(op_file, "w")

KEY_FILE = "hive_keywords.txt"
key_words = keywords()

######################################

for line in open(ip_file):
    # code to manipulate the file
    line = get_formatted_line(line)

    op_file_obj.write(line)



