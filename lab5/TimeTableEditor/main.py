from PyQt5 import QtCore, QtGui
from PyQt5.QtCore import Qt, QModelIndex
from PyQt5.QtSql import QSqlRelationalTableModel, QSqlTableModel, QSqlRelation, QSqlRelationalDelegate, QSqlDatabase
from PyQt5.QtWidgets import (
    QMessageBox,
    QApplication,
    QWidget,
    QHBoxLayout,
    QVBoxLayout,
    QPushButton,
    QTableView
)
import sys
from os import environ
from typing import List


class DataframeQSortFilterProxyModel(QtCore.QSortFilterProxyModel):
    def __init__(self):
        super(DataframeQSortFilterProxyModel, self).__init__()
        # self.role = model.ValueRole

    def get(self, index, column):
        return

    def lessThan(self, left, right):
        data = [[self.sourceModel().data(index.siblingAtColumn(column)) for column in (1, 2, 5)] for index in
                (left, right)]
        if data[0][0] == "" or data[0][1] == "":
            return True
        elif data[1][0] == "" or data[1][1] == "":
            return False
        return data[0] > data[1]


class ImportSqlTableModel(QSqlRelationalTableModel):
    def __init__(self, tablename, *args, **kwargs):
        super(ImportSqlTableModel, self).__init__(*args, **kwargs)
        self.setTable(tablename)
        self.setEditStrategy(QSqlTableModel.EditStrategy.OnFieldChange)
        self.select()
        self.newRow = [''] * self.columnCount()

    def data(self, index, role=Qt.DisplayRole):
        if role == Qt.DisplayRole or role == Qt.EditRole:
            if index.row() + 1 == self.rowCount(index.parent()):
                return self.newRow[index.column()]
            return QSqlTableModel.data(self, index, role)

    def setData(self, index, value, role=Qt.EditRole):
        if not index.isValid():
            return False
        print(role, index.column(), index.row(), value)
        if role == Qt.EditRole or role == Qt.DisplayRole:
            if index.row() + 1 == self.rowCount(index.parent()):
                self.newRow[index.column()] = value
                return True
            return QSqlTableModel.setData(self, index, value, role)

    def flags(self, index):
        return Qt.ItemIsSelectable | Qt.ItemIsEnabled | Qt.ItemIsEditable

    def rowCount(self, index):
        return QSqlTableModel.rowCount(self, index) + 1

    def addRow(self, *args):
        r = self.record()
        r.setGenerated('id', False)
        for i in range(r.count()):
            r.setValue(r.fieldName(i), self.newRow[i])
        self.insertRecord(0, r)
        self.newRow = [''] * self.columnCount()
        self.select()
        self.layoutChanged.emit()

    def delRows(self, rows: List[QModelIndex]):
        for row in set(x.row() for x in rows):
            print("delete", row)
            self.removeRow(row)
        self.select()
        self.layoutChanged.emit()


class TimeTable(QWidget):
    stylebutton = "background-color : palette(window); border: 1px solid palette(dark); border-radius: 0; padding: 5px"
    stylefocus = "background-color : palette(light); border: 1px solid palette(dark); border-radius: 0; padding: 5px"

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("TimeTable Editor")
        self.resize(600, 600)
        self.palette().light()
        self.vbox = QVBoxLayout(self)
        self.hbox = QHBoxLayout()

        self.tables = ("subjects", "teachers", "timetable")
        self.tab = 0

        self.btn_tab = [QPushButton(x, self) for x in self.tables]
        for i, btn in enumerate(self.btn_tab):
            btn.setStyleSheet(self.stylebutton)
            self.hbox.addWidget(btn)
            btn.clicked.connect(lambda *args, x=i: self.setTab(x))
        self.hbox.setSpacing(0)
        self.btn_tab[self.tab].setStyleSheet(self.stylefocus)

        self.vbox.addLayout(self.hbox)
        self.view = [QTableView() for x in self.tables]
        self.model = [ImportSqlTableModel(x) for x in self.tables]

        self.model[1].setRelation(2, QSqlRelation('subjects', 'name', 'name'))
        self.model[2].setRelation(3, QSqlRelation('subjects', 'name', 'name'))

        for view, model in zip(self.view, self.model):
            view.setModel(model)
            view.resizeColumnsToContents()
            view.hide()
            model.select()

        # self.sorted = DataframeQSortFilterProxyModel()
        # self.sorted.setSourceModel(self.model[2])
        # self.view[2].setModel(self.sorted)
        # self.view[2].setSortingEnabled(True)

        self.view[1].hideColumn(0)
        self.view[2].hideColumn(0)
        self.view[1].setItemDelegate(QSqlRelationalDelegate(self.view[1]))
        self.view[2].setItemDelegate(QSqlRelationalDelegate(self.view[2]))

        self.vbox.addWidget(self.view[self.tab])
        self.view[self.tab].show()

        self.btn_add = QPushButton("+", self)
        self.vbox.addWidget(self.btn_add)
        self.btn_add.clicked.connect(lambda: self.model[self.tab].addRow())

        self.btn_del = QPushButton("-", self)
        self.vbox.addWidget(self.btn_del)
        self.btn_del.clicked.connect(lambda: self.model[self.tab].delRows(self.view[self.tab].selectedIndexes()))

    def setTab(self, id):
        if id != self.tab:
            self.btn_tab[self.tab].setStyleSheet(self.stylebutton)
            self.view[self.tab].hide()
            self.vbox.replaceWidget(self.view[self.tab], self.view[id])
            self.btn_tab[id].setStyleSheet(self.stylefocus)
            self.view[id].show()
            self.tab = id


def createConnection():
    con = QSqlDatabase.addDatabase("QPSQL")

    con.setDatabaseName(environ["POSTGRES_DB"])
    con.setHostName(environ["URL_DB"])
    con.setPort(int(environ["PORT_DB"]))
    con.setUserName(environ["POSTGRES_USER"])
    con.setPassword(environ["POSTGRES_PASSWORD"])

    if not con.open():
        QMessageBox.critical(
            None,
            "QTableView Example - Error!",
            "Database Error: %s" % con.lastError().databaseText(),
        )
        return False
    return True


app = QApplication(sys.argv)
if not createConnection():
    sys.exit(1)
win = TimeTable()
win.show()
sys.exit(app.exec_())
