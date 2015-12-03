Amber_ntu_ror_261_quiz2

1.
a = 1   #	設a的值為1
@a = 2  #	a的instant variable（實例變數）為5
@@a = 5 #	a的class variable（類別變數）為5 
user = User.new #	有一個class（模版類別）叫user 用這模版產生一個新的物件為User (實體衍生類別)
user.name   # 呼叫user這個class的name. Use getter method to get the value/attribute of object
user.name = "Joe"   #指定user這個class的name是Joe. Use setter method to set the value/attribute to "Joe"


2.
什麼是 module? 請寫一段程式碼說明一個 class 要如何使用一個 module 裡面的 method?

Answer:
Ruby 的模組 (module) 與類別(class)相似，除了：
模組並沒有實例。
模組並沒有子類別。
模組由 module ... end 定義。

模組 Module類別 是Class類別的父類別。
類別 其實是 模組 的後代，是繼承自 模組 的。
一個是用 module 來定義，一個是用 class 來定義
module像是一個工具箱，假設今天的class有許多方法，若不想特別花時間去寫，只想要使用那些方法，可以用這個已經寫好的工具箱，將這些方法包括進去。

module CodindModule
  def code
    puts "I can code!"
  end
end

class Student
  include CodindModule
end

amber = Student.new
amber.code   # I can code!


3.
請說明 class 和 instance variable 之間的差別

Answer:
class 是一個類別
instance variable（實例變數 ）：若今天new出一個物件 那instance variable就是綁定到此物件，但並不會全套用到此類別class底下
instance variable 以 @ 開頭，作用域僅限定於 self 指示的物件。即使是屬於同一類別的兩個不同物件，他們的實例變數也允許具有不同的值。
class variable 則是綁定在此class類別本身，屬於此類別模版本身的資料


4.
如果今天我為一個叫 User 的 class 產生一個新物件的方式是:
User.new("Bob", "male", "Engineer")
請寫出 User class 的 initialize method

Answer:
class User
  def initialize(name, gender, title)
    @name = name
    @gender = gender
    @title = title
  end
end


5.
self 在： 
a. class 裡，method 外面 
b. class 裡，instance method 裡 分別是指向什麼?

Answer:
a. 代表該模板(class)本身的變數與方法 在class內定義method時加上self代表要直接取用class
b. 屬於被實體化的物件(object/instance)自己的變數與方法


6.
attr_accessor 的功能是什麼
Answer:
物件導向下 不會去操作instance variable 
因此通常會作 getter and setter method
用attr_accessor宣告 會更方便

用下面一段語法舉例

class Student
  def initialize(school)
    @school = school
  end

  person = Student.new(112)

  def school
    return @school  
  end

  def school=(new_school)
    @school = new_school
  end
end

91~893行會回傳 @ school 是getter
95~97行會設定 @ school 是setter
而使用而 attr_accessor 則會自動產生 getter 及 setter。

class Student
  attr_accessor :school
  def initialize(school)
    @school = school
  end
end

person = school.new(112)
puts person.school    #=> 112
person.school = 112
puts person.school    #=> 112


7.
請說明 public 和 private method 之間的不同

Answer:
一般的宣告方法 可以在new出一個物件的時使用他
而private method則只能在限定的class下使用到
def secret_method
其他方法不可呼叫或是使用



8.
Ruby 是如何確保一個 module 的 method 會被 include 它的 class 使用到？ (提示：method lookup)

Answer:
若在一個模版下呼叫其模版沒有定義的方法時 RUBY會呼叫其祖先
使用
    puts Object.ancestors 

一直查找上去 直到最原始的物件
而往上找到有其方法 最靠近自己的第一個上層
順序: 最新的-->所使用的module-->繼承的parent_method-->Object-->Kernal-->BasicObject


