import math


def linearRegression(x,y):
    global b1,b0
    print("LEN of X and Y :",len(x),len(y))
    if len(x)^len(y): raise ValueError("Number of target and input features should match")
    mean=lambda val: sum(val)/len(val)
    mx,my =mean(x),mean(y)
    print("MEAN :",mx,my)
    b1=(sum([round((xi-mx)*(yi-my),4) for xi,yi in zip(x,y)])/sum([(xi-mx)**2for xi in x]))
    print("b1 :" ,b1)
    b0=my-b1*mx
    print("b0 :",b0)
 



def predict(val):
    return [(b1*i+b0) for i in val] 


def main():
    dataset = {
        "feature": [1, 2, 3, 4, 5],
        "target": [3,4,2,4,5]
    }
    linearRegression(dataset['feature'],dataset['target'])
    
    x=[4,1,3,7,9,0,4,6,7,8,0,4,34,34,4,35,5]   #data to predict
    print("Predicted :",predict(x))




if __name__ == "__main__":
    main()
    
