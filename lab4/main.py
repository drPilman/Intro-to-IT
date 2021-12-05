import sys
from PyQt5.QtWidgets import QApplication, QWidget, QLineEdit, QHBoxLayout, QVBoxLayout, QPushButton


class Digit(QPushButton):
    def __init__(self, text, parent):
        super(Digit, self).__init__(text, parent)
        self.clicked.connect(lambda: parent._button(text))


class Operation(QPushButton):
    def __init__(self, text, parent):
        super(Operation, self).__init__(text, parent)
        self.clicked.connect(lambda: parent._operation(text))


class Calculator(QWidget):
    def __init__(self):
        super(Calculator, self).__init__()
        self.op = None
        self.hbox = QHBoxLayout(self)
        self.vbox = QVBoxLayout()
        self.hbox_input = QHBoxLayout()

        self.vbox_operate = QVBoxLayout()

        self.hbox.addLayout(self.vbox)
        self.vbox.addLayout(self.hbox_input)

        self.hbox_digits = []
        self.b = [Digit(str(number), self) for number in range(10)]

        for i in range(2, -1, -1):
            layout = QHBoxLayout()
            self.hbox_digits.append(layout)
            self.vbox.addLayout(layout)
            for j in range(1, 4):
                number = i * 3 + j
                self.hbox_digits[-1].addWidget(self.b[number])

        layout = QHBoxLayout()
        self.hbox_digits.append(layout)
        self.vbox.addLayout(layout)
        self.hbox_digits[-1].addWidget(self.b[0])

        self.point = Digit('.', self)
        self.hbox_digits[-1].addWidget(self.point)

        self.input = QLineEdit(self)
        self.hbox_input.addWidget(self.input)

        self.hbox.addLayout(self.vbox_operate)

        self.oper = [Operation(s, self) for s in ('-', '+', '/', '*')]
        for i in self.oper:
            self.vbox_operate.addWidget(i)

        self.b_result = QPushButton("=", self)
        self.vbox_operate.addWidget(self.b_result)
        self.b_result.clicked.connect(self._result)

    def _button(self, param):
        line = self.input.text()
        if param == '.' and '.' in line:
            line = line[:line.index('.')]
            param = ''
        self.input.setText(line + param)

    def _operation(self, op):
        text = self.input.text().strip()
        if text and text.replace('.', '', 1).isdigit():
            self.num_1 = float(text)
            self.op = op
            self.input.setText("")

    def _result(self):
        text = self.input.text().strip()
        if text and text.replace('.', '', 1).isdigit():
            self.num_2 = float(text)
            if self.op:
                if self.op == '+':
                    self.input.setText(str(self.num_1 + self.num_2))
                elif self.op == '-':
                    self.input.setText(str(self.num_1 - self.num_2))
                elif self.op == '/':
                    if self.num_2 != 0:
                        self.input.setText(str(self.num_1 / self.num_2))
                elif self.op == '*':
                    self.input.setText(str(self.num_1 * self.num_2))


app = QApplication(sys.argv)

win = Calculator()
win.show()
sys.exit(app.exec_())
