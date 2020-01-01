from ConfigManager import ConfigManager
from CardDataManager import CardDataManager

# k:dbfid  v:cardData
cardDict = {}

def main():
    xmlPath = ConfigManager.GetInstance().GetConfig('HSDataXmlPath')
    cardExcelPath = ConfigManager.GetInstance().GetConfig('CardExcelPath')
    excelPath = ConfigManager.GetInstance().GetConfig('CardExcelPath')
    if xmlPath == None or cardExcelPath == None or excelPath == None:
        print('Error! Config error!', 'xmlPath:', xmlPath, 'cardExcelPath:', cardExcelPath, 'excelPath:', excelPath, sep='\t')
        return
    CardDataManager.GetInstance().ReloadCardIdInfoFromExcel(excelPath)
    CardDataManager.GetInstance().ReloadCardDataFromXml(xmlPath)
    CardDataManager.GetInstance().UpdateCardExcel(excelPath)

if __name__ == '__main__':
    main()