captcha = 'oops-a-plaintext-secret'

def evaluateCaptcha(value):
    total = 0
    for i in range(len(value)):
        #check to see if it's circular
        if value[i] == value[i-1]:
            total = total + int(value[i])
        else:
            continue

if __name__ == "__main__":
    evaluateCaptcha(captcha)