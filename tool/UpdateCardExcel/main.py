from ConfigManager import ConfigManager
from CardDataManager import CardDataManager

# k:dbfid  v:cardData
cardDict = {}

def main():
    jsonPath = ConfigManager.GetInstance().GetConfig('HSDataJsonPath')
    if jsonPath == None:
        return
    CardDataManager.GetInstance().ReloadCardDataFromJson(jsonPath)

if __name__ == '__main__':
    main()