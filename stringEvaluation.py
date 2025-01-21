import time


class Test:
    def constructor(self):
        self.a = 0


def evaluate(s):
    if s is None or len(s) == 0:
        return 0
    s += "+"
    num = 0
    rst = 0
    sign = 1
    last_op = 0
    temp_rst = 1
    i = 0
    while i < len(s):
        if s[i].isspace():
            i += 1
            continue
        if s[i].isdigit():
            num = 10 * num + int(s[i])
        else:
            num *= sign
            if s[i] in "+-":
                sign = 1 if s[i] == "+" else -1
                if last_op == 0:
                    rst += num
                elif last_op == 1:
                    temp_rst *= num
                    rst += temp_rst
                    temp_rst = 1
                elif last_op == 2:
                    temp_rst /= num
                    rst += temp_rst
                    temp_rst = 1
                last_op = 0
                num = 0

            elif s[i] in "*/":
                if last_op == 0:
                    temp_rst = num
                elif last_op == 1:
                    temp_rst *= num
                elif last_op == 2:
                    temp_rst /= num
                last_op = 1 if s[i] == "*" else 2
                num = 0

            # handling parenthesis
            elif s[i] == "(":
                index = i
                count_left = 0
                while index < len(s):
                    if s[index] == "(":
                        count_left += 1
                    if s[index] == ")":
                        count_left -= 1
                        if count_left == 0:
                            break
                    index += 1
                if index == len(s):
                    print("invalid input")
                    return 0
                sli = s[i + 1 : index]
                num = evaluate(sli)
                i = index  # the addition 1 is added in the while loop
        i += 1
    return rst


class Timer(object):
    def __enter__(self):
        self.start = time.time()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):  # noqa
        self.end = time.time()
        self.interval = self.end - self.start


with Timer() as t:
    for _ in range(300000):
        evaluate("2*(-10)*((3-1)*2/4-5+1*(4/2)+(-1))/7")
        # evaluate("2*(-10)/5*2+1-4*8")
    #  for _ in range(2):
    #      evaluate("2*(-10)*((3-1)*2/4-5+1*(4/2)+(-1))")

print("Time cost is %.5f sec." % t.interval)

print(evaluate("2*(-10)*((3-1)*2/4-5+1*(4/2)+(-1))/7"))
