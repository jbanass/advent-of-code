captcha = 'oops-a-plaintext-secret'

def evaluateCaptcha(value):
    total = 0
    step = len(captcha)/2
    for i in range(len(value)/2):
        if value[i] == value[i + step]:
            total = total + (int(value[i])*2)
    
    print(total)

if __name__ == "__main__":
    evaluateCaptcha(captcha)