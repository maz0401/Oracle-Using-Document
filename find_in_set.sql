--------------------------------------------------------
--  DDL for Function FIND_IN_SET
--  在一个字符串序列中piv_str2，判断是否含有字符串piv_str1
--  字符串序列根据p_sep分割，默认使用','分割
--  如果包含判断字符串，返回1
--------------------------------------------------------


  CREATE OR REPLACE FUNCTION "FIND_IN_SET" (piv_str1 varchar2, piv_str2 varchar2, p_sep varchar2 := ',')
RETURN NUMBER IS
  l_idx    number:=0; -- 用于计算piv_str2中分隔符的位置
  str      varchar2(500);  -- 根据分隔符截取的子字符串
  piv_str  varchar2(500) := piv_str2; -- 将piv_str2赋值给piv_str
  res      number:=0; -- 返回结果
BEGIN
-- 如果piv_str中没有分割符，直接判断piv_str1和piv_str是否相等，相等 res=1
IF instr(piv_str, p_sep, 1) = 0 THEN
   IF piv_str = piv_str1 THEN
      res:= 1;
   END IF;
ELSE
-- 循环按分隔符截取piv_str
LOOP
    l_idx := instr(piv_str,p_sep);
-- 当piv_str中还有分隔符时
      IF l_idx > 0 THEN
   -- 截取第一个分隔符前的字段str
         str:= substr(piv_str,1,l_idx-1);
   -- 判断 str 和piv_str1 是否相等，相等 res=1 并结束循环判断
         IF str = piv_str1 THEN
           res:= 1;
           EXIT;
         END IF;
        piv_str := substr(piv_str,l_idx+length(p_sep));
      ELSE
   -- 当截取后的piv_str 中不存在分割符时，判断piv_str和piv_str1是否相等，相等 res=1
        IF piv_str = piv_str1 THEN
           res:= 1;
        END IF;
        -- 无论最后是否相等，都跳出循环
        EXIT;
      END IF;
END LOOP;
-- 结束循环
END IF;
-- 返回res
RETURN res;
END FIND_IN_SET;
