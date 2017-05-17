/**
  * @author        Nandan Narasappa
  * @date          09/11/2013
  * @description   This class is a utility class which consists of static method that converts
  				   the string to a phonetic code using Metaphone algorithm which is invoked by
  				   UTIL_DeDuper method.
  */  
public with sharing class UTIL_PhoneticSearch{

    /**
      * @description       This method generates phonetic code for a string using Metaphone
                           alogorithm. It is invoked by findDuplicatesByPhonetic method in 
                           UTIL_DeDuper class 
                           
                           Metaphone Algorithm consideration :
                           1. Drop letter if next letter is the same unless it is 'C'.
                           2. Drop first letter if word begins with 'KN','GN','PN','AE','WR'.
                           3. Transform 'C' to 'X' if followed by 'IA' or 'H'.
                           4. Transform 'C' to 'S' if followed by 'I', 'E', or 'Y' otherwise transform to 'K'.
                           5. Transform 'CH' to 'K' if at the beginning.
                           6. Transform 'D' to 'J' if followed by 'GE', 'GY', or 'GI' otherwise transform to 'T'.
                           7. Drop 'G' if followed by 'H' and 'H' is not at the end or before a vowel.
                           8. Drop 'G' if followed by 'N' or 'NED' and is at the end.
                           9. Transform 'G' to 'J' if before 'I', 'E', or 'Y', and it is not in 'GG'. Otherwise, 'G' transforms to 'K'. Reduce 'GG' to 'G'.
                           10. Drop 'H' if after vowel and not before a vowel.
                           11. Transform 'CK' to 'K'.
                           12. Transform'PH' to 'F'.
                           13. Transform 'Q' to 'K'.
                           14. Transform 'S' to 'X' if followed by 'H', 'IO', or 'IA'.
                           15. Transform 'T' to 'X' if followed by 'IA' or 'IO'. 
                           16. Transform 'TH' to '0'. 
                           17. Drop 'T' if followed by 'CH'.
                           18. Transform 'V' to 'F'.
                           19. Transform 'WH' to 'W' if at the beginning.
                           20. Drop 'W' if not followed by a vowel.
                           21. Transform 'X' to 'S' if at the beginning. Otherwise, 'X' transforms to 'KS'.
                           22. Drop 'Y' if not followed by a vowel.
                           23. Transform 'Z' to 'S'.
      * @param             compareString  value of the string to be converted into metaphone code
      * @return            String
      * @throws            NA
      */  
    public static String convertToCode(String compareString){
        //Start with a string that is all uppercase
        String startStr = compareString.toUpperCase();
        String cs = UTIL_DuplicateConstants.BLANK_SPACE;  //this will be our "compare string"
        String result = UTIL_DuplicateConstants.BLANK_SPACE ; //this is our result which we will return at the end of this method      
        //check each letter in the string to see if the next letter is the same, if so, drop it, unless it is C
        for(Integer i=0;i<startStr.length()-1;i++){
            if(!startStr.substring(i,i+1).equals(startStr.substring(i+1,i+2)) || 
                startStr.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_C)){
                cs += startStr.substring(i,i+1);   
            }
        }
        //Add the last letter of the string to the cs string since we didn't get to it in the loop above
        cs += startStr.substring(startStr.length()-1, startStr.length());
        //If the word begins with 'KN', 'GN', 'PN', 'AE', 'WR', drop the first letter.
        if( cs.startsWith(UTIL_DuplicateConstants.WORD_KN) || cs.startsWith(UTIL_DuplicateConstants.WORD_GN) ||    
            cs.startsWith(UTIL_DuplicateConstants.WORD_PN) || cs.startsWith(UTIL_DuplicateConstants.WORD_AE) ||
            cs.startsWith(UTIL_DuplicateConstants.WORD_WR)){        
            cs = cs.substring(1,cs.length());
        }
        //Create a set containing the 5 vowels.  This will be used multiple times while checking for patterns
        Set<String> VOWELS = new Set<String>{UTIL_DuplicateConstants.LETTER_A,UTIL_DuplicateConstants.LETTER_E,
                                             UTIL_DuplicateConstants.LETTER_I,UTIL_DuplicateConstants.LETTER_O,
                                             UTIL_DuplicateConstants.LETTER_U};
        if(cs.endsWith(UTIL_DuplicateConstants.WORD_MB)){
            cs = cs.substring(0,cs.length()-1);
        }
        //Create integer to hold length of the compare string.  cleans up the code a little. 
        Integer cslen = cs.length();
        //loop through the string and check each letter, matching against the metaphone patters.
        for(Integer i=0;i<cslen;i++){
            //If string starts with vowel, keep it, otherwise drop it.
            if(i==0){
                for(String s : VOWELS){
                    if(cs.substring(0,1).equals(s)){ 
                        result += s;
                    }                    
                }
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_B)){
                result += UTIL_DuplicateConstants.LETTER_B;
                continue;
            }      
            //'C' transforms to 'X' if followed by 'IA' or 'H' (unless in latter case, it is part of '-SCH-', in which case it transforms to 'K').
            //'C' transforms to 'S' if followed by 'I', 'E', or 'Y'. Otherwise, 'C' transforms to 'K'.
            //CH transforms to K if at the beginning
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_C)){
                if(i < cslen-2 && cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_IA)){
                    result += UTIL_DuplicateConstants.LETTER_X;
                }
                else if(i < cslen-1 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){                      
                    if(i>0 && cs.substring(i-1,i).equals(UTIL_DuplicateConstants.LETTER_S)){
                        result += UTIL_DuplicateConstants.LETTER_K;
                        i++;                           
                    }
                    else{
                        result += UTIL_DuplicateConstants.LETTER_X;
                        i++;                            
                    }
                }
                else if(i<cslen-1 && 
                     (cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_I) ||
                      cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_E) ||
                      cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_Y))){
                              
                    if(i>0 && cs.substring(i-1,i).equals(UTIL_DuplicateConstants.LETTER_S)){
                        //do nothing and drop C, it is slient
                    }
                    else{
                        result += UTIL_DuplicateConstants.LETTER_S;
                    }                                                       
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_K;
                }
                continue;
            }
           //'D' transforms to 'J' if followed by 'GE', 'GY', or 'GI'. Otherwise, 'D' transforms to 'T'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_D)){
                if(i<cslen-2 &&(cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_GE) ||
                                cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_GY) ||
                                cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_GI))){                        
                    result += UTIL_DuplicateConstants.LETTER_J;                  
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_T;
                }
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_F)){
                result += UTIL_DuplicateConstants.LETTER_F;
                continue;
            }
            //Drop 'G' if followed by 'H' and 'H' is not at the end or before a vowel.            
            //Drop 'G' if followed by 'N' or 'NED' and is at the end.
            //'G' transforms to 'J' if before 'I', 'E', or 'Y', and it is not in 'GG'. Otherwise, 'G' transforms to 'K'. Reduce 'GG' to 'G'.                    
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_G)){
                if((i==cslen-2 && cs.substring(i,i+2).equals(UTIL_DuplicateConstants.WORD_GN)) ||
                    (i==cslen-4 && cs.substring(i,i+4).equals(UTIL_DuplicateConstants.WORD_GNED))){
                    //do nothing (ie drop G) since G is followed by N or NED and is at the end                      
                }
                else if(i==0 && cslen >2 && cs.substring(1,2).equals(UTIL_DuplicateConstants.LETTER_H) &&
                        VOWELS.contains(cs.substring(2,3))){
                    result += UTIL_DuplicateConstants.LETTER_K; //GH at the beginning should result in 'K'
                    i++;           //we know H is next and is taken care of, so skip it
                }
                else if((i<cslen-2 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H) && 
                        !VOWELS.contains(cs.substring(i+2,i+3))) || i<cslen-1 && 
                        cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){
                    //do nothing (ie drop G and H) since H is not followed by a vowel
                    i++;
                }
                else if(i<cslen-1 && (cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_I)||
                                      cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_E) ||
                                      cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_Y))){
                    result += UTIL_DuplicateConstants.LETTER_J;
                    if(cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_Y)){ //then y is considered a vowel here
                        i++;
                    }
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_K;
                }
                continue;                
            }
            //Drop 'H' if after vowel and not before a vowel.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_H)){                            
                if(i>0 && VOWELS.contains(cs.substring(i-1,i))){
                    //we have a vowel before H                    
                    if((i<cslen-1 && !VOWELS.contains(cs.substring(i+1,i+2))) || i==cslen-1){
                        //do nothing since a vowel is after H as well
                    }
                    else{
                        result += UTIL_DuplicateConstants.LETTER_H; //H is at the end or not followed by a vowel
                    }    
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_H;
                }
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_J)){
                result += UTIL_DuplicateConstants.LETTER_J;
                continue;
            }
            //'CK' transforms to 'K'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_K)){
                if(i>0 && cs.substring(i-1,i).equals(UTIL_DuplicateConstants.LETTER_C)){
                    //do nothing since the K is silent (the C was already transformed to K earlier
                }else{
                    result += UTIL_DuplicateConstants.LETTER_K;
                } 
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_L)){
                result += UTIL_DuplicateConstants.LETTER_L;
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_M)){
                result += UTIL_DuplicateConstants.LETTER_M;
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_N)){
                result += UTIL_DuplicateConstants.LETTER_N;
                continue;
            }
            //'PH' transforms to 'F'. (the H will get dropped later)
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_P)){
                if(i<cslen-1 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){
                    result += UTIL_DuplicateConstants.LETTER_F;
                    i++;                    
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_P;
                }
                continue;
            }
            //'Q' transforms to 'K'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_Q)){
                result += UTIL_DuplicateConstants.LETTER_K;
                continue;
            }
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_R)){
                result += UTIL_DuplicateConstants.LETTER_R;
                continue;
            }
            //'S' transforms to 'X' if followed by 'H', 'IO', or 'IA'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_S)){
                if( (i<cslen-1 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)) ||
                    (i<cslen-2 && (cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_IO) || 
                    cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_IA) ))){
                    
                    result += UTIL_DuplicateConstants.LETTER_X;
                    if(cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){
                      i++;
                    }              
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_S;                  
                }
                continue;
            }
            //'T' transforms to 'X' if followed by 'IA' or 'IO'. 'TH' transforms to '0'. Drop 'T' if followed by 'CH'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_T)){
                if(i<cslen-2 && (cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_IO) || 
                    cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_IA))){
                    result += UTIL_DuplicateConstants.LETTER_X;
                }
                else if(i<cslen-1 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){
                    result += UTIL_DuplicateConstants.ZERO; //this is a zero, representing 'theta'
                    i++; //TH just became 0 so drop the H is no needed.
                }
                else if(i<cslen-2 && cs.substring(i+1,i+3).equals(UTIL_DuplicateConstants.WORD_CH)){
                    //do nothing since T is followed by CH and thus gets dropped
                }
                else{
                    result += UTIL_DuplicateConstants.LETTER_T;
                }
                continue;
            } 
            //'V' transforms to 'F'.       
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_V)){
                result += UTIL_DuplicateConstants.LETTER_F;
                continue;
            }
            //'WH' transforms to 'W' if at the beginning (done earlier). Drop 'W' if not followed by a vowel.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_W)){
                if(i==0 && cslen>1 && cs.substring(i+1,i+2).equals(UTIL_DuplicateConstants.LETTER_H)){
                    result+=UTIL_DuplicateConstants.LETTER_W;
                    i++;
                }
                else if(i<cslen-1 && VOWELS.contains(cs.substring(i+1,i+2))){
                    result += UTIL_DuplicateConstants.LETTER_W;                    
                } 
                continue;               
            }
            //'X' transforms to 'S' if at the beginning. Otherwise, 'X' transforms to 'KS'.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_X)){
                if(i==0){
                    result += UTIL_DuplicateConstants.LETTER_S;
                }
                else{
                    result += UTIL_DuplicateConstants.WORD_KS;
                }
                continue;
            }
            //Drop 'Y' if not followed by a vowel.
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_Y)){
                if(i<cslen-1 && VOWELS.contains(cs.substring(i+1,i+2))){
                    result += UTIL_DuplicateConstants.LETTER_Y;                    
                }
                continue;                       
            }
            //'Z' transforms to 'S'.                
            if(cs.substring(i,i+1).equals(UTIL_DuplicateConstants.LETTER_Z)){
                result += UTIL_DuplicateConstants.LETTER_S;
                continue;
            }
        }
        return result;
    }
}