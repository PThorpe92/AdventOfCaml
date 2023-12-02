def replace_nums(line: str) -> str:
    if line.rfind("one") > 0:
        line.replace("one", "1")
    if line.find("two") > 0:
        line.replace("two", "2")
    if line.find("three") > 0:
        line.replace("three", "3")
    if line.find("four") > 0:
        line.replace("four", "4")
    if line.find("five") > 0:
        line.replace("five", "5")
    if line.find("six") > 0:
        line.replace("six", "6")
    if line.find("seven") > 0:
        line.replace("seven", "7")
    if line.find("eight") > 0:
        line.replace("eight", "8")
    if line.rfind("nine") > 0:
        line.replace("nine", "9")
    return line


sum = 0
with open("input_day1", "r") as f:
    nums = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    lines = f.readlines()
    for line in lines:
        temp = ""
        line = replace_nums(line)
        for ch in line:
            if ch.isdigit():
                temp = ch
                break
        for ch in line[::-1]:
            if ch.isdigit():
                temp += ch
                break
        sum += int(temp)
    print(sum)
