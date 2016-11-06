# trump_twitter
HackAI: Is this tweet from Donald Trump or not?

sample input 1:
?- sentiment([obamaCare,iss,a,total,disaster],android).
The result should be:
The tweet is from: Trump

sample input 2:
?- sentiment([thank,you,for,your,incredible,support],iphone).
The result should be:
The tweet is from: Team
######################
Team means Trump's team.
######################


sample input 3:
?- sentiment([obamaCare,iss,a,total,disaster],iphone).
The result should be:
The tweet is from: Team

sample input 4:
?- sentiment([thank,you,for,your,incredible,support],android).
The result should be:
The tweet is from: Team
