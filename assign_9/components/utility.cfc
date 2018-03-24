component  output="false"
{
	public string function generateCaptcha(numeric characters="5")
	 output="false"
	{
		var local.Chars = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9'];
		var local.toReturn = '';
		
		for(var i=1;i < arguments.characters;i++)
		{
			var local.randNum = randRange(1, local.maxLength);
			var local.letters = local.Chars[local.randNum];
			local.toReturn = local.toReturn&local.letters;
		}
		return toReturn;
	}

}