import csv
import time


class CSV:
    filename = ""
    MsgID = 0

    def __init__(self, filename):
        self.filename = filename
        self.CSVAppend("PY IS ALIVE")

    def CSVRead(self):
        rows = []
        with open(self.filename, 'r') as csvfile:
            csvreader = csv.reader(csvfile)
            for row in csvreader:
                rows.append(row)
        csvfile.close()
        self.MsgID = rows[-2][0]
        # Note this is -2 because of the double line spacing bug
        return rows

    def CSVAppend(self, data):
        with open(self.filename, 'a') as csvfile:
            csvwriter = csv.writer(csvfile)
            for i in range(0, len(data)):
                row = [self.MsgID, time.time(), data]
                csvwriter.writerow(row)
                self.MsgID += 1
        csvfile.close()

    def CSVClear(self):
        csvfile = open(self.filename, "w+")
        csvfile.close()

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.CSVAppend("PY OBJ DESTROYED")
