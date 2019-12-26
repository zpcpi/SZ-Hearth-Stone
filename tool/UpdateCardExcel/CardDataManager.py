import sys
import json

class CardDataManager():
    cardDataList = []
    cardNameDataDict = {}
    cardUIdDataDict = {}

    @classmethod
    def GetInstance(cls, *args, **kwargs):
        if not hasattr(CardDataManager, '_instance'):
            CardDataManager._instance = CardDataManager(*args, **kwargs)
        return CardDataManager._instance

    def __init__(self):
        pass

    def ReloadCardDataFromJson(self, jsonPath):
        ifs = open(jsonPath, 'r', encoding='utf-8')
        self.cardDataList = json.load(ifs, strict = False)
        ifs.close()
        self.cardNameDataDict = self.GenerateDictByKey('name')
        self.cardUIdDataDict = self.GenerateDictByKey('id')
    
    # 编号 名称 后缀 dbfid uid 类型 费用 攻击 生命 职业 品质 种族 是精英 描述 目标指向文本 画家 flavor 归类 可收集 收藏描述 提示标签 标旗 阵营 hideStats
    def UpdateExcel(self, excelPath):
        pass

    def GenerateDictByKey(self, keyName):
        newDataDict = {}
        for cardData in self.cardDataList:
            if not keyName in cardData:
                print('Warning! Rebuild dict warning! No attr (%s) in data.\n%s' % (keyName, cardData))
                continue
            newDataDict[cardData[keyName]] = cardData
        return newDataDict
