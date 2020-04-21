from flask import Flask
from flask import jsonify
import urllib.request as req
from bs4 import BeautifulSoup
import re
import os
import sys

app = Flask(__name__)
app.config["DEBUG"] = True

# def getData(url):
#   request= req.Request(url, headers={
# 	  "cookie":"over18=1", "User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
#   with req.urlopen(request) as response:
# 	  data=response.read().decode("utf-8")
#   import bs4
#   root=bs4.BeautifulSoup(data, "html.parser")
#   titles=root.find_all("div", class_="title")
#   for title in titles:
# 	  if title.a != None:
# 		  print(title.a.string)
#   nextLink=root.find("a", string="‹ 上頁")
#   return nextLink["href"]

# pageURL="https://www.ptt.cc/bbs/Gossiping/index.html"
# count = 0
# while  count<5:
#     pageURL="https://www.ptt.cc"+getData(pageURL)
#     count+=1
# print(pageURL)

imgList = []
x=1

url = "https://www.gamertb.com/arena/hero-list-2/"

request= req.Request(url, headers={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
with req.urlopen(request) as response:
  data=response.read().decode("utf-8")

soup = BeautifulSoup(data, "lxml")

img_links = soup.find_all("img", {"src" : re.compile('.*?\.png')})
# img_links = soup.find_all("img")


for link in img_links:
    srcLink = link["src"]
    if 'hero' in srcLink:
        imgList.append(srcLink)
    else:
        # print('No hero')
        pass
print(imgList)

# print (len(imgList))
# print (imgList)
#下載爬完的全部圖片  addheaders網站會擋爬蟲要加這個騙過
# opener = req.build_opener()
# opener.addheaders = [("User-Agent", "Mozilla/5.0")]
# req.install_opener(opener)

# for i in imgList:
#     # local = os.path.join('/Users/neochou/Desktop/crawlerTest/%s.png' % x)
#     local = os.path.join('/Users/neochou/Downloads/SAE_data/pythonData/data_place%s.jpg' % x)
#     req.urlretrieve(i,local)
#     x+=1

# url3="https://www.gamertb.com/arena/hero-list-3/"
# request= req.Request(url3, headers={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
# with req.urlopen(request) as response:
#   data=response.read().decode("utf-8")

# soup = BeautifulSoup(data, "lxml")

# img_links = soup.find_all(["table","td"])


# for i in img_links:
#     dataList.append(i.string)
# for name in dataList:
#     if str(name) != _none :
#         heroDataList.append(name)
        
heroRaceList = ["helfgod","demon","ge","blood","green","dead","netherguest"]

# test data
herolist = {
       heroRaceList[2] :    [{"name" : "盧修斯" , "positioning" : "坦克", "intro" : "前期到後期萬用坦克，主動技團隊護盾很實用。", "firstdraw" : "★★★★★"} , 
               {"name" : "貝琳達" , "positioning" : "輸出", "intro" : "中規中距的輸出，很高的爆傷，假如配合雷恩殺死敵人，可以連鎖開主動技。", "firstdraw" : "★★★★"},
               {"name" : "瑟恩" , "positioning" : "輸出", "intro" : "主動技開下去，躲避整場，在很多關卡裡，算泛用。", "firstdraw" : "★★★★"},
               {"name" : "弗克斯" , "positioning" : "輔助、控場、輸出", "intro" : "開場放棺材鎖人，手動玩主動技能可以解掉布魯特斯的無敵狀態。", "firstdraw" : "★★★★"},
               {"name" : "羅萬" , "positioning" : "輔助", "intro" : "萬金油，什麼都有的商人。回血、能量樣樣俱全的英雄，能幫助隊伍輸出。", "firstdraw" : "★★★★★"},
               {"name" : "羅莎琳" , "positioning" : "輔助", "intro" : "跟羅萬一樣是萬金油，幫助輸出角，「家務夥伴」這技能打困難迷宮非常霸道。", "firstdraw" : "★★★★"},
               {"name" : "亨德里克" , "positioning" : "坦克", "intro" : "穩紮穩打，在前中期敵人還沒有秒殺你家坦克的時候，他是不錯的選擇。", "firstdraw" : "★★★"},
               {"name" : "愛絲特瑞達" , "positioning" : "輔助、控場、輸出", "intro" : "後期角，PVP光耀陣容常勝隊，打戰役可能有難度，其他內容還可以。", "firstdraw" : "★★"},
               {"name" : "塞西莉亞" , "positioning" : "輸出", "intro" : "塞西莉亞是一把利劍，能夠輕易突破敵人陣型，但是需要一定的保護和輔助。", "firstdraw" : "★★★"},
               {"name" : "裡格比" , "positioning" : "坦克", "intro" : "能力還不錯，但耀光裡有比他更厲害的角色，只能屈居二線。", "firstdraw" : "★★"},
               {"name" : "格溫妮絲" , "positioning" : "輸出", "intro" : "後期角，傷害不錯，搭配亞瑟王傷害會倍增。", "firstdraw" : "★★★"},
               {"name" : "雷恩" , "positioning" : "輔助、輸出", "intro" : "功能型英雄，多半用於團隊狩獵，打戰役關卡時常與貝琳達組合。", "firstdraw" : "★★"}],
       
       heroRaceList[3] : [{"name" : "布魯特斯" , "positioning" : "坦克、輸出", "intro" : "全遊戲大家最想抽到的角色，無敵狀態鎖血非常強勢、主動技傷害高。", "firstdraw" : "★★★★★"} , 
               {"name" : "克艾索斯" , "positioning" : "輸出", "intro" : "他所提供的團隊吸血很實用，傷害夠的話能中斷後排。", "firstdraw" : "★★★★"},
               {"name" : "薩菲婭" , "positioning" : "輔助、輸出", "intro" : "這位手動玩，大招很痛，能給前線坦克提供額外傷害，順便保護後排。", "firstdraw" : "★★★"},
               {"name" : "沃克" , "positioning" : "輸出", "intro" : "後期角，前期非常非常脆弱，需要花時間培養。", "firstdraw" : "★★"},
               {"name" : "斯克雷格" , "positioning" : "坦克", "intro" : "目前遊戲裡，最弱勢的神話英雄。", "firstdraw" : "★★"},
               {"name" : "沃爾克" , "positioning" : "輸出", "intro" : "後期角，前期能打出一些不錯的傷害。", "firstdraw" : "★★"},
               {"name" : "魯米蘇" , "positioning" : "輔助", "intro" : "蠻血部落的補師，圖騰能吸引炮火，戰術性。", "firstdraw" : "★★"},
               {"name" : "安丹德拉" , "positioning" : "坦克、控場、輸出", "intro" : "強力單體輸出，開場能打後排，有不錯的團控。這位英雄最怕的是對面爆發性的輸出，但只要豹女能打出第一個主動技，基本上就是連鎖效應，有很大的機率不死。", "firstdraw" : "★★"},
               {"name" : "薩忒娜" , "positioning" : "輸出", "intro" : "最強大招可輸出300%攻擊力，但有敵方生命值低於30%的限制，傷害減免的技能不錯用。", "firstdraw" : "★★"},
               {"name" : "提達斯" , "positioning" : "輸出", "intro" : "作為一個敏捷性英雄對於收割是非常有需求的，若是有一個收割那麼這個雪球就會越滚越大。", "firstdraw" : "★★"},
               {"name" : "斯克瑞斯" , "positioning" : "輔助、輸出", "intro" : "能提供不錯的傷害，還能對敵人上debuf，而且可以增加爆擊，不過偏向大後期。", "firstdraw" : "★★"}],
       
       heroRaceList[4] : [{"name" : "妮莫拉" , "positioning" : "輔助、控場", "intro" : "目前最優秀的補師，另外可以善用魅惑來抓住對面的輔助、控場。", "firstdraw" : "★★★★★"} , 
               {"name" : "塔西" , "positioning" : "輔助、控場", "intro" : "目前最頂尖控場，開場放逐敵人、主動技沈睡對面，順便傳送躲傷害。", "firstdraw" : "★★★★★"},
               {"name" : "萊卡" , "positioning" : "輔助、控場、輸出", "intro" : "開場提供加速、大招瞬間擊退、穩定輸出、額外減防，大家都愛的英雄。", "firstdraw" : "★★★"},
               {"name" : "埃隆" , "positioning" : "控場、輸出", "intro" : "功能型英雄，開場的吸人能有效打亂對面陣形。", "firstdraw" : "★★★"},
               {"name" : "高爾沃" , "positioning" : "控場、坦克", "intro" : "控場控場控場，綠裔聯盟永遠都是控場，這一位的嘲諷也不例外。", "firstdraw" : "★★★"},
               {"name" : "希瑞斯" , "positioning" : "控場、坦克", "intro" : "面對像是吸血鬼這類英雄，希瑞斯減傷算有效的，但你需要撐高血量。", "firstdraw" : "★★"},
               {"name" : "奧曼斯" , "positioning" : "輔助、坦克", "intro" : "後期角，PVP暴力回血坦克，戰役關卡用處普普。", "firstdraw" : "★★"},
               {"name" : "卡茲" , "positioning" : "坦克、輸出", "intro" : "後期角，需要培養，前中期用處不大，頂多用於困難迷宮，後期可以坦。", "firstdraw" : "★★"}],
       
       heroRaceList[5] : [{"name" : "雪米拉" , "positioning" : "控場、坦克、輸出", "intro" : "國外認定最強英雄，能坦能控能輸出（lv161後）。", "firstdraw" : "★★★★★"} , 
               {"name" : "奈拉" , "positioning" : "控場、輸出", "intro" : "能拉對面後排，主動技又可以無視布魯特斯的無敵狀態，很棒。", "firstdraw" : "★★★★"},
               {"name" : "格瑞澤爾勒" , "positioning" : "輔助、控場、坦克、輸出", "intro" : "樣樣都會，樣樣都不精通，但也因如此，他變得非常靈活，召喚物很好用。。", "firstdraw" : "★★★★"},
               {"name" : "托安" , "positioning" : "坦克", "intro" : "死掉能重生，能拖時間給後排，抽不到更好的坦克，就用這一位。", "firstdraw" : "★★★"},
               {"name" : "伊莎貝拉" , "positioning" : "輸出", "intro" : "後期角，打團隊狩獵非常強勢，但是很脆弱。", "firstdraw" : "★★"},
               {"name" : "巴登" , "positioning" : "輸出", "intro" : "後期角，打團隊狩獵非常強勢。", "firstdraw" : "★★"},
               {"name" : "法瑞奧" , "positioning" : "輔助、輸出", "intro" : "最恐怖的後期角，前中期很普通。", "firstdraw" : "★★"},
               {"name" : "甘瑟爾" , "positioning" : "控場、輸出", "intro" : "功能型英雄，但他被其他同性質的英雄蓋過。", "firstdraw" : "★★"}],
       
       heroRaceList[0] : [{"name" : "阿塔利婭" , "positioning" : "控場、輸出", "intro" : "開場能封鎖對面後排，傷害高，整體強度算是僅次於雪米拉的英雄，課長專用。", "firstdraw" : "★★（無課）,★★★★★（課金）"} , 
               {"name" : "伊萊亞＆萊拉" , "positioning" : "輔助", "intro" : "主動技防止對面控場、提供加速，能回血、提供能量，課長專用。", "firstdraw" : "★（無課）,★★★★★（課金）"},
               {"name" : "奧瑟羅斯" , "positioning" : "坦克", "intro" : "戰越久越強的角色，能暫停戰鬥的時間（秒數不減），大後期三十秒後免疫控場在 PVP 是很霸道的技能。", "firstdraw" : "★★（無課）,★★★（課金）"},
               {"name" : "塔琳" , "positioning" : "輸出", "intro" : "其技能不死鳥是真的死不了的BUG技能，本身浴火可以将血轉换為護盾，並提高输出能力，遠程變近戰。餘暉更是可以奶隊友。", "firstdraw" : "★★★★（無課）,★★★★★（課金）"},
               {"name" : "孫悟空" , "positioning" : "輔助、控場、輸出", "intro" : "猴子就前期有用，分身不繼承BUFF，分身不给本體攢能量注定只有一个大招的機會，還有半神升階困難。", "firstdraw" : "★★（無課）,★★★（課金）"}],
       
       heroRaceList[1] : [{"name" : "梅希拉" , "positioning" : "輔助、控場、輸出", "intro" : "群體魅惑非常強勢、給前排加速，外加惡魔陣營給的 30% 防禦，課長專用。", "firstdraw" : "★★★（無課）,★★★★★（課金）"} , 
               {"name" : "埃茲" , "positioning" : "輔助、控場", "intro" : "惡魔陣營給 30% 防禦，能封鎖能量又能吸引對面後排很不錯，課長專用。", "firstdraw" : "★（無課）,★★★（課金）"},
               {"name" : "左拉茲" , "positioning" : "輸出", "intro" : "吃裝備，在場上待越久越強（技能三），左拉斯的特色主要在於可以「輪迴」，重置整場戰鬥。跟往常一樣，課長專用。", "firstdraw" : "★★（無課）,★★★（課金）"},
               {"name" : "寇扎德" , "positioning" : "控場", "intro" : "冰凍效果和BUFF可以有效對付敵人，缺點血量跟防禦偏低。", "firstdraw" : "★★（無課）,★★★（課金）"},
               {"name" : "" , "positioning" : "控場", "intro" : "冰凍效果和BUFF可以有效對付敵人，缺點血量跟防禦偏低。", "firstdraw" : "★★（無課）,★★★（課金）"}],
       heroRaceList[6] : [{"name" : "亞瑟" , "positioning" : "坦克", "intro" : "群體魅惑非常強勢、給前排加速，外加惡魔陣營給的 30% 防禦，課長專用。", "firstdraw" : "★★★（無課）,★★★★（課金）"}],
}

#------------------------------------------------------------------------------------------------
allHeroList = []
allHeroDataDic = {}
#抓取每個勢力英雄清單
def allHeroData(heroListUrl, dataKeywordA,dataKeywordB,imgKeywordA,imgKeywordB):

 imgList = []
 x=1

 # url = "https://www.gamertb.com/arena/hero-list-2/"

 request= req.Request(heroListUrl, headers={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
 with req.urlopen(request) as response:
   data=response.read().decode("utf-8")

 soup = BeautifulSoup(data, "lxml")

 img_links = soup.find_all(imgKeywordA, {imgKeywordB : re.compile('.*?\.png')})

 for link in img_links:
    srcLink = link["src"]
    if 'hero' in srcLink:
        imgList.append(srcLink)
    else:
        # print('No hero')
        pass


 request4= req.Request(heroListUrl, headers={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
 with req.urlopen(request4) as response:
   data4=response.read().decode("utf-8")
 soup4 = BeautifulSoup(data4, "lxml")
 img_links4 = soup4.find_all([ dataKeywordA, dataKeywordB])
 
 dataList4 = []
 heroDataList4 = []
 heroIntroModelList = []
 for i in img_links4:
    dataList4.append(i.string)
 for name in dataList4:
    if str(name) == "None" or bool(re.search(r'\d',str(name))):
      pass
    else:
      heroDataList4.append(name)
 
 for x in range(5):
     heroDataList4.remove(heroDataList4[0])
     dataCount = int(len(heroDataList4)) / 3

 z = 0
 for t in range(int(dataCount)):
    heroDetailDic = {}
    heroDetailDic['name'] = heroDataList4[t + z]
    heroDetailDic['type'] = heroDataList4[t + z + 1]
    heroDetailDic['level'] = heroDataList4[t + z + 2]
    if t < len(imgList) :
      allHeroDataDic['Iamge'] = imgList[t]
    z = z + 2
    heroIntroModelList.append(heroDetailDic)
    
 return heroIntroModelList
#--------------------------------------------------------------------------------------------------

#takeAllHeroDataDic
for i in range(7):
  heroListUrl="https://www.gamertb.com/arena/hero-list-" + str(i+1)  
  allHeroDataDic[heroRaceList[i]] = allHeroData(heroListUrl,"table","td","img","src")
#--------------------------------------------------------------------------------------------------

@app.route('/')
def hello(): 
  return "Hello Flask"

@app.route('/herolist')
def hero():
  return jsonify(herolist)

@app.route('/heroIntro')
def intro():
  return jsonify(allHeroDataDic)

@app.route('/testlist')
def test():
  return jsonify(allHeroDataDic)


if __name__ == '__main__':
  app.run()
