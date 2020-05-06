import sys
import json
import openpyxl
import xml.etree.ElementTree as ET
from ConfigManager import ConfigManager
import HearthStoneEnums

ExcelMaxRow = 100000

class CardDataManager():
    xmlCardDataList = []
    jsonCardDataList = []
    maxCardEditorID = 0

    @classmethod
    def GetInstance(cls, *args, **kwargs):
        if not hasattr(CardDataManager, '_instance'):
            CardDataManager._instance = CardDataManager(*args, **kwargs)
        return CardDataManager._instance

    def __init__(self):
        pass
    
    def GetCardXmlParseDefine(self):
        cardXmlParseDefine = {}
        xmlPath = ConfigManager.GetInstance().GetConfig('CardXmlParseDefinePath')
        xmlTree = ET.parse(xmlPath)
        root = xmlTree.getroot()
        entitys = root.findall('attr')
        for entity in entitys:
            attrName = entity.get('Name')
            cardXmlParseDefine[attrName] = {}
            for key in entity.keys():
                cardXmlParseDefine[attrName][key] = entity.get(key)
        return cardXmlParseDefine

    def GenerateNewCardEditorID(self, entityNode):
        newID = self.maxCardEditorID + 1
        self.maxCardEditorID = newID
        return newID

    def GetEntityNodeTagNode(self, entityNode, tagName):
        for tagNode in entityNode.findall('Tag'):
            if tagNode.get('name', None) == tagName:
                return tagNode
        return None

    def CreateEmptyCardData(self):
        cardData = {}
        cardData['EditorID'] = 0
        cardData['Showname'] = ''
        cardData['DbfID'] = 0
        cardData['UID'] = ''
        cardData['Type'] = 0
        cardData['Cost'] = 0
        cardData['Atk'] = 0
        cardData['Hp'] = 0
        cardData['Armor'] = 0
        cardData['SpellPower'] = 0
        cardData['CardClass'] = 0
        cardData['Rarity'] = 0
        cardData['Race'] = 0
        cardData['IsElite'] = False
        cardData['CardText'] = ''
        cardData['TargetingArrowText'] = ''
        cardData['Artist'] = ''
        cardData['FlavorText'] = ''
        cardData['Collectible'] = False
        return cardData

    def ParseCardXml(self, cardXmlParseDefineInfo, entityNode):
        cardData = self.CreateEmptyCardData()
        for attrName in cardXmlParseDefineInfo:
            parseInfo = cardXmlParseDefineInfo[attrName]
            attrValue = None
            if 'XmlName' in parseInfo:
                attrValue = entityNode.get(parseInfo['XmlName'], None)
            elif 'TagName' in parseInfo:
                tagName = parseInfo['TagName']
                tagNode = self.GetEntityNodeTagNode(entityNode, tagName)
                if tagNode != None:
                    attrValue = tagNode.get('value', None)
            elif 'LanguageTagName' in parseInfo:
                tagName = parseInfo['LanguageTagName']
                tagNode = self.GetEntityNodeTagNode(entityNode, tagName)
                if tagNode != None:
                    zhCnNode = tagNode.find('zhCN')
                    if zhCnNode != None:
                        attrValue = zhCnNode.text
            elif 'TextTagName' in parseInfo:
                tagName = parseInfo['TextTagName']
                tagNode = self.GetEntityNodeTagNode(entityNode, tagName)
                if tagNode != None:
                    attrValue = tagNode.text
            elif 'ParseFunc' in parseInfo:
                funcName = parseInfo['ParseFunc']
                func = getattr(self, funcName)
                attrValue = func(entityNode)
            if attrValue != None:
                cardData[attrName] = attrValue
        return cardData

    def ReloadCardDataFromXml(self, xmlPath):
        cardXmlParseDefine = self.GetCardXmlParseDefine()
        self.xmlCardDataList = []
        xmlTree = ET.parse(xmlPath)
        root = xmlTree.getroot()
        entityNodes = root.findall('Entity')
        for entityNode in entityNodes:
            cardData = self.ParseCardXml(cardXmlParseDefine, entityNode)
            self.xmlCardDataList.append(cardData)

    def ReloadCardDataFromJson(self, jsonPath):
        ifs = open(jsonPath, 'r', encoding='utf-8')
        self.jsonCardDataList = json.load(ifs, strict = False)
        ifs.close()
        self.cardNameDataDict = self.GenerateDictByKey(self.jsonCardDataList, 'name')
        self.cardUIdDataDict = self.GenerateDictByKey(self.jsonCardDataList, 'id')
    
    def ReloadCardIdInfoFromExcel(self, excelPath):
        excelData = openpyxl.load_workbook(excelPath)
        cardSheet = excelData['卡牌表']
        for row in range(4, ExcelMaxRow):
            cardEditorID = cardSheet['A' + str(row)].value
            if cardEditorID == None:
                break
            cardEditorID = int(cardEditorID)
            if self.maxCardEditorID < cardEditorID:
                self.maxCardEditorID = cardEditorID

    def UpdateCardExcel(self, excelPath):
        excelData = openpyxl.load_workbook(excelPath)
        cardSheet = excelData['卡牌表']
        cardDataUIdDict = self.GenerateDictByKey(self.xmlCardDataList, 'UID')
        lastRow = 4
        # for row in range(4, ExcelMaxRow):
        #     cardEditorID = cardSheet['A' + str(row)].value
        #     if cardEditorID == None:
        #         lastRow = row
        #         break
        #     cardDbfID = cardSheet['D' + str(row)].value
        #     cardUID = cardSheet['E' + str(row)].value
        #     cardData = None
        #     if cardUID in cardDataUIdDict:
        #         cardData = cardDataUIdDict[cardUID]
        #         del(cardDataUIdDict[cardUID])
        #     if str(cardUID) in cardDataUIdDict:
        #         cardData = cardDataUIdDict[str(cardUID)]
        #         del(cardDataUIdDict[str(cardUID)])
        #     if cardData != None:
        #         if cardDbfID == None or str(cardData['DbfID']) != str(cardDbfID):
        #             cardSheet['D' + str(row)].value = cardData['DbfID']
        for cardUID in cardDataUIdDict:
            cardData = cardDataUIdDict[cardUID]
            cardSheet['A' + str(lastRow)].value = cardData['EditorID']
            cardSheet['B' + str(lastRow)].value = cardData['Showname']
            cardSheet['D' + str(lastRow)].value = cardData['DbfID']
            cardSheet['E' + str(lastRow)].value = cardData['UID']
            cardSheet['F' + str(lastRow)].value = HearthStoneEnums.CardTypeZhCN[cardData['Type']]
            cardSheet['G' + str(lastRow)].value = cardData['Cost']
            cardSheet['H' + str(lastRow)].value = cardData['Atk']
            cardSheet['I' + str(lastRow)].value = cardData['Hp']
            cardSheet['J' + str(lastRow)].value = cardData['Armor']
            cardSheet['K' + str(lastRow)].value = cardData['SpellPower']
            cardSheet['L' + str(lastRow)].value = HearthStoneEnums.CardClassZhCN[cardData['CardClass']]
            cardSheet['M' + str(lastRow)].value = HearthStoneEnums.RarityZhCN[cardData['Rarity']]
            cardSheet['N' + str(lastRow)].value = HearthStoneEnums.RaceZhCN[cardData['Race']]
            cardSheet['O' + str(lastRow)].value = cardData['IsElite'] == '1'
            cardSheet['P' + str(lastRow)].value = cardData['CardText']
            cardSheet['Q' + str(lastRow)].value = cardData['TargetingArrowText']
            cardSheet['R' + str(lastRow)].value = cardData['Artist']
            cardSheet['S' + str(lastRow)].value = cardData['FlavorText']
            cardSheet['T' + str(lastRow)].value = HearthStoneEnums.CardSetZhCN[cardData['CardSet']]
            cardSheet['U' + str(lastRow)].value = cardData['Collectible'] == '1'
            lastRow = lastRow + 1
        excelData.save(excelPath)

    def GenerateDictByKey(self, dataList, keyName):
        newDataDict = {}
        for cardData in dataList:
            if not keyName in cardData:
                print('Warning! Rebuild dict warning! No attr (%s) in data.\n%s' % (keyName, cardData))
                continue
            newDataDict[cardData[keyName]] = cardData
        return newDataDict
