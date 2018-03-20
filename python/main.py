import CSVHandeling as Handeling
import networking as net


ToPythonFileName = "ToPython.csv"
ToDelphiFileName = "ToDelphi.csv"

ToPython = Handeling.CSV(ToPythonFileName)
ToDelphi = Handeling.CSV(ToDelphiFileName)

print(ToDelphi.CSVRead())
print(ToDelphi.MsgID)