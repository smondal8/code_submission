<%!
    public char[] string_tochar(String str)//Trims the string into char delimiting |
	{
	char result[] = new char[17];
    int startindex=0;
    int endindex=0;
    int count = 0;
    while(count<=16)
    {
        if(str.charAt(endindex)=='|')
        {
           
            result[count]=str.charAt(startindex);
            startindex = ++endindex;
			count++;
        }
        else
        {
            endindex++;
        }
    }
	return result;
	}
	public String [] string_toStringArray(String str)//Trims the string into char delimiting | ...............soumya
	{
		String [] result = new String[17];
		int count = 0;
		int firstindex = 0;
		int endindex = 0;
		 while(count<=16)
    	{
        	if(str.charAt(endindex)=='|')
        	{
				result[count] = str.substring(firstindex,endindex);
				firstindex = ++endindex;
				count++;
			}
			else
			{
				endindex++;
			}
		}
		return result;
	}
%>