# Oracle常用知识整理

## 字符串截取函数

oracle 截取字符(substr)，检索字符位置(instr) 。常用函数：substr和instr

### 1.SUBSTR（string,start_position,[length]）求子字符串，返回字符串

**解释：**

- string 元字符串
- start_position   开始位置（从0开始）
- length 可选项，子字符串的个数

```cmd
# For example:
# substr("ABCDEFG", 0);       //返回：ABCDEFG，截取所有字符
# substr("ABCDEFG", 2);       //返回：CDEFG，截取从C开始之后所有字符
# substr("ABCDEFG", 0, 3);    //返回：ABC，截取从A开始3个字符
# substr("ABCDEFG", 0, 100);  //返回：ABCDEFG，100虽然超出预处理的字符串最长度，但不会影响返回结果，按预处理字符串最大数量返回
# substr("ABCDEFG", -3);      //返回：EFG，注意参数-3，为负值时表示从尾部开始算起，字符串排列位置不变
```

### 2.INSTR（string,subString,position,ocurrence）查找字符串位置

**解释：**

- string：源字符串
- subString：要查找的子字符串
- position：查找的开始位置
- ocurrence：源字符串中第几次出现的子字符串

```cmd
# For example:
# INSTR('CORPORATE FLOOR','OR', 3, 2)中，源字符串为'CORPORATE FLOOR', 目标字符串为'OR'，起始位置为取第2个匹配项的位置；返回结果为 14 '
```

## 输出语句：dbms_output.put_line(str);
