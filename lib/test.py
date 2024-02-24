
from typing import List




def isSubsequence( s: str, t: str) -> bool:
        if s =="" :
            return True
        
        if t == "":
            return False

        i = 0
        for char in t:
            if char == s[i]:
                i +=1
                if i == len(s):
                    break
        return i == len(s)   





# Example usage:
# nums = [0,1,0,3,12]
result = isSubsequence("b","abc" )
print(result)

