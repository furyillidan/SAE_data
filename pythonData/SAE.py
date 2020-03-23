from bs4 import BeautifulSoup
import urllib.request as req
# import urllib
import re
from flask import jsonify
import os
import sys

imgList=[]
imgList1=['https://www.gamertb.com/arena/hero-list-2/']
x=1
#url = "https://www.gamertb.com/arena/a109"
url="https://www.gamertb.com/arena/hero-list-2/"
request= req.Request(url, headers={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"})
with req.urlopen(request) as response:
    data=response.read().decode("utf-8")

soup = BeautifulSoup(data, "lxml")

# img_links = soup.find_all("img", {"src" : re.compile('.*?\w=1050')})
img_links = soup.find_all("img")
i=0
for link in img_links:
    # print(link['src'])
    imgList.append(link['src'])
print(imgList)
#下載爬完的全部圖片  addheaders網站會擋爬蟲要加這個騙過
opener = req.build_opener()
opener.addheaders = [("User-Agent", "Mozilla/5.0")]
req.install_opener(opener)

for i in imgList1:
    #url ='https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2019/08/06/99/6657907.png&x=0&y=0&sw=0&sh=0&sl=W&fw=1050'
    local = os.path.join('/Users/neochou/Desktop/crawlerTest/%s.jpg' % (x + 10))
    req.urlretrieve(url,local)
    x+=1



    # url_list = link['src']
    # save_path = '/Users/neochou/Desktop/crawlerTest/' + 'downloadpic_' +str(i)+ '.png'
    # pic_file = req.urlopen(url_list).read()
    # f = open(save_path, 'wb')
    # f.write(pic_file)
    # f.close()
    # i = i+1
# for link in img_links:
#     print(link)
