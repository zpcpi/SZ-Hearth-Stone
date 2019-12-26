import sys
import json

configFileName = 'config.json'

class ConfigManager():
    configData = {}
    hasInit = False

    def __init__(self):
        self.ReloadConfig()
        pass

    @classmethod
    def GetInstance(cls, *args, **kwargs):
        if not hasattr(ConfigManager, '_instance'):
            ConfigManager._instance = ConfigManager(*args, **kwargs)
        return ConfigManager._instance

    def ReloadConfig(self):
        try:
            ifs = open('./%s' % configFileName, 'r', encoding='utf-8')
            self.configData = json.load(ifs, strict = False)
            ifs.close()
            self.hasInit = True
        except:
            print('Load Config Failed!\n' + str(sys.exc_info()[1]))

    def GetConfig(self, configKey):
        if not self.hasInit:
            print('Error! Config manager has not been initialized.')
            return None
        if not configKey in self.configData:
            print('Warning! Can not find key in config. Key:%s' % (configKey))
            return None
        return self.configData[configKey]
