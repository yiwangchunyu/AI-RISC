import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator


def sigmoid(x):
    return 1/(1+np.exp(-x))

def softmax(z):
    t = np.exp(z)
    a = np.exp(z) / np.sum(t, axis=1).reshape(-1,1)
    return a

class DataLoader():
    def __init__(self,filename='dataset.txt',batch_size=16, shuffle=True, train=True, train_ratio=0.7):
        self.filename=filename
        self.batch_size=batch_size
        self.inputs,self.labels=self.load_data()
        if shuffle:
            self.shuffle()
        if train:
            self.inputs, self.labels = self.inputs[:int(self.inputs.shape[0]*train_ratio)],\
                                       self.labels[:int(self.labels.shape[0]*train_ratio)]
        else:
            self.inputs, self.labels = self.inputs[int(self.inputs.shape[0] * train_ratio):], \
                                       self.labels[int(self.labels.shape[0] * train_ratio):]
        self.length = self.inputs.shape[0] // self.batch_size


    def shuffle(self):
        shuffle_ix = np.random.permutation(np.arange(len(self.labels)))
        self.inputs = self.inputs[shuffle_ix]
        self.labels = self.labels[shuffle_ix]

    def load_data(self):
        inputs = []
        labels = []
        with open(self.filename, 'r') as f:
            for line in f:
                row = line.split()
                labels.append(int(row[-1]))
                inputs.append(list(map(float, row[:-1])))
        return np.array(inputs), np.array(labels)-1

    def __iter__(self):
        self.id = 0
        return self

    def __next__(self):
        if self.id<self.length:
            inputs = self.inputs[self.id*self.batch_size:(self.id+1)*self.batch_size]
            labels = self.labels[self.id * self.batch_size:(self.id + 1) * self.batch_size]
            self.id+=1
            return inputs,labels
        else:
            raise StopIteration


class Net():
    def __init__(self, input_size=8, hidden_size=32, bias=True, num_class=4, lr = 1):
        self.hidden_size = hidden_size
        self.input_size=input_size
        self.num_class=num_class
        self.bias=bias
        self.lr=lr
        # self.W0=np.zeros((self.input_size, self.hidden_size))
        # self.W1 = np.zeros((self.hidden_size,self.num_class))
        self.W1 = np.random.rand(self.hidden_size,self.num_class)
        self.W0 = np.random.rand(self.input_size, self.hidden_size)

        # self.b0=np.zeros((1,self.hidden_size))
        # self.b1=np.zeros((1,self.num_class))
        self.b0 = np.random.rand(1, self.hidden_size)
        self.b1 = np.random.rand(1, self.num_class)
        self.activate=sigmoid

    # compute cross entropy loss
    def loss(self,a,y,reduction='mean'):
        self.y = np.eye(self.num_class)[y] # onehot
        loss = -np.sum(self.y*np.log(a),axis=1)
        if reduction=='mean':
            loss = np.sum(loss) / self.y.shape[0]
        return loss

    def forword(self,x): # x: batch_size x 8
        self.x=x
        self.g = self.x.dot(self.W0)+self.b0
        self.g_act = self.activate(self.g)
        self.z = self.g_act.dot(self.W1) + self.b1
        self.a = softmax(self.z)
        return self.a

    # calculate gradients
    def backword(self,y):
        self.y = np.eye(self.num_class)[y] # onehot
        self.grad_z=self.a-self.y
        self.grad_W1=self.g_act.T.dot(self.grad_z)/self.x.shape[0]
        self.grad_g_act=self.grad_z.dot(self.W1.T)
        self.grad_g=self.g_act*(1-self.g_act)*self.grad_g_act
        self.grad_W0=self.x.T.dot(self.grad_g)/self.x.shape[0]
        if self.bias:
            self.grad_b1=self.grad_z.copy()
            self.grad_b0 = self.grad_g.copy()

    # update params (gradient descent)
    def step(self, lr_shrink=1):
        lr=lr_shrink*self.lr
        self.W0=self.W0-lr*self.grad_W0
        self.W1 = self.W1 - lr * self.grad_W1
        if self.bias:
            self.b0=self.b0-lr*self.b0
            self.b1 = self.b1 - lr * self.b1

    def __call__(self, x):
        return self.forword(x)

def train():
    train_Loader=DataLoader()
    test_Loader = DataLoader(train=False)
    net=Net()
    train_losses,test_losses=[],[]
    pos,best_acc,accs=0,0,[]
    lr_shrink = 1
    for epoch in range(n_epoch):
        train_loss,test_loss=0,0
        if (epoch+1)%100==0:
            lr_shrink*=0.5
        for i,(inputs,labels) in enumerate(train_Loader):
            outputs=net(inputs)
            loss=net.loss(outputs,labels)
            train_loss+=loss
            net.backword(labels)
            net.step(lr_shrink)
        # test
        correct=0
        for i,(inputs,labels) in enumerate(test_Loader):
            outputs=net(inputs)
            loss=net.loss(outputs,labels)
            test_loss+=loss
            preds = np.argmax(outputs,axis=1)
            correct += (preds==labels).sum()

        # logging...
        train_loss/=train_Loader.length
        test_loss/=test_Loader.length
        train_losses.append(train_loss)
        test_losses.append(test_loss)
        acc=correct/(test_Loader.length*test_Loader.batch_size)
        if acc>best_acc:
            best_acc=acc
            pos=len(accs)-1
        accs.append(acc)
        print("epoch:%d, train_loss:%f, test_loss:%f, acc=%f (%d,%d), best_acc:%f" % (
            epoch, train_loss, test_loss,
            acc, correct, test_Loader.length*test_Loader.batch_size,best_acc))

    print('best accuracy:', best_acc)

    #plot
    fig = plt.figure()
    ax1 = fig.add_subplot(111)
    plot11=ax1.plot(np.arange(0,len(train_losses)),train_losses
                    ,linewidth = '2',label='TrainLoss')
    plot12=ax1.plot(np.arange(0, len(test_losses)), test_losses
                    ,linewidth = '2',linestyle='--', label='TestLoss')
    ax1.set_xlabel('Epoch')
    ax1.set_ylabel('Loss')

    ax2 = ax1.twinx()
    plot2=ax2.plot(np.arange(0, len(accs)), accs
                   ,color='g',linewidth = '2',linestyle='-', label='Accuracy')
    ax2.set_ylabel('Accuracy')
    ax2.set_ylim(0,1)
    y_major_locator = MultipleLocator(0.1)
    ax2.yaxis.set_major_locator(y_major_locator)
    ax2.annotate('%f'%(best_acc),(pos,best_acc)
                 ,xytext=(n_epoch*0.8,0.8),weight='heavy',color='g',
                 arrowprops=dict(arrowstyle='->'))
    ax2.scatter(pos,best_acc,color='r',marker='^')
    lines=plot11+plot12+plot2
    ax1.legend(lines, [l.get_label() for l in lines],loc='center right')
    plt.savefig('loss.pdf', dpi=300)
    plt.show()

n_epoch=400
if __name__=="__main__":
    train()