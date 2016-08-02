# 加減乘除的練習
# 井號(#)是註解不會執字
# ===================
123+456

123-456

123*456

123/456

# ===================

#丟骰子dice,丟1次
sample(1:6,1)
#丟骰子dice,丟2次
sample(1:6,2)
#丟骰子dice,丟3次
sample(1:6,4)
 
# ===================

#標準常態機率抽樣 (平均數=0,標準差=1)

# 產生100個隨機抽樣變數
rnorm(100)
# 產生299個隨機抽樣變數
rnorm(299)
# 產生999個隨機抽樣變數
rnorm(999)

# ===================
# 查詢有那些機率分配
?distribution

#如何把資料存起來?
# 觀察一下x的變化
x <- 123+456
x
x <- 123-456
x
x <- 123*456
x
x <- 123/456  
    
# 繪製直方圖
# 直方圖(次數分配圖)
# Histogram

w1 <- rnorm(10)    #產生10個常態機率隨機變數
w1plot <- hist(w1) #繪製直方圖將圖形存到變數中
plot(w1plot)       #顯示圖形

w2 <- rnorm(100)   #產生100個常態機率隨機變數
w2plot <- hist(w2) #繪製直方圖將圖形存到變數中
plot(w2plot)       #顯示圖形

w3 <- rnorm(999)   #產生999個常態機率隨機變數
w3plot <- hist(w3) #繪製直方圖將圖形存到變數中
plot(w3plot)       #顯示圖形


#套件安裝
# 請試著自行安裝套件 cowsay
install.packages("cowsay")

# 以下套件電腦教室已安裝完成
# 學員課後使用自己筆電時，把註解去除即可安裝
# 以下套件因為安裝時需時較久，所以事先請助教協助安裝完成
#install.packages("data.table)  #套件用途 ETL & 快速讀取
#install.packages("dplyr")      #套件用途 ETL
#install.packages("readxl")     #套件用途 讀取EXCEL格式
#install.packages("openxlsx")   #套件用途 輸出EXCCL格式
#install.packages("lubridate")  #套件用途 時間格式處理


# 如何查詢套件用途?
?cowsay # 此套件功能較簡單，所以沒有專屬文件檔
?data.table
?dplyr
?readxl # 此套件功能較簡單，所以沒有專屬文件檔
?lubridate
# 或
help(cowsay) # 此套件功能較簡單，所以沒有專屬文件檔
help(data.table)
help(dplyr)
help(readxl)# 此套件功能較簡單，所以沒有專屬文件檔
help(lubridate)



###
library("cowsay")
say("R 超好玩 deR!")


###
 
say("R 超好玩 deR!","cow")

say("R 超好玩 deR!","smallcat")

say("R 超好玩 deR!","ghost")
# 觀察一下你看到了什麼
# 想一想，為什麼要使用參數呢?
# 想一想，如果沒有參數的話，會怎麼樣?


# 資料型態，主要分為2種  數字與文字
# 以下範例為 Atomic Vector
# 文字
my_name <- "KA"
# 數字
microsoft_mouse_price <- 699 

# Atomic Vector

# 假設你是一個冰店的老闆
# 販賣以下三種冰品
ice <-  c("紅豆","巧克力","香草")
# 價格分格為
price <- c(30,35,20)
# 銷售額分別為
sales <-   c(2,7,6)

# 這種一個變數中存著不只一個數字，就是向量
# 注意，向量中只能存同種型態的資料
# 方法一
30*2+35*7+20*6

# 方法二
# 計算營業額
# 第一步 算出 30*2  35*7 20*6
price*sales 
# 計算總營業額，使用sum 加總
sum(price*sales)

# 多了一個產品(新增芒果冰的銷售)
ice <-  c("紅豆","巧克力","香草","芒果")
price <- c(30,35,20,79)
sales <-  c(2,7,6,9)

# 方法一
30*2+35*7+20*6+79*9

# 方法二 
# 計算營業額
price*sales 
# 計算總營業額
sum(price*sales)

# 建立你的第一個data.frame
sale_info <- data.frame(
ice  ,
price ,  
sales  , stringsAsFactors = FALSE)
# 確認是否建立成功
sale_info

# 找出最高的銷售額的品名
sale_info$price * sale_info$sales
# 先算出每筆的營業額?
# 想一想 60是指?
# 想一想 711是指?

#最高的營額額是?
max(sale_info$price * sale_info$sales)
#位置是在?
# 在R中起始值是由1開始起算(例:在PYTHON中是由0開始起算)
which.max(sale_info$price * sale_info$sales)
# 則營業額最高的是
sale_info[which.max(sale_info$price * sale_info$sales),]

# data.frame 基本操作
# 
# 資訊抽取

sale_info
sale_info[1,2] #捉出第1個ROW，第2個欄位內的資料
sale_info[1,3] #捉出第1個ROW，第3個欄位內的資料
sale_info[2,]  #捉出第2個ROW
sale_info[sale_info$ice == "巧克力",]  #捉出第2個ROW
sale_info[sale_info$price >  25 ,]    # 價格大於25元
sale_info[sale_info$price >  40 ,]    # 價格大於40元
sale_info[,"ice"] #選擇品名欄位
sale_info[,"sales"] #選擇銷售額欄位
sale_info[,"price"] # 選擇價格欄位
sale_info[,c("price","ice") ] # 選擇價格欄位、品名欄位

# 確認資料結構 str
str(sale_info)
# 資料結構應該如下
# 'data.frame':	4 obs. of  3 variables:
#   $ ice  : chr  "紅豆" "巧克力" "香草" "芒果"
# $ price: num  30 35 20 79
# $ sales: num  2 7 6 9




# 資料變更
# 紅豆冰原價30元，價格調漲5元
sale_info[1,2] <- 35
sale_info
# 紅豆冰原價30元，價格調漲5元，調回原價
sale_info[1,2] <- 30
sale_info

# 建立新欄位 銷售額(營收)
sale_info$revenue <- sale_info$price * sale_info$sales
sale_info
# 單項產品營收大於200元
sale_info$revenue > 200
sale_info[ sale_info$revenue > 200 ,]

# 資料排序, 升序排列
order(sale_info$price)
sale_info[  order(sale_info$price), ]


# 將排序後的結果儲存
sale_info <- sale_info[ order(sale_info$price), ]
# 補充降序排列
sale_info[  order(sale_info$price ,decreasing =TRUE),]

## 後續將介紹 dplyr 
## 部份資料操作將會更簡單

# 移除欄位 revenue 
sale_info$revenue <- NULL

# 移除資料紀錄(不要選資料紀錄)
# 移掉巧克力的紀錄(ICE不要巧克力)
# 多用filter (少用) 不要教這個
# sale_info <- sale_info[ -2,] 
# 移掉巧克力、香草的紀錄(ICE不要巧克力、香草)
# sale_info[ -c(2,3) ,] 

# 建立你的第一個data.frame (備註:資料復原)
sale_info <- data.frame(
  ice  ,
  price ,  
  sales  , stringsAsFactors = FALSE)

# 使用WINDOWS進行讀取，需要指定編碼
# WINDOWS不直接支援UTF8

class.point <- read.csv("class_points.csv",encoding = "big5")

# read Excel File
# 使用 xlsx 可以避開 Excel 中無法直接存取UTF8 CSV中文編碼的問題
library(readxl)
class.point <- read_excel("class_points.xlsx")
# MAC/WINDWSOWS 

# 繪製全班的次數分配圖(直方圖)
hist(class.point$Point)
# 課後作業
# 選取分數高於60分的同學姓名
more60 <-  class.point[class.point$Point > 60, 2]
more50 <-  class.point[class.point$Point > 50, 2]

# 看前幾筆資料 head,預設輸出前6筆資料
head(class.point) 
# 看後幾筆資料 tail,預設輸出最後6筆資料
tail(class.point)

# 有幾筆(n)資料(row) nrow
nrow(class.point)
# 有幾欄呢 ncol
ncol(class.point)

# 將資料輸出
# 輸出成CSV
write.csv(more60 , "more60.csv")

# 補充教材
# 如果要輸出好幾個SHEET的狀況
l <- list("more50" = more50, "more60" = more60)
write.xlsx(l, "multi_sheet.xlsx")

# 輸出成EXCEL
library(openxlsx)
# windows 有時需要調整ZIP所在目錄
# ubuntu 有時也需要
# MAC不用設定
Sys.setenv(R_ZIPCMD= "C:/Rtools/bin/zip")

write.xlsx(more60 , "more60.xlsx")




# 補充教材，在R中讀取超大資料檔 fread
# data.table 可與 dplyr 混用
library(data.table)
test.data <- fread("train.csv")

# 課後作業，將上述所教授過的指令套用試試看


### pipeline 介紹

library(readxl)
class.point <- read_excel("class_points.xlsx")

# 分數大於60分的是那些人?
class.point %>% filter(Point > 60) %>% select(name)  %>% View
# 分數大於60分的是那些人,分數多少?
class.point %>% filter(Point > 60) %>% select(name,Point)  %>% View



# 傳統寫法
View(class.point[class.point$Point>60,"name" ])
View(class.point[class.point$Point>60, c("name","Point") ])


# 分數大於60分的有幾人且小於90的有幾人?
class.point %>% filter(Point > 60 & Point < 90 ) %>% nrow

# 分數大於60分的有幾人且小於90的是那些人?
class.point %>% filter(Point > 60 & Point < 90 ) %>% select(name)%>% View

# 傳統寫法
View(class.point[class.point$Point>60 & class.point$Point < 90 ,"name" ])

# ==========================
## 星巴克範例

# 讀取檔案
library(data.table)
library(dplyr)

star_01_menu <- fread("tca_data/01_star/01_big5/star_01_menu.csv")
star_02_store <- fread("tca_data/01_star/01_big5/star_02_store.csv")
star_03_order_main <- fread("tca_data/01_star/01_big5/star_03_order_main.csv")
star_04_order_detail <- fread("tca_data/01_star/01_big5/star_04_order_detail.csv")

# 5大動詞 示範
# 選擇需要的欄位 產名名稱
star_01_menu %>% select(product_item , price ) 

# 卡路里最高的飲料是?
star_01_menu %>% arrange(calorie) %>%  select(product_item,calorie) %>% tail(1)
# 價格高於150元的飲料有那些 
star_01_menu  %>% filter(price > 150 ) %>% select(product_item , price)

# 選出"咖啡"的飲料，有那些
star_menu %>% filter(  product %like% '星冰樂'  )  %>% select(product ) %>% unique 

# 選出"瑪奇朵"的飲料，有幾種
star_menu %>% filter(  product %like% '瑪奇朵'  )  %>% select(product ) %>% unique 

# 星巴克的總店數
star_02_store %>% nrow

# 顯示店名與電話
star_02_store %>% select(star_store, star_phone)
# 顯示店名與電話 , 只顯示"02-"開頭的電話
star_02_store %>% select(star_store, star_phone) %>%  filter( star_phone %like%  "02-")

# 顯示店名、地址、電話 , 只顯示地址帶有"淡水"的店名
star_02_store %>% select(star_store, star_address , star_phone) %>%  filter( star_address %like%  "淡水")


# 99 個郵遞區號
star_02_store %>% group_by(zip_code) %>%
  summarise( n()  ) 
 
# 99 個郵遞區號,列出顯示
star_02_store %>% group_by(zip_code) %>% summarise( n()  ) %>% View

# 99 個郵遞區號,列出顯示，為新欄位取名字
star_02_store %>% group_by(zip_code) %>% summarise( mycount = n()  )  

# 那個地區的星巴克最多數量的前3名?
star_02_store %>% group_by(zip_code) %>%
  summarise( mycount = n()  )  %>% arrange(-mycount) %>%
  head(3)

# 全台灣那些有展店(郵遞區號)的星巴克數量只有1間?
star_02_store %>% group_by(zip_code) %>% 
  summarise( mycount = n()  ) %>% filter(mycount = 1  )  
# 郵遞區號 200是那個地區呢?
star_02_store %>% filter( zip_code == "200")

# 星期的銷量?
# 轉換日期為時間格式
star_03_order_main %>% str

star_03_order_main$order_date <- as.Date(star_03_order_main$order_date )  
# 以星期做集群  -- 要再順一下
star_03_order_main %>%  group_by( weekdays(order_date)) %>% summarise( day_count = n() %>% arrange( - day_count)  

# 以月份做集群  
star_03_order_main %>%  group_by( months(order_date)) %>% summarise( day_count = n()) %>% arrange( - day_count) 

# 以月份+星期做集群 (此時中間要夾個 ungroup)
star_03_order_main %>%  group_by( months(order_date) ,weekdays(order_date) ) %>% summarise( day_count = n()) %>% ungroup %>% arrange( - day_count) 

#star_03_order_main %>%  group_by( months(order_date) ,weekdays(order_date) ) %>% summarise( day_count = n())   %>% arrange( - day_count) 


# 星期的效應比月份的效應強





# 連結 JOIN
# 左連結範例1
star_join_1 <- left_join( star_03_order_main , star_02_store , by = "store_id")  

# 左連結範例2
star_join_2 <- left_join( star_03_order_main , star_04_order_detail , by = "order_id")  %>% left_join( . , star_01_menu , by = "product_id")

# 左連結範例3
star_join_3 <- left_join( star_03_order_main , star_04_order_detail , by = "order_id")  %>% left_join( . , star_01_menu , by = "product_id") %>% left_join(., star_02_store , by = "store_id") 

star_join_3



# 不同品項購買的杯量會不同嗎?
star_join_3 %>% group_by( cup_size) %>% summarise( n())

# cup_size   n()
# (chr) (int)
# 1     中杯 48882
# 2     大杯 29660
# 3   特大杯 18684
# 4     小杯  2773

# 中杯的品項都是些什麼呢?
# 咖啡?
# 星冰樂?
# 摩卡?
star_join_3 %>% filter( cup_size == "中杯" & product %like% "咖啡")   %>% nrow
star_join_3 %>% filter( cup_size == "中杯" & product %like% "星冰樂")   %>% nrow
star_join_3 %>% filter( cup_size == "中杯" & product %like% "摩卡")    %>% nrow
# 你的答案是

# 營業總額是多少呢
star_join_3 %>% summarise( sum(price* sale_n))
  
# 那一種產品最受歡迎，賣出數量?總銷售額?
# 看法1:數量
star_join_3 %>% group_by( product) %>%  summarise( revenue =  sum(price* sale_n),  my_count=n())%>% arrange(-revenue)
# 看法2:銷售量
star_join_3 %>% group_by( product) %>%  summarise( revenue =  sum(price* sale_n),  my_count=n())%>% arrange(-my_count )



# 

